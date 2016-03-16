//
//  DTApiManager.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/16.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTAccount.h"
#import "DTApiManager.h"
#import <AFNetworking/AFNetworking.h>

@interface DTApiManager ()

@property (strong, nonatomic) AFHTTPRequestOperationManager *reqManager;

@end

@implementation DTApiManager

+ (instancetype)sharedApiManager {
    static DTApiManager *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      _instance = [[DTApiManager alloc] init];
    });
    return _instance;
}

- (void)fetchDataUsingMethod:(NSString *)httpMethod
                     apiPath:(NSString *)path
                  succBlocks:(void (^)(NSDictionary *))succBlocks
                  failBlocks:(void (^)(NSError *))failBlocks {
    if (!_reqManager) {
        _reqManager = [AFHTTPRequestOperationManager manager];
        _reqManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    NSString *apiUrl = [NSString stringWithFormat:kApiBaseUrl, path];
    
    NSError *error;
    NSMutableURLRequest *req = [_reqManager.requestSerializer requestWithMethod:httpMethod URLString:apiUrl parameters:nil error:&error];
    AFHTTPRequestOperation *reqOp = [[AFHTTPRequestOperation alloc] initWithRequest:req];
    [reqOp setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
      NSDictionary *data = [self extractDataFromResponseObject:responseObject];
      if (data.count) {
          succBlocks(data);
      }else {
          failBlocks([NSError errorWithDomain:@"返回数据为空" code:-1 userInfo:nil]);
      }
    }
        failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          failBlocks(error);

        }];
    [reqOp start];
}

- (NSDictionary *)extractDataFromResponseObject:(id)responseObject {
    NSData *xRawData = (NSData *)responseObject;
#if DEBUG
    NSLog(@"data：＝＝＝＝＝＝%@＝＝＝＝＝＝＝", [[NSString alloc] initWithData:xRawData encoding:NSUTF8StringEncoding]);
#endif
    NSError *error;
    NSDictionary *data = [NSJSONSerialization JSONObjectWithData:xRawData options:NSJSONReadingMutableContainers error:&error];
    if (!error) {
        return data;
    }
    return nil;
}

@end
