//
//  UIImage+ColorImage.h
//  LosAngeles
//
//  Created by yaoquafeng on 15/12/15.
//  Copyright © 2015年 狗民网. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accelerate/Accelerate.h>
#import <QuartzCore/QuartzCore.h>

@interface UIImage (ColorImage)

+ (UIImage *)imageWithColor:(UIColor *)color;

- (UIImage*)blurredImage:(CGFloat)blurAmount;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
