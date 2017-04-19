//
//  XWNetWork.m
//  ydxcapp
//
//  Created by 希文 on 2017/4/12.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "XWNetWork.h"

// 超时时间
static int const DEFAULT_REQUEST_TIME_OUT = 20;

@implementation XWNetWork
//
static XWNetWork *manager = nil;

+ (instancetype) sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] initWithBaseURL:[NSURL URLWithString:@""]];
    });
    return manager;
}
// 初始化方法
+ (id)allocWithZone:(struct _NSZone *)zone {
    if (manager == nil) {
        manager = [super allocWithZone:zone];
    }
    return manager;
}
// 拷贝方法
- (instancetype) init {
    self = [super init];
    if (self) {
        // 初始化一些必须的参数,根据实际情况去设置
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFHTTPRequestSerializer serializer];
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        [[self requestSerializer] setTimeoutInterval:DEFAULT_REQUEST_TIME_OUT];
    }
    return self;
}

- (void)requestWithMethod:(HTTPMethod)method
                 WithPath:(NSString *)path
               WithParams:(NSDictionary*)params
         WithSuccessBlock:(requestSuccessBlock)success
          WithFailurBlock:(requestFailureBlock)failure
{
    switch (method) {
        case GET:{
            [self GET:path parameters:params progress:nil success:^(NSURLSessionTask *task, NSDictionary * responseObject) {
                NSLog(@"JSON: %@", responseObject);
                success(responseObject);
            } failure:^(NSURLSessionTask *operation, NSError *error) {
                NSLog(@"Error: %@", error);
                failure(error);
            }];
            break;
        }
        case POST:{
            [self POST:path parameters:params progress:nil success:^(NSURLSessionTask *task, NSDictionary * responseObject) {
                NSLog(@"JSON: %@", responseObject);
                success(responseObject);
            } failure:^(NSURLSessionTask *operation, NSError *error) {
                NSLog(@"Error: %@", error);
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:error.localizedDescription delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alert show];
                failure(error);
            }];
            break;
        }
        default:
            break;
    }    
}

@end
