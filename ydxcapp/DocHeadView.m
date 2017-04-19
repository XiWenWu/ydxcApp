//
//  DocHeadView.m
//  ydxcapp
//
//  Created by 希文 on 2017/4/18.
//  Copyright © 2017年 xiwen. All rights reserved.
//

/*
 // 状态
 @property (nonatomic, copy) NSString *statetext;
 // 名称
 @property (nonatomic, copy) NSString *text;
 // 类型
 @property (nonatomic, copy) NSString *typetext;
 // 发布时间
 @property (nonatomic, copy) NSString *createtime;
 // 开始时间
 @property (nonatomic, copy) NSString *startdate;
 // 执行人
 @property (nonatomic, copy) NSString *username;
 // 备注
 @property (nonatomic, copy) NSString *memo;
 // 子任务
 @property (nonatomic, strong) SubTask *subTask;
 */

#import "DocHeadView.h"
#import "Document.h"

@interface DocHeadView ()

@property (weak, nonatomic) IBOutlet UILabel *statetext;
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UILabel *typetext;
@property (weak, nonatomic) IBOutlet UILabel *createtime;
@property (weak, nonatomic) IBOutlet UILabel *startdate;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *memo;


@end

@implementation DocHeadView

- (void)setDocument:(Document *)document {
    _document = document;
    self.statetext.text   = document.statetext;
    self.text.text        = document.text;
    self.typetext.text    = document.typetext;
    self.createtime.text  = document.createtime;
    self.startdate.text   = document.startdate;
    self.username.text    = document.username;
    self.memo.text        = document.memo;
}

+ (instancetype) headerView:(Document *)document {
    DocHeadView *cell = [[[NSBundle mainBundle] loadNibNamed:@"DocHeadView" owner:nil options:nil] lastObject];
    cell.document = document;
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
