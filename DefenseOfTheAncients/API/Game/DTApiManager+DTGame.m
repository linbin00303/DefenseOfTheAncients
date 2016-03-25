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

@end
