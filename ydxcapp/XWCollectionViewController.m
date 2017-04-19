//
//  XWCollectionViewController.m
//  ydxcapp
//
//  Created by 希文 on 2017/3/21.
//  Copyright © 2017年 xiwen. All rights reserved.
//

#import "XWCollectionViewController.h"
#import "ProductData.h"
#import "ProductViewCell.h"
#import "XWViewController.h"

#define ProductCellId @"product"

@interface XWCollectionViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) NSArray *products;

@end

@implementation XWCollectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"移动巡查";
    
    // 设置返回按钮文字颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    //  设置字体大小，加粗，字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //  导航设置背景色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:51.0/255 green:120.0/255 blue:1 alpha:1];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    
    UINib *nib = [UINib nibWithNibName:@"ProductViewCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:ProductCellId];
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (id)init{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(80, 80);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 20;
    layout.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20);
    return [super initWithCollectionViewLayout:layout];
    
}

- (NSArray *)products {
    if (_products == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"product.json" ofType:nil];
        
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        NSArray *ditArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        
        NSMutableArray *productArray = [NSMutableArray array];
        
        for (NSDictionary *dict in ditArray) {
            
            ProductData *product = [ProductData productWithDict:dict];
            
            [productArray addObject:product];
        }
        
        _products = productArray;
    }
    return _products;
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProductViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ProductCellId forIndexPath:indexPath];
    // 传递模型
    cell.product = self.products[indexPath.row];
    // Configure the cell
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

#pragma mark webView
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ProductData *data = self.products[indexPath.row];
    XWViewController *view = [[XWViewController alloc] init];
    view.data = data;
    // 隐藏tabbar
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:view animated:YES];
    // 显示tabbar
    self.hidesBottomBarWhenPushed = NO;
}



/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
