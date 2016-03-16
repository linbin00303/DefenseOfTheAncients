//
//  DTAccount.h
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/16.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTAccount : NSObject

@property (nonatomic, strong) NSNumber *uid;
@property (nonatomic, strong) NSString *token;

+ (instancetype)sharedAccount;

+ (BOOL)isLogined;
- (BOOL)isLogined;

- (void)logout;

@end
