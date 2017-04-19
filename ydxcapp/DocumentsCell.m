//
//  DocumentsCell.m
//  ydxcapp
//
//  Created by 希文 on 2017/4/18.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "DocumentsCell.h"
#import "Document.h"

@interface DocumentsCell ()

@property (weak, nonatomic) IBOutlet UILabel *text;

@property (weak, nonatomic) IBOutlet UILabel *createtime;

@property (weak, nonatomic) IBOutlet UILabel *statetext;


@end

@implementation DocumentsCell

- (void) setDocument:(Document *)document {
    _document = document;
    self.text.text       = document.text;
    self.createtime.text = document.createtime;
    self.statetext.text  = document.statetext;
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
