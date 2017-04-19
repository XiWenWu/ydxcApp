//
//  XWLogin2ViewController.m
//  ydxcapp
//
//  Created by 希文 on 2017/4/14.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "XWLogin2ViewController.h"
#import "AFHTTPSessionManager.h"
#import "XWTabBarViewController.h"
#import "XWUserInfo.h"

@interface XWLogin2ViewController ()<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *LogPhone;
@property (weak, nonatomic) IBOutlet UITextField *LogPwd;
@property (weak, nonatomic) IBOutlet UIButton *LogBtn;

@property (strong, nonatomic) NSDictionary *userInfo;


- (IBAction)login;

@end

@implementation XWLogin2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化Btn的状态
    self.LogBtn.enabled = NO;
    // Do any additional setup after loading the view.
    // 设置代理  监听文字改动 需要遵循代理协议 <UITextViewDelegate>
    //  监听控件有3种方法  1 attaget  2 设置代理  3 通知
    //  监听通知  参数 1 监听的对象 2 监听触发的函数 3 监听触发的事件 4 被监听的对象
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.LogPhone];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.LogPwd];
    
    // 点击return 或者空白 收起键盘
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fingerTapped:)];
    [self.view addGestureRecognizer:singleTap];
}

- (void)dealloc {
    // 移除监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
// 文字发生改变的时候调用
- (void)textChange{
    self.LogBtn.enabled = (self.LogPhone.text.length && self.LogPwd.text.length);
}

//点击空白退出键盘
-(void)fingerTapped:(UITapGestureRecognizer *)gestureRecognizer
{
    [self.view endEditing:YES];
    
}

- (IBAction)login {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *url = @"http://usercenter.cloudowr.cn/auth";

    NSDictionary *param = @{@"k":@"phone", @"v":@"17092613517", @"p":self.LogPwd.text};
    // NSDictionary *param = @{@"k":@"phone", @"v":self.LogPhone.text, @"p":self.LogPwd.text};
    
    [manager POST:url parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 跳转
        if (responseObject) {
            // 字典转模型
            XWUserInfo *userInfo = [XWUserInfo infoWithDict:(NSDictionary *)responseObject];
            // 归档 存储模型数据
            [NSKeyedArchiver archiveRootObject:userInfo toFile:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]];
            [UIApplication sharedApplication].keyWindow.rootViewController = [[XWTabBarViewController alloc] init];
        } else {
            NSLog(@"登录失败");
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

@end

