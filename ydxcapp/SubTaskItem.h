//
//  SubTaskItem.h
//  ydxcapp
//
//  Created by 希文 on 2017/4/17.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubTaskItem : NSObject
// 名称
@property (nonatomic, copy) NSString *usetypetext;
// 检查项目
@property (nonatomic, copy) NSString *text;
// 状态
@property (nonatomic, assign) int _bz_status;


- (instancetype) initWithDict:(NSDictionary *)dict;
+ (instancetype) itemWithDict:(NSDictionary *)dict;

@end
