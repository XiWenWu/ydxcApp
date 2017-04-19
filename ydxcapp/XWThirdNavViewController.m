//
//  XWThirdNavViewController.m
//  ydxcapp
//
//  Created by 希文 on 2017/3/21.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "XWThirdNavViewController.h"
#import "XWThirdController.h"

@interface XWThirdNavViewController ()

@end

@implementation XWThirdNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    XWThirdController *thirdView = [[XWThirdController alloc] init];
    
    self.viewControllers = @[thirdView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
