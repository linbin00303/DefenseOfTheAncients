//
//  DTApiManager+DTInformation.h
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/16.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTApiManager.h"

@interface DTApiManager (DTInformation)

/**全部*/
- (void)requestInformationForWholeWithPageIndex:(NSInteger)pageIndex
                                     SuccBlocks:(void (^)(NSArray *WholeItems))succBlocks
                                     failBlocks:(void (^)(NSError *error))failBlocks;

/**官方*/
- (void)requestInformationForOfficalWithPageIndex:(NSInteger)pageIndex SuccBlocks:(void (^)(NSArray *))succBlocks failBlocks:(void (^)(NSError *))failBlocks;

/**更新*/
- (void)requestInformationForUpdateWithPageIndex:(NSInteger)pageIndex
                                      SuccBlocks:(void (^)(NSArray *UpdateItems))succBlocks
                                      failBlocks:(void (^)(NSError *error))failBlocks;

/**媒体*/
- (void)requestInformationForMediaWithPageIndex:(NSInteger)pageIndex
                                     SuccBlocks:(void (^)(NSArray *MediaItems))succBlocks
                                     failBlocks:(void (^)(NSError *error))failBlocks;

/**赛事*/
- (void)requestInformationForMatchWithPageIndex:(NSInteger)pageIndex
                                     SuccBlocks:(void (^)(NSArray *MatchItems))succBlocks
                                     failBlocks:(void (^)(NSError *error))failBlocks;

@end
