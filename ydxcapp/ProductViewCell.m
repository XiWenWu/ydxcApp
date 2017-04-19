//
//  ProductViewCell.m
//  ydxcapp
//
//  Created by 希文 on 2017/3/21.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "ProductViewCell.h"
#import "ProductData.h"

@interface ProductViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;


@end

@implementation ProductViewCell

- (void)setProduct:(ProductData *)product {
    _product = product;
    self.iconView.image = [UIImage imageNamed:product.icon];
    self.titleView.text = product.title;
}

@end
