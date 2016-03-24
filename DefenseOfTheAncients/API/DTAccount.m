//
//  DTAccount.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/16.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTAccount.h"

NSString *const kAccountUidKey = @"dt_uid";
NSString *const kAccountTokenKey = @"dt_token";

@implementation DTAccount

+ (instancetype)sharedAccount {
    static DTAccount *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      _instance = [[DTAccount alloc] init];

      NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
      _instance.uid = [defs objectForKey:kAccountUidKey];
      _instance.token = [defs objectForKey:kAccountTokenKey];

      if (!_instance.uid) {
          _instance.uid = @(0);
      }
    });
    return _instance;
}

+ (BOOL)isLogined {
    return [[DTAccount sharedAccount] isLogined];
}

- (BOOL)isLogined {
    return ([self.uid longValue] > 0 && self.token);
}

- (void)setUid:(NSNumber *)uid {
    _uid = uid;
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    [defs setObject:_uid forKey:kAccountUidKey];
    [defs synchronize];
}

- (void)setToken:(NSString *)token {
    _token = token;
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    [defs setObject:_token forKey:kAccountTokenKey];
    [defs synchronize];
}

- (void)logout {
    _uid = @(0);
    _token = nil;
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    [defs setObject:_uid forKey:kAccountUidKey];
    [defs setObject:_token forKey:kAccountTokenKey];
    [defs synchronize];
}

@end
