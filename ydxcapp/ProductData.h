//
//  ProductData.h
//  ydxcapp
//
//  Created by 希文 on 2017/3/21.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductData : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)productWithDict:(NSDictionary *)dict;

@end
