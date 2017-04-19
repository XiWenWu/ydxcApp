//
//  InfoData.m
//  ydxcapp
//
//  Created by 希文 on 2017/3/22.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "InfoData.h"

@implementation InfoData

+ (instancetype) infoWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
- (instancetype) initWithDict:(NSDictionary *)dict{
    if (self = [self init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
