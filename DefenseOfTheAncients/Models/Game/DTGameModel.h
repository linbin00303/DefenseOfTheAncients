//
//  DTGameModel.h
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/25.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension/MJExtension.h>

@interface DTGameModel : NSObject

@property (nonatomic, strong) NSNumber *competitionEventId;
@property (nonatomic, strong) NSString *competitionEventName;
@property (nonatomic, strong) NSString *competitionPlace;
@property (nonatomic, strong) NSString *competitionQuality;
@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *startDate;
@property (nonatomic, strong) NSString *startHourMin;
@property (nonatomic, strong) NSString *startWeekDay;
@property (nonatomic, strong) NSNumber *status;
@property (nonatomic, strong) NSString *team1Icon;
@property (nonatomic, strong) NSNumber *team1Id;
@property (nonatomic, strong) NSString *team1Name;
@property (nonatomic, assign) NSInteger team1Score;
@property (nonatomic, strong) NSString *team2Icon;
@property (nonatomic, assign) NSInteger team2Id;
@property (nonatomic, strong) NSString *team2Name;
@property (nonatomic, assign) NSInteger team2Score;

@end
