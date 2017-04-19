//
//  XWSelfController.m
//  ydxcapp
//
//  Created by 希文 on 2017/3/21.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "XWThirdController.h"
#import "InfoData.h"
#import "InfoGroupData.h"

@interface XWThirdController ()

@property(strong, nonatomic) NSArray *groups;

@end

@implementation XWThirdController

- (NSArray *)groups{
    if (_groups == nil) {
        //  获得plist的全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"self.plist" ofType:nil];
        //  加载数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        //  将加dictArray里面所有字典转成模型对象，放到新的数组中
        NSMutableArray *groupArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            //  创建模型对象
            InfoGroupData *group = [InfoGroupData groupWithDict:dict];
            //  添加模型对象到数组中
            [groupArray addObject:group];
        }
        //  赋值
        _groups = groupArray;
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的";
    
    //  设置字体大小，加粗，字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    // self.tableView.rowHeight = 100;
    //  导航设置背景色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:51.0/255 green:120.0/255 blue:1 alpha:1];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    InfoGroupData *group = self.groups[section];
    
    return group.infos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //  定义循环标示
    static NSString *ID = @"xw";
    //  从缓存池中取出可以循环利用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //  缓存池中没有可循环利用的cell就新建一个cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    InfoGroupData *group = self.groups[indexPath.section];
    InfoData *data = group.infos[indexPath.row];
    
    // cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.textLabel.text = data.title;
    cell.detailTextLabel.text = data.msg;
    
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @" ";
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
