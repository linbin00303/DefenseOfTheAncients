//
//  DTRefreshHeader.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/15.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTRefreshHeader.h"

@implementation DTRefreshHeader

- (void)prepare {
    [super prepare];
    
    self.stateLabel.hidden = YES;
    self.lastUpdatedTimeLabel.hidden = YES;
    
    NSArray *IdleImages = @[
                            [UIImage imageNamed:@"wnx00"],
                            ];
    
    NSMutableArray *refreshingImages = [NSMutableArray new];
    
    for (int i = 0; i<=92; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"wnx%02d",i]];
        [refreshingImages addObject:image];
    }
    
    [self setImages:IdleImages forState:MJRefreshStateIdle];
    [self setImages:IdleImages forState:MJRefreshStatePulling];
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
}
@end
