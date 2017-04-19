//
//  XWUserInfoTool.m
//  ydxcapp
//
//  Created by 希文 on 2017/4/14.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "XWUserInfoTool.h"
#import "XWUserInfo.h"
// 用户信息文件
#define XWUserInfoFile [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]

@implementation XWUserInfoTool
// 储存账户信息
+ (void)saveUserInfo:(XWUserInfo *)userInfo {
    [NSKeyedArchiver archiveRootObject:userInfo toFile:XWUserInfoFile];
}
// 返回储存的账户信息
+ (XWUserInfo *)userInfo {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:XWUserInfoFile];
}
@end
