//
//  DTNavItems.h
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/17.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTNavItems : NSObject

+ (NSArray *)backButtonItemWithTarget:(id)target action:(SEL)action;

+ (UIView *)titleViewWithText:(NSString *)text;

@end
