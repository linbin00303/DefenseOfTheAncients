//
//  DTScheduleTableViewCell.h
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/25.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTGameModel.h"
#import <UIKit/UIKit.h>

static NSString *const kDTScheduleTableViewCellIdentifier = @"DTScheduleTableViewCell";


@interface DTScheduleTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *team1ICon;
@property (weak, nonatomic) IBOutlet UILabel *team1Name;
@property (weak, nonatomic) IBOutlet UIImageView *team2Icon;
@property (weak, nonatomic) IBOutlet UILabel *team2Name;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *gameFractionLabel;
@property (weak, nonatomic) IBOutlet UIButton *remindButton;
@property (weak, nonatomic) IBOutlet UILabel *lineLabel;

- (void)setUpDTScheduleTableViewCellViewsWithAgendasModel:(DTAgendasModel *)item;

@end
