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
                                     succBlocks:(void (^)(NSArray *WholeItems))succBlocks
                                     failBlocks:(void (^)(NSError *error))failBlocks;

@end
