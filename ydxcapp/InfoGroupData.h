//
//  InfoGroupData.h
//  ydxcapp
//
//  Created by 希文 on 2017/3/22.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InfoGroupData : NSObject
/* 这组存放所有标题对象 */
@property (nonatomic, copy) NSArray *infos;

+ (instancetype) groupWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;


@end
