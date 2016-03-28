//
//  DTGameMatchTableViewCell.h
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/28.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTGameModel.h"

static NSString *const kDTGameMatchTableViewCellIdentifier = @"DTGameMatchTableViewCell";

@interface DTGameMatchTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *footerView;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timtLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *styleLabel;

- (void)setUpGameMatchCellViewsWithDTGameMatchItem:(DTGameMatchModel *)item;

@end
