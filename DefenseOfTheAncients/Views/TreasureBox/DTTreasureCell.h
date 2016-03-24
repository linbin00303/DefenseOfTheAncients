//
//  DTTreasureCell.h
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/24.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTTreasureBoxModels.h"

static NSString *const kDTTreasureCellIdentifier = @"DTTreasureCell";

@interface DTTreasureCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void)setUpDTTreasureCellViewsWithTreasureBoxModel:(DTTreasureBoxModels *)item;

@end
