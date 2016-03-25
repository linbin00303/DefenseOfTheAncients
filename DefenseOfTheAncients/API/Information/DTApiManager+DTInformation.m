//
//  DTApiManager+DTInformation.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/16.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTApiManager+DTInformation.h"
#import "DTInformationModels.h"

@implementation DTApiManager (DTInformation)

- (void)requestInformationForWholeWithPageIndex:(NSInteger)pageIndex SuccBlocks:(void (^)(NSArray *))succBlocks failBlocks:(void (^)(NSError *))failBlocks {
    ApiRequestSuccBlock theSuccBlock = ^(NSDictionary *data) {
      NSArray *rawItems = [data objectForKey:@"data"];
      NSMutableArray *items = [NSMutableArray arrayWithCapacity:rawItems.count];
      for (NSDictionary *item in rawItems) {
          DTInformationModels *HotItem = [DTInformationModels mj_objectWithKeyValues:item];
          [items addObject:HotItem];
      }
      succBlocks(items);
    };
    [self fetchDataUsingMethod:@"GET"
                       apiPath:[NSString stringWithFormat:@"wapnews/hotnewsList%ld.html", pageIndex]
                   BaseUrlType:1
                    succBlocks:theSuccBlock
                    failBlocks:failBlocks];
}

- (void)requestInformationForOfficalWithPageIndex:(NSInteger)pageIndex SuccBlocks:(void (^)(NSArray *))succBlocks failBlocks:(void (^)(NSError *))failBlocks {

    ApiRequestSuccBlock theSuccBlock = ^(NSDictionary *data) {
      NSArray *rawItems = [data objectForKey:@"data"];
      NSMutableArray *items = [NSMutableArray arrayWithCapacity:rawItems.count];
      for (NSDictionary *item in rawItems) {
          DTInformationModels *HotItem = [DTInformationModels mj_objectWithKeyValues:item];
          [items addObject:HotItem];
      }
      succBlocks(items);
    };
    [self fetchDataUsingMethod:@"GET"
                       apiPath:[NSString stringWithFormat:@"wapnews/govnews/index%ld.html", pageIndex]
                   BaseUrlType:1
                    succBlocks:theSuccBlock
                    failBlocks:failBlocks];
}

- (void)requestInformationForUpdateWithPageIndex:(NSInteger)pageIndex SuccBlocks:(void (^)(NSArray *))succBlocks failBlocks:(void (^)(NSError *))failBlocks {
    ApiRequestSuccBlock theSuccBlock = ^(NSDictionary *data) {
      NSArray *rawItems = [data objectForKey:@"data"];
      NSMutableArray *items = [NSMutableArray arrayWithCapacity:rawItems.count];
      for (NSDictionary *item in rawItems) {
          DTInformationModels *HotItem = [DTInformationModels mj_objectWithKeyValues:item];
          [items addObject:HotItem];
      }
      succBlocks(items);
    };
    [self fetchDataUsingMethod:@"GET"
                       apiPath:[NSString stringWithFormat:@"wapnews/vernews/index%ld.html", pageIndex]
                   BaseUrlType:1
                    succBlocks:theSuccBlock
                    failBlocks:failBlocks];
}

- (void)requestInformationForMediaWithPageIndex:(NSInteger)pageIndex SuccBlocks:(void (^)(NSArray *))succBlocks failBlocks:(void (^)(NSError *))failBlocks {
    ApiRequestSuccBlock theSuccBlock = ^(NSDictionary *data) {
      NSArray *rawItems = [data objectForKey:@"data"];
      NSMutableArray *items = [NSMutableArray arrayWithCapacity:rawItems.count];
      for (NSDictionary *item in rawItems) {
          DTInformationModels *HotItem = [DTInformationModels mj_objectWithKeyValues:item];
          [items addObject:HotItem];
      }
      succBlocks(items);
    };
    [self fetchDataUsingMethod:@"GET"
                       apiPath:[NSString stringWithFormat:@"wapnews/medianews/index%ld.html", pageIndex]
                   BaseUrlType:1
                    succBlocks:theSuccBlock
                    failBlocks:failBlocks];
}

- (void)requestInformationForMatchWithPageIndex:(NSInteger)pageIndex SuccBlocks:(void (^)(NSArray *))succBlocks failBlocks:(void (^)(NSError *))failBlocks {
    ApiRequestSuccBlock theSuccBlock = ^(NSDictionary *data) {
      NSArray *rawItems = [data objectForKey:@"data"];
      NSMutableArray *items = [NSMutableArray arrayWithCapacity:rawItems.count];
      for (NSDictionary *item in rawItems) {
          DTInformationModels *HotItem = [DTInformationModels mj_objectWithKeyValues:item];
          [items addObject:HotItem];
      }
      succBlocks(items);
    };
    [self fetchDataUsingMethod:@"GET"
                       apiPath:[NSString stringWithFormat:@"wapnews/matchnews/index%ld.html", pageIndex]
                   BaseUrlType:1
                    succBlocks:theSuccBlock
                    failBlocks:failBlocks];
}

@end
