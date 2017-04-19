//
//  XWUserInfo.h
//  ydxcapp
//
//  Created by 希文 on 2017/4/12.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XWUserInfo : NSObject <NSCoding>

@property (copy, nonatomic) NSString *uid;
@property (copy, nonatomic) NSString *token;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)infoWithDict:(NSDictionary *)dict;

@end
