//
//  ProductData.m
//  ydxcapp
//
//  Created by 希文 on 2017/3/21.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "ProductData.h"

@implementation ProductData

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)productWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
