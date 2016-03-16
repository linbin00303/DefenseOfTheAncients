//
//  DTInformationCell.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/16.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTInformationCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@implementation DTInformationCell

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)setUpCellViewsWithItem:(DTInformationModels *)item{
    self.titleLabel.text = item.title;
    self.contentLabel.text = item.desc;
    [self.infoImageView setImageWithURL:[NSURL URLWithString:item.pic]];
    self.timeLabel.text = item.date;
    self.typeLabel.text = [self typeStringWithItemType:item.type];
}

- (NSString *)typeStringWithItemType:(NSString *)itemType{
    if ([itemType isEqualToString:@"govnews"]) {
        return @"官方";
    }else if ([itemType isEqualToString:@"matchnews"]){
        return @"赛事";
    }else if ([itemType isEqualToString:@"medianews"]){
        return @"媒体";
    }
    return @"";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
