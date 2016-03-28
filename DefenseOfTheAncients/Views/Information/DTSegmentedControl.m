//
//  DTSegmentedControl.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/28.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTSegmentedControl.h"

@implementation DTSegmentedControl

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.tintColor = [UIColor clearColor];
    NSDictionary *selectedTextAttributes = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:17], NSForegroundColorAttributeName : [UIColor whiteColor]};
    [self setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected]; //设置文字属性
    NSDictionary *unselectedTextAttributes =
        @{NSFontAttributeName : [UIFont boldSystemFontOfSize:16], NSForegroundColorAttributeName : [UIColor redColor]};
    [self setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
}

@end
