//
//  XWUserInfo.m
//  ydxcapp
//
//  Created by 希文 on 2017/4/12.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "XWUserInfo.h"

@implementation XWUserInfo

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.uid = [dict valueForKey:@"uid"];
        self.token = [dict valueForKey:@"token"];
    }
    return self;
}
+ (instancetype)infoWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
// 从文件中解析对象的时候调用
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        self.token = [aDecoder decodeObjectForKey:@"token"];
    }
    return self;
}

// 将对象写入文件的时候调用
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.token forKey:@"token"];
    
}
@end
