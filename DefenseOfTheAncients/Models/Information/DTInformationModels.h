//
//  DTInformationModels.h
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/16.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension/MJExtension.h>

@interface DTInformationModels : NSObject

@property (nonatomic, strong) NSString *itemId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *showComment;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *isVideo;
@property (nonatomic, strong) NSString *newstype;
@property (nonatomic, strong) NSDictionary *topicinfo;
@property (nonatomic, strong) NSString *date;

@end
