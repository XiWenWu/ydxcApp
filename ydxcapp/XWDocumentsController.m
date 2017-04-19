//
//  XWDocumentsController.m
//  ydxcapp
//
//  Created by 希文 on 2017/4/18.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "XWDocumentsController.h"
#import "XWSubTaskController.h"

#import "Document.h"
#import "SubTask.h"
#import "DocCell.h"
#import "DocHeadView.h"

@interface XWDocumentsController ()

@property (nonatomic, strong) NSArray *subTasks;

@end

@implementation XWDocumentsController

- (NSArray *)subTasks {
    if (_subTasks == nil) {
        // 获取数据
        NSData *data = [NSJSONSerialization dataWithJSONObject:self.document.subTask options:NSJSONWritingPrettyPrinted error:nil];
        NSArray *dictArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        // 将字典数据转为模型数据
        NSMutableArray *subTaskArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            SubTask *subTask = [SubTask taskWithDict:dict];
            // 添加模型
            [subTaskArray addObject:subTask];
        }
        // 模型转换完毕,赋值
        self.subTasks = subTaskArray;
    }
    return _subTasks;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"任务明细";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    self.tableView.rowHeight = 70;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.tableHeaderView = [DocHeadView headerView:self.document];
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
#warning Incomplete implementation, return the number of rows
    return self.subTasks.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *id = @"docCell";
    
    DocCell *cell = [tableView dequeueReusableCellWithIdentifier:id];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DocCell" owner:nil options:nil] lastObject];
    }
    
    SubTask *subTask = self.subTasks[indexPath.row];
    
    cell.subTask = subTask;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 获取要传递的模型
    SubTask *subTask = self.subTasks[indexPath.row];
    // 创建要显示的子界面
    XWSubTaskController *subTaskView = [[XWSubTaskController alloc] init];
    // 传递子界面数据
    //taskView.data = item.subTask;
    // SubTask *subTask = [SubTask taskWithDict:[item valueForKey:@"subTask"][0]];
    subTaskView.subTask = subTask;
    // 隐藏tabbar
    self.hidesBottomBarWhenPushed = YES;
    // 跳转界面
    [self.navigationController pushViewController:subTaskView animated:YES];
    // 显示tabbar
    self.hidesBottomBarWhenPushed = NO;
    
}

@end
