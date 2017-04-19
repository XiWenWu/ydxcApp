//
//  XWTabBarViewController.m
//  ydxcapp
//
//  Created by 希文 on 2017/3/20.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "XWTabBarViewController.h"
#import "XWFirstNavViewController.h"
#import "XWSecondNavViewController.h"
#import "XWThirdNavViewController.h"
#import "XWUserInfo.h"

@interface XWTabBarViewController ()

@end

@implementation XWTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UITabBarController *tb = [[UITabBarController alloc] init];
//    
//    XWFirstNavViewController *firstNav = [[XWFirstNavViewController alloc] init];
//    firstNav.view.backgroundColor = [UIColor blueColor];
//    firstNav.tabBarItem.title = @"首页";
//    firstNav.tabBarItem.image = [UIImage imageNamed:@"title_001"];
//    
//    XWSecondNavViewController *secondView = [[XWSecondNavViewController alloc] init];
//    secondView.view.backgroundColor = [UIColor redColor];
//    secondView.tabBarItem.title = @"任务";
//    secondView.tabBarItem.image = [UIImage imageNamed:@"title_002"];
//    
//    XWThirdNavViewController *thirdView = [[XWThirdNavViewController alloc] init];
//    secondView.view.backgroundColor = [UIColor greenColor];
//    secondView.tabBarItem.title = @"我的";
//    secondView.tabBarItem.image = [UIImage imageNamed:@"title_003"];
//    
    //    tb.viewControllers = @[firstNav, secondView, thirdView];
    XWFirstNavViewController *first = [[XWFirstNavViewController alloc] init];
    first.tabBarItem.title = @"首页";
    first.tabBarItem.image = [UIImage imageNamed:@"title_001"];
    
    XWSecondNavViewController *second = [[XWSecondNavViewController alloc] init];
    second.tabBarItem.title = @"任务";
    second.tabBarItem.image = [UIImage imageNamed:@"title_002"];
    
    XWThirdNavViewController *third = [[XWThirdNavViewController alloc] init];
    third.tabBarItem.title = @"我的";
    third.tabBarItem.image = [UIImage imageNamed:@"title_003"];
    
    self.viewControllers = @[first, second, third];
    
    XWUserInfo *info = [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]];
    
    NSLog(@"info = %@", [info valueForKey:@"uid"]);
    
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
