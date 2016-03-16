//
//  DTInformationModels.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/16.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTInformationModels.h"

@implementation DTInformationModels

+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{
        @"itemId" : @"id",
        @"title" : @"title",
        @"pic" : @"pic",
        @"url" : @"url",
        @"desc" : @"desc",
        @"showComment" : @"showComment",
        @"type" : @"type",
        @"isVideo" : @"isVideo",
        @"newstype" : @"newstype",
        @"topicinfo" : @"topicinfo",
        @"date" : @"date"
    };
}

@end
