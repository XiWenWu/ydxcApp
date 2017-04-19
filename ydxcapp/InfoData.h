//
//  InfoData.h
//  ydxcapp
//
//  Created by 希文 on 2017/3/22.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InfoData : NSObject

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *msg;

+ (instancetype) infoWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
