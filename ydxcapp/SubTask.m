//
//  SubTask.m
//  ydxcapp
//
//  Created by 希文 on 2017/4/17.
//  Copyright © 2017年 xiwen. All rights reserved.
//
/*
 // 地址名称
 @property (nonatomic, copy) NSString *text;
 // 类型
 @property (nonatomic, copy) NSString *typetext;
 // 开始时间
 @property (nonatomic, copy) NSString *startdate;
 // 所属镇
 @property (nonatomic, copy) NSString *town;
 // 所属村
 @property (nonatomic, copy) NSString *countycode;
 // 地址
 @property (nonatomic, copy) NSString *village;
 // 备注
 @property (nonatomic, copy) NSString *memo;
 // 子任务
 @property (nonatomic, strong) NSDictionary *item;
 
 XWTaskDetaHeadView
 */

#define BLANK @"空"

#import "SubTask.h"

@implementation SubTask
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.text        = [dict valueForKey:@"text"]?[dict valueForKey:@"text"]:BLANK;
        self.typetext    = [dict valueForKey:@"typetext"]?[dict valueForKey:@"typetext"]:BLANK;
        self.startdate   = [dict valueForKey:@"startdate"]?[dict valueForKey:@"startdate"]:BLANK;
        self.town        = [dict valueForKey:@"town"]?[dict valueForKey:@"town"]:BLANK;
        self.countycode  = [dict valueForKey:@"countycode"]?[dict valueForKey:@"countycode"]:BLANK;
        self.village     = [dict valueForKey:@"village"]?[dict valueForKey:@"village"]:BLANK;
        self.memo        = [dict valueForKey:@"memo"]?[dict valueForKey:@"memo"]:BLANK;
        self.item        = [dict valueForKey:@"item"]?[dict valueForKey:@"item"]:@{};
    }
    return self;
}
+ (instancetype)taskWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
