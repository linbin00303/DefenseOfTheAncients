//
//  DTApiManager+DTTreasureBox.h
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/24.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTApiManager.h"

@interface DTApiManager (DTTreasureBox)

- (void)requestBaoheListDataSuccBlocks:(void (^)(NSArray *BaoheItems))succBlocks failBlocks:(void (^)(NSError *error))failBlocks;

@end
