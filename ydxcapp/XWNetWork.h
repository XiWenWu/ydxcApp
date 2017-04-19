//
//  XWNetWork.h
//  ydxcapp
//
//  Created by 希文 on 2017/4/12.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface XWNetWork : AFHTTPSessionManager
+ (instancetype) sharedInstance;
//请求成功回调block
typedef void (^requestSuccessBlock)(NSDictionary *dic);

//请求失败回调block
typedef void (^requestFailureBlock)(NSError *error);

//请求方法define
typedef enum {
    GET,
    POST,
    PUT,
    DELETE,
    HEAD
} HTTPMethod;

- (void)requestWithMethod:(HTTPMethod)method
                 WithPath:(NSString *)path
               WithParams:(NSDictionary*)params
         WithSuccessBlock:(requestSuccessBlock)success
          WithFailurBlock:(requestFailureBlock)failure;

@end
