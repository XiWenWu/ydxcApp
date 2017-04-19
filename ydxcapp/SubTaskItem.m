//
//  SubTaskItem.m
//  ydxcapp
//
//  Created by 希文 on 2017/4/17.
//  Copyright © 2017年 xiwen. All rights reserved.
//
/*
 // 名称
 @property (nonatomic, strong) NSString *usetypetext;
 // 检查项目
 @property (nonatomic, strong) NSString *text;
 // 状态
 @property (nonatomic, strong) NSString *_bz_status;
 */

#import "SubTaskItem.h"

@implementation SubTaskItem

- (instancetype) initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.usetypetext = [dict valueForKey:@"usetypetext"];
        self.text        = [dict valueForKey:@"text"];
        self._bz_status  = [[dict valueForKey:@"_bz_status"] intValue];
        
    }
    return self;
}
+ (instancetype) itemWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}


@end
