//
//  SubTask.h
//  ydxcapp
//
//  Created by 希文 on 2017/4/17.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubTask : NSObject

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

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)taskWithDict:(NSDictionary *)dict;

@end
