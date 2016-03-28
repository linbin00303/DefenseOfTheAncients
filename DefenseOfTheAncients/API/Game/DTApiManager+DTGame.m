//
//  DTApiManager+DTGame.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/25.
//  Copyright © 2016年 Mr.Yao. All rights reserved.x
//

#import "DTApiManager+DTGame.h"

@implementation DTApiManager (DTGame)

- (void)requestGameHomeDatasourceSuccBlocks:(void (^)(NSArray *))succBlocks failBlocks:(void (^)(NSError *))failBlocks {

    ApiRequestSuccBlock theSuccBlock = ^(NSDictionary *data) {
      NSArray *rawItems = [data objectForKey:@"data"];
      NSMutableArray *items = [NSMutableArray arrayWithCapacity:rawItems.count];
      for (NSDictionary *item in rawItems) {
          DTGameHomeModel *gameItem = [DTGameHomeModel mj_objectWithKeyValues:item];
          [items addObject:gameItem];
      }
      succBlocks(items);
    };
    [self fetchDataUsingMethod:@"GET"
                       apiPath:[NSString stringWithFormat:@"carry6/competition/agenda?appid=wanmeidota2&page=1&sig=52b64c1227008ad4cea7c034c543c73a"]
                   BaseUrlType:2
                    succBlocks:theSuccBlock
                    failBlocks:failBlocks];
}

- (void)requestGmaeMatchDataWithType:(NSInteger)type SourceBlocks:(void (^)(NSArray *))succBlocks failBlocks:(void (^)(NSError *))failBlocks {
    ApiRequestSuccBlock theSuccBlock = ^(NSDictionary *data) {
      NSArray *rawItems = [data objectForKey:@"data"];
      NSMutableArray *items = [NSMutableArray arrayWithCapacity:rawItems.count];
      for (NSDictionary *item in rawItems) {
          DTGameMatchModel *gameItem = [DTGameMatchModel mj_objectWithKeyValues:item];
          [items addObject:gameItem];
      }
      succBlocks(items);
    };
    [self fetchDataUsingMethod:@"GET" apiPath:[self returnRequestStringWithType:type] BaseUrlType:2 succBlocks:theSuccBlock failBlocks:failBlocks];
}

- (NSString *)returnRequestStringWithType:(NSInteger)type {
    switch (type) {
    case 1:
        return @"carry6/competition/api?apiName=competitionEvent_list&appid=wanmeidota2&category=1&page=1&sig=7622b3086dd1a28b8d39edfc2ff61cd6&size=20";
        break;
    case 2:
        return @"carry6/competition/api?apiName=competitionEvent_list&appid=wanmeidota2&category=2&page=1&sig=48eddc7a01d89d0b2b499a7200d3b904&size=20";
    case 3:
        return @"carry6/competition/api?apiName=competitionEvent_list&appid=wanmeidota2&category=3&page=1&sig=be318603e2c950e69cb47d8100beb4cb&size=20";
        break;
    case 4:
        return @"carry6/competition/api?apiName=competitionEvent_list&appid=wanmeidota2&category=4&page=1&sig=28e800a272b6165a2a2a16c38b170f56&size=20";
        break;
    default:
        return @"adadas";
        break;
    }
    return @"";
}

@end
