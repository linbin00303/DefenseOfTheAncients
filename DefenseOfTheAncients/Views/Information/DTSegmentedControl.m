//
//  DTSegmentedControl.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/28.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTSegmentedControl.h"
#import "UIImage+ColorImage.h"

@implementation DTSegmentedControl

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
//    self.tintColor = [UIColor clearColor];
    NSDictionary *selectedTextAttributes = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:18], NSForegroundColorAttributeName : [UIColor whiteColor]};
    [self setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected]; //设置文字属性
    NSDictionary *unselectedTextAttributes = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:16], NSForegroundColorAttributeName : [UIColor redColor]};
    UIImage *redBackGround = [UIImage imageWithColor:[UIColor redColor] size:CGSizeMake(1, 1)];

    UIImage *whiteBackGround = [UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(1, 1)];
    
    [self setBackgroundImage:redBackGround forState:UIControlStateSelected barMetrics: UIBarMetricsDefault];
    [self setBackgroundImage:redBackGround forState:UIControlStateHighlighted barMetrics: UIBarMetricsDefault];
    [self setBackgroundImage:whiteBackGround forState:UIControlStateNormal barMetrics: UIBarMetricsDefault];
    [self setDividerImage:whiteBackGround forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    [self setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
}

@end
