//
//  DTInformationCell.h
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/16.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTInformationModels.h"
#import <UIKit/UIKit.h>

static NSString *const kDTInformationCellIdentifier = @"DTInformationCell";

@interface DTInformationCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *infoImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

- (void)setUpCellViewsWithItem:(DTInformationModels *)item;

@end
