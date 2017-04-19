//
//  XWUserInfoTool.h
//  ydxcapp
//
//  Created by 希文 on 2017/4/14.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XWUserInfo;

@interface XWUserInfoTool : NSObject

// 储存账户信息
+ (void)saveUserInfo:(XWUserInfo *)userInfo;
// 返回储存的账户信息
+ (XWUserInfo *)userInfo;

@end
