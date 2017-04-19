//
//  DocCell.m
//  ydxcapp
//
//  Created by 希文 on 2017/4/18.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "DocCell.h"
#import "SubTask.h"
@interface DocCell ()
// 自动雨量站
@property (weak, nonatomic) IBOutlet UILabel *typetext;
// 府城街道光明村
@property (weak, nonatomic) IBOutlet UILabel *village;
// 府城街道
@property (weak, nonatomic) IBOutlet UILabel *town;



@end


@implementation DocCell

- (void)setSubTask:(SubTask *)subTask {
    _subTask = subTask;
    self.typetext.text  = subTask.typetext;
    self.village.text   = subTask.village;
    self.town.text      = subTask.town;
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
