//
//  InfoGroupData.m
//  ydxcapp
//
//  Created by 希文 on 2017/3/22.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "InfoGroupData.h"
#import "InfoData.h"

@implementation InfoGroupData

+ (instancetype) groupWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
- (instancetype) initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        // 取出原来的字段数组
        NSArray *dictArray = dict[@"group"];
        // 创建一个可变数组，用来存放将要取出的 info 信息
        NSMutableArray *infoArray = [NSMutableArray array];
        // 遍历需要使用的数组 转换信息
        for (NSDictionary *dict in dictArray) {
            InfoData *data = [InfoData infoWithDict:dict];
            
            [infoArray addObject:data];
        }
        self.infos = infoArray;
    }
    return self;
}


@end
