//
//  DocHeadView.h
//  ydxcapp
//
//  Created by 希文 on 2017/4/18.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Document;

@interface DocHeadView : UIView

@property (nonatomic, strong) Document *document;

+ (instancetype) headerView:(Document *)document;

@end
