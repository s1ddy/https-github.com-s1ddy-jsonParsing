//
//  ArticleDetailViewController.m
//  JSONparsing
//
//  Created by Student-004 on 04/02/18.
//  Copyright © 2018 felix. All rights reserved.
//

#import "ArticleDetailViewController.h"

@interface ArticleDetailViewController ()

@end

@implementation ArticleDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = [self.dictDetail valueForKey:@"author"];
    _lblAuthor.text = [self.dictDetail valueForKey:@"author"];
    _lblTitle.text = [_dictDetail valueForKey:@"title"];
    _lblDescription.text = [_dictDetail valueForKey:@"description"];
    _lblUrl.text = [_dictDetail valueForKey:@"url"];
    _lblUrltoImg.text = [_dictDetail valueForKey:@"urlToImage"];
    _lblPublished.text =[_dictDetail valueForKey:@"publishedAt"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
