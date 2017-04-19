//
//  SubTaskHeadView.h
//  ydxcapp
//
//  Created by 希文 on 2017/4/18.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SubTask;

@interface SubTaskHeadView : UIView

@property (nonatomic, strong) SubTask *subTask;

+ (instancetype) headerView:(SubTask *)subTask;

@end
