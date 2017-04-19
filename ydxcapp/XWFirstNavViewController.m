//
//  XWFirstNavViewController.m
//  ydxcapp
//
//  Created by 希文 on 2017/3/20.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "XWFirstNavViewController.h"
#import "XWCollectionViewController.h"

@interface XWFirstNavViewController ()

@end

@implementation XWFirstNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    XWCollectionViewController *collView = [[XWCollectionViewController alloc] init];
    
    self.viewControllers = @[collView];
    // Do any additional setup after loading the view.
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
