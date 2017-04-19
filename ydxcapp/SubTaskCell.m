//
//  SubTaskCell.m
//  ydxcapp
//
//  Created by 希文 on 2017/4/18.
//  Copyright © 2017年 xiwen. All rights reserved.
//

/*
 // 名称
 @property (nonatomic, copy) NSString *usetypetext;
 // 检查项目
 @property (nonatomic, copy) NSString *text;
 // 状态
 @property (nonatomic, assign) int _bz_status;
 */

#import "SubTaskCell.h"
#import "SubTaskItem.h"
@interface SubTaskCell ()

@property (weak, nonatomic) IBOutlet UILabel *usetypetext;
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UILabel *_bz_status;

@end

@implementation SubTaskCell

- (void) setItem:(SubTaskItem *)item {
    _item = item;
    self.usetypetext.text = item.usetypetext;
    self.text.text = item.text;
    if (item._bz_status == 1) {
        self._bz_status.text = @"已完成";
    } else {
        self._bz_status.text = @"未完成";
    }
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
