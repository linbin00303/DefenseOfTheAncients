//
//  DTGameMatchTableViewCell.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/28.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTGameMatchTableViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@implementation DTGameMatchTableViewCell

- (void)awakeFromNib {
}

- (void)setUpGameMatchCellViewsWithDTGameMatchItem:(DTGameMatchModel *)item {
    [self.headImageView setImageWithURL:[NSURL URLWithString:item.icon]];
    self.titleLabel.text = item.name;
    [self.contentView bringSubviewToFront:self.styleLabel];
    self.timtLabel.text = item.startTimeStr;
    self.locationLabel.text = item.location;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
