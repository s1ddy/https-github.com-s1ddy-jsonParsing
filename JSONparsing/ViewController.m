//
//  ViewController.m
//  JSONparsing
//
//  Created by Student-004 on 03/02/18.
//  Copyright © 2018 felix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *strurl = @"https://newsapi.org/v1/articles?source=techcrunch&apiKey=efe99de73d1d49608eb3d4e87c536b26";
    [self JSONParsing:strurl];
    self.title = @"json";
    

    // Do any additional setup after loading the view, typically from a nib.
    }
-(void) JSONParsing:(NSString *)strURL{
    dispatch_async(dispatch_get_main_queue(), ^{[_activityIndicator startAnimating];
    });

    

    NSURL *url = [NSURL URLWithString:strURL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_activityIndicator stopAnimating];
            _activityIndicator.hidden = YES;
            
            
            

        });
               if (error) {
                   UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:(error.localizedDescription) preferredStyle:UIAlertControllerStyleAlert];
                   UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                       [self dismissViewControllerAnimated:YES completion:nil];
                       
                   }];
                   [alert addAction:action];
                   [self presentViewController:alert animated:YES completion:nil];
        
            NSLog(@"%@",error.localizedDescription);
            
        }else if (data != nil){
            NSError *errjson;
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&errjson];
            if (errjson ==nil) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Sucess" message:@"parse sucessfully" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [self dismissViewControllerAnimated:YES completion:nil];
            
                //NSLog(@"%@",dict);
                arrArticles = [dict valueForKey:@"articles"];
                if (arrArticles.count>0) {
                    _tblarticles.delegate = self;//to call delegate for that obj
                    _tblarticles.dataSource = self;//to call delegate for that obj
                    dispatch_async(dispatch_get_main_queue(), ^{[_tblarticles reloadData];
                    });
                }
                }];
                    [alert addAction:action2];
                    NSLog(@"%@",dict);
                    [self presentViewController:alert animated:YES completion:nil];
                    
                }
            }
        
    }];
    [task resume];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return arrArticles.count;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 111;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ArticleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"articleCell"];
    
    if (cell == nil) {
        cell = [[ArticleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"articleCell"];
    }
    NSDictionary *dict = [arrArticles objectAtIndex:indexPath.row];
    NSString *strAuthor = [dict valueForKey:@"author"];
    cell.LblTitle.text = strAuthor;
    NSString *strDesc = [dict valueForKey:@"description"];
    cell.LblDescription.text = strDesc;
    cell.Imgvw.layer.borderWidth = 1;
    cell.Imgvw.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.Imgvw.layer.cornerRadius = cell.Imgvw.frame.size.width/2;
    cell.Imgvw.clipsToBounds = YES;
    NSString *strurl = [dict valueForKey:@"urlToImage"];
   // NSURL *url = [NSURL URLWithString:strurl];
    //NSData *data = [[NSData alloc]initWithContentsOfURL:url];
    //cell.Imgvw.image = [UIImage imageWithData:data];
    [self ImageDownload:cell.Imgvw withPath:strurl];
   
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",(long)indexPath.row);
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ArticleDetailViewController *vc2 = [story instantiateViewControllerWithIdentifier:@"ArticleDetailViewController"];
    vc2.dictDetail = [arrArticles objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:vc2 animated:YES];
    
}

-(void)ImageDownload:(UIImageView *)imgv withPath:(NSString *)strPath{
    NSURL *url = [NSURL URLWithString:strPath];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDownloadTask *dwntask = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            imgv.image = [UIImage imageNamed:@"15578b32c6988ab.jpg"];
        }
        else{
            NSData *data = [[NSData alloc]initWithContentsOfURL:location];
            dispatch_async(dispatch_get_main_queue(),^{
                imgv.image = [UIImage imageWithData:data];
                
            });
        }
        
                                         }];
    [dwntask resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
