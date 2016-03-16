//
//  DTNavItems.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/17.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTNavItems.h"

@implementation DTNavItems

+ (NSArray *)backButtonItemWithTarget:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0.0f, 0.0f, 44.0f, 44.0f);
    [btn setImage:[UIImage imageNamed:@"home_back"] forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spacer.width = -15.0f;
    return @[spacer,item];
}

+ (UIView *)titleViewWithText:(NSString *)text {
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 200, 44.0f)];
    titleLabel.text = text;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    return titleLabel;
}


@end
