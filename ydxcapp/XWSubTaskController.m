//
//  XWSubTaskController.m
//  ydxcapp
//
//  Created by 希文 on 2017/4/18.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "XWSubTaskController.h"
#import "XWItemController.h"

#import "SubTask.h"
#import "SubTaskCell.h"
#import "SubTaskHeadView.h"
#import "SubTaskItem.h"

@interface XWSubTaskController ()

@property (nonatomic, strong) NSArray *items;

@end

@implementation XWSubTaskController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"子任务";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    self.tableView.rowHeight = 70;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //self.tableView.tableHeaderView = [DocHeadView headerView:self.document];
    self.tableView.tableHeaderView = [SubTaskHeadView headerView:self.subTask];
}

- (NSArray *)items {
    if (_items == nil) {
        // 获取数据
        NSData *data = [NSJSONSerialization dataWithJSONObject:self.subTask.item options:NSJSONWritingPrettyPrinted error:nil];
        NSArray *dictArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        // 将字典数据转为模型数据
        NSMutableArray *itemArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            SubTaskItem *item = [SubTaskItem itemWithDict:dict];
            // 添加模型
            [itemArray addObject:item];
            
        }
        // 模型转换完毕,赋值
        self.items = itemArray;
    }
    return _items;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *id = @"SubTaskCell";
    
    SubTaskCell *cell = [tableView dequeueReusableCellWithIdentifier:id];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SubTaskCell" owner:nil options:nil] lastObject];
    }
    
    SubTaskItem *item = self.items[indexPath.row];
    
    cell.item = item;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //
    XWItemController *itemView = [[XWItemController alloc] init];
    // 隐藏tabbar
    self.hidesBottomBarWhenPushed = YES;
    // 跳转界面
    [self.navigationController pushViewController:itemView animated:YES];
    // 显示tabbar
    self.hidesBottomBarWhenPushed = NO;
    
}


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
