//
//  XWSecondController.m
//  ydxcapp
//
//  Created by 希文 on 2017/3/21.
//  Copyright © 2017年 xiwen. All rights reserved.
//
// 控制器
#import "XWSecondController.h"
#import "XWDocumentsController.h"
// 模型
#import "Document.h"
#import "DocumentsCell.h"
// 插件
#import "AFHTTPSessionManager.h"

@interface XWSecondController ()<UITableViewDataSource>
// 所有的任务数据
@property (nonatomic, strong) NSArray *documents;

@end

@implementation XWSecondController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpSecondController];

    [self setUpItems];
}
- (void) setUpSecondController {
    // 设置返回按钮文字颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    self.navigationItem.title = @"任务";
    //  设置字体大小，加粗，字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //  导航设置背景色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:51.0/255 green:120.0/255 blue:1 alpha:1];
    
    self.tableView.rowHeight = 70;
}

- (void) setUpItems {
    // 创建请求管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 发送请求
    [manager GET:@"http://task.cloudowr.cn/" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"http://task.cloudowr.cn/");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 获取数据
        NSArray *dictArray = responseObject[@"documents"];
        // 将字典数据转为模型数据
        NSMutableArray *documentArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            Document *document = [Document documentWithDict:dict];
            // 添加模型
            [documentArray addObject:document];
        }
        // 模型转换完毕,赋值
        self.documents = documentArray;
        // 刷新表格
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"XWSecondController -- NSError");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.documents.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *id = @"document";
    
    DocumentsCell *cell = [tableView dequeueReusableCellWithIdentifier:id];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DocumentsCell" owner:nil options:nil] lastObject];
    }
    
    Document *document = self.documents[indexPath.row];
    
    cell.document = document;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 获取要传递的模型
    Document *document = self.documents[indexPath.row];
    // 创建要显示的子界面
    XWDocumentsController *documentsView = [[XWDocumentsController alloc] init];
    // 传递子界面数据
    //taskView.data = item.subTask;
    // SubTask *subTask = [SubTask taskWithDict:[item valueForKey:@"subTask"][0]];
    documentsView.document = document;
    // 隐藏tabbar
    self.hidesBottomBarWhenPushed = YES;
    // 跳转界面
    [self.navigationController pushViewController:documentsView animated:YES];
    // 显示tabbar
    self.hidesBottomBarWhenPushed = NO;
    
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
