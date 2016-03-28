//
//  DTGameModel.h
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/25.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension/MJExtension.h>
@class DTAgendasModel;

@interface DTGameHomeModel : NSObject

@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSArray *agendas;

@end

@interface DTAgendasModel : NSObject

@property (nonatomic, strong) NSNumber *competitionEventId;
@property (nonatomic, strong) NSString *competitionEventName;
@property (nonatomic, strong) NSString *competitionPlace;
@property (nonatomic, strong) NSString *competitionQuality;
@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *startDate;
@property (nonatomic, strong) NSString *startHourMin;
@property (nonatomic, strong) NSString *startWeekDay;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString *team1Icon;
@property (nonatomic, strong) NSNumber *team1Id;
@property (nonatomic, strong) NSString *team1Name;
@property (nonatomic, assign) NSInteger team1Score;
@property (nonatomic, strong) NSString *team2Icon;
@property (nonatomic, assign) NSInteger team2Id;
@property (nonatomic, strong) NSString *team2Name;
@property (nonatomic, assign) NSInteger team2Score;

@end

@interface DTGameMatchModel : NSObject

@property (nonatomic, assign) NSInteger firstAward;
@property (nonatomic, strong) NSString *gameVersion;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *organizer;
@property (nonatomic, strong) NSString *qualityList;
@property (nonatomic, assign) NSInteger secondAward;
@property (nonatomic, assign) NSInteger startTime;
@property (nonatomic, strong) NSString *startTimeStr;
@property (nonatomic, assign) NSInteger satus;
@property (nonatomic, assign) NSInteger thirdAward;
@property (nonatomic, assign) NSInteger totalAward;

@end