//
//  DTScheduleTableViewCell.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/25.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTScheduleTableViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@implementation DTScheduleTableViewCell

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.remindButton.layer.masksToBounds = YES;
    self.remindButton.layer.borderColor = [HXColor hx_colorWithHexRGBAString:@"c2bebe"].CGColor;
    self.remindButton.layer.borderWidth =0.5;
}

- (void)setUpDTScheduleTableViewCellViewsWithAgendasModel:(DTAgendasModel *)item {
    self.team1Name.text = item.team1Name;
    self.team2Name.text = item.team2Name;
    [self.team1ICon setImageWithURL:[NSURL URLWithString:item.team1Icon]];
    [self.team2Icon setImageWithURL:[NSURL URLWithString:item.team2Icon]];
    self.titleLabel.text = [NSString stringWithFormat:@"%@  %@  %@",item.startHourMin, item.competitionEventName,item.competitionQuality];
    self.gameFractionLabel.text = [NSString stringWithFormat:@"%ld : %ld",(long)item.team1Score,(long)item.team2Score];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
