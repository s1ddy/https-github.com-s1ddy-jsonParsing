//
//  ArticleDetailViewController.h
//  JSONparsing
//
//  Created by Student-004 on 04/02/18.
//  Copyright © 2018 felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblAuthor;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@property (weak, nonatomic) IBOutlet UILabel *lblUrl;
@property (weak, nonatomic) IBOutlet UILabel *lblUrltoImg;
@property (weak, nonatomic) IBOutlet UILabel *lblPublished;


@property (strong, nonatomic)NSDictionary *dictDetail;

@end
