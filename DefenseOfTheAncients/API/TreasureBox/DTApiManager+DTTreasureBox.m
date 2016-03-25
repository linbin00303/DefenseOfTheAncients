//
//  DTApiManager+DTTreasureBox.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/24.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTApiManager+DTTreasureBox.h"
#import "DTTreasureBoxModels.h"

@implementation DTApiManager (DTTreasureBox)

- (void)requestBaoheListDataSuccBlocks:(void (^)(NSArray *))succBlocks failBlocks:(void (^)(NSError *))failBlocks {
    ApiRequestSuccBlock theSuccBlock = ^(NSDictionary *data) {
      NSArray *rawItems = [data objectForKey:@"data"];
      NSMutableDictionary *baoheDic = [rawItems firstObject];
      NSArray *array = baoheDic[@"list"];
      NSMutableArray *items = [NSMutableArray arrayWithCapacity:array.count];
      for (NSDictionary *item in array) {
          DTTreasureBoxModels *treasureBoxItem = [DTTreasureBoxModels mj_objectWithKeyValues:item];
          [items addObject:treasureBoxItem];
      }
      succBlocks(items);
    };
    [self fetchDataUsingMethod:@"GET"
                       apiPath:[NSString stringWithFormat:@"wapnews/baoheListData.html"]
                   BaseUrlType:1
                    succBlocks:theSuccBlock
                    failBlocks:failBlocks];
}

@end
