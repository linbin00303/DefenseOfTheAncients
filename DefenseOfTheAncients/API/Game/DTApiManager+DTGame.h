//
//  DTApiManager+DTGame.h
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/25.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTApiManager.h"
#import "DTGameModel.h"

@interface DTApiManager (DTGame)

- (void)requestGameHomeDatasourceSuccBlocks:(void (^)(NSArray *gameItems))succBlocks failBlocks:(void (^)(NSError *error))failBlocks;

@end
