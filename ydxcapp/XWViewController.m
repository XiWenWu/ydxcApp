//
//  XWViewController.m
//  ydxcapp
//
//  Created by 希文 on 2017/3/22.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "XWViewController.h"
#import "ProductData.h"

@interface XWViewController ()

@end

@implementation XWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.data.title;
    UIWebView *web = [[UIWebView alloc] init];
    CGSize size = self.view.frame.size;
    web.frame = CGRectMake(0, 0, size.width, size.height);
    
    
    
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:self.data.url]];
    
    [self.view addSubview:web];
    
    [web loadRequest:request];
    
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
