//
//  Document.h
//  ydxcapp
//
//  Created by 希文 on 2017/4/18.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Document : NSObject
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
@property (nonatomic, strong) NSDictionary *subTask;


- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)documentWithDict:(NSDictionary *)dict;


@end
