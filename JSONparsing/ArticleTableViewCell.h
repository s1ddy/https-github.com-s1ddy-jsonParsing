//
//  ArticleTableViewCell.h
//  JSONparsing
//
//  Created by Student-004 on 04/02/18.
//  Copyright © 2018 felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *Imgvw;
@property (weak, nonatomic) IBOutlet UILabel *LblTitle;
@property (weak, nonatomic) IBOutlet UILabel *LblDescription;

@end
