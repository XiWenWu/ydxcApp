//
//  SubTaskHeadView.m
//  ydxcapp
//
//  Created by 希文 on 2017/4/18.
//  Copyright © 2017年 xiwen. All rights reserved.
//

/*
 // 地址名称
 @property (nonatomic, copy) NSString *text;
 // 类型
 @property (nonatomic, copy) NSString *typetext;
 // 开始时间
 @property (nonatomic, copy) NSString *startdate;
 // 所属镇
 @property (nonatomic, copy) NSString *town;
 // 所属村
 @property (nonatomic, copy) NSString *countycode;
 // 地址
 @property (nonatomic, copy) NSString *village;
 // 备注
 @property (nonatomic, copy) NSString *memo;
 // 子任务
 @property (nonatomic, strong) NSDictionary *item;
 */

#import "SubTaskHeadView.h"
#import "SubTask.h"

@interface SubTaskHeadView ()
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UILabel *typetext;
@property (weak, nonatomic) IBOutlet UILabel *startdate;
@property (weak, nonatomic) IBOutlet UILabel *town;
@property (weak, nonatomic) IBOutlet UILabel *countycode;
@property (weak, nonatomic) IBOutlet UILabel *village;
@property (weak, nonatomic) IBOutlet UILabel *memo;



@end

@implementation SubTaskHeadView

- (void)setSubTask:(SubTask *)subTask {
    _subTask = subTask;
    
    self.text.text       = subTask.text;
    self.typetext.text   = subTask.typetext;
    self.startdate.text  = subTask.startdate;
    self.town.text       = subTask.town;
    self.countycode.text = subTask.countycode;
    self.village.text    = subTask.village;
    self.memo.text       = subTask.memo;
}

+ (instancetype) headerView:(SubTask *)subTask {
    SubTaskHeadView *cell = [[[NSBundle mainBundle] loadNibNamed:@"SubTaskHeadView" owner:nil options:nil] lastObject];
    cell.subTask = subTask;
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
