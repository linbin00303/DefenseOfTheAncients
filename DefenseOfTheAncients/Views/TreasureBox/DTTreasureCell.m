//
//  DTTreasureCell.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/24.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTTreasureCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@implementation DTTreasureCell

- (void)awakeFromNib {
}

-(void)setUpDTTreasureCellViewsWithTreasureBoxModel:(DTTreasureBoxModels *)item{
    [self.headImageView setImageWithURL:[NSURL URLWithString:item.pic]];
    self.titleLabel.text = item.title;
}

@end
