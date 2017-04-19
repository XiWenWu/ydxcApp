//
//  Document.m
//  ydxcapp
//
//  Created by 希文 on 2017/4/18.
//  Copyright © 2017年 xiwen. All rights reserved.
//

/*
 // 状态
 @property (nonatomic, copy) NSString *statetext;
 // 名称
 @property (nonatomic, copy) NSString *text;
 // 类型
 @property (nonatomic, copy) NSString *typetext;
 // 发布时间
 @property (nonatomic, copy) NSString *createtime;
 // 开始时间
 @property (nonatomic, copy) NSString *startdate;
 // 执行人
 @property (nonatomic, copy) NSString *username;
 // 备注
 @property (nonatomic, copy) NSString *memo;
 // 子任务
 @property (nonatomic, strong) SubTask *subTask;
 */

#import "Document.h"


@implementation Document

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.statetext     = dict[@"statetext"];
        self.text          = dict[@"text"];
        self.typetext      = dict[@"typetext"];
        self.createtime    = dict[@"createtime"];
        self.startdate     = dict[@"startdate"];
        self.username      = dict[@"username"];
        self.memo          = dict[@"memo"];
        self.subTask       = dict[@"subTask"];
    }
    return self;
}
+ (instancetype)documentWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
