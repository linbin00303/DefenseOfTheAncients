//
//  DTNavigationBarView.h
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/16.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTNavigationBarView : UIView

- (void)deliver:(UIScrollView *)scrollView;

- (instancetype)initWithFrame:(CGRect)frame withWidth:(CGFloat)width withArray:(NSArray *)arr;

@end
