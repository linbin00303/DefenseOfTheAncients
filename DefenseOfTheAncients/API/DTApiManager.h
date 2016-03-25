//
//  DTApiManager.h
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/16.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const kApiBaseUrl = @"http://www.dota2.com.cn/%@";
static NSString *const mApiBaseUrl = @"http://msgpush.dota2.com.cn/%@";

typedef void (^ApiRequestSuccBlock)(NSDictionary *data);
typedef void (^ApiRequestFailBlock)(NSError *error);

@interface DTApiManager : NSObject

+ (instancetype)sharedApiManager;

- (void)fetchDataUsingMethod:(NSString *)httpMethod
                     apiPath:(NSString *)path
                BaseUrlType :(NSInteger)urlType
                  succBlocks:(ApiRequestSuccBlock)succBlocks
                  failBlocks:(ApiRequestFailBlock)failBlocks;

- (NSDictionary *)extractDataFromResponseObject:(id)responseObject;

@end
