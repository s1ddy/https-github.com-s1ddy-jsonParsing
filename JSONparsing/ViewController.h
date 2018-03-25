//
//  ViewController.h
//  JSONparsing
//
//  Created by Student-004 on 03/02/18.
//  Copyright © 2018 felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleTableViewCell.h"
#import "ArticleDetailViewController.h"


@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSArray *arrArticles;
}
@property (weak, nonatomic) IBOutlet UITableView *tblarticles;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;



@end

