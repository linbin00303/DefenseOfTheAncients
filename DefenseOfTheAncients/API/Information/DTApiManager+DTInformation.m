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

- (void)requestInformationForWholeWithPageIndex:(NSInteger)pageIndex succBlocks:(void (^)(NSArray *))succBlocks failBlocks:(void (^)(NSError *))failBlocks {
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
                    succBlocks:theSuccBlock
                    failBlocks:failBlocks];
}

@end
