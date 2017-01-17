//
//  NextViewController.m
//  DropdowBigDemo
//
//  Created by 陈伟鑫 on 2017/1/15.
//  Copyright © 2017年 陈伟鑫. All rights reserved.
//

#import "NextViewController.h"
#import "UIView+Category.h"
#define kTopImageViewHeight 200

@interface NextViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    UIView *_headView;
    UIImageView *_headImageView;
    UIButton *_backBtn;
}
@end

@implementation NextViewController
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    //取消自动调整滚动视图间距 -- ViewController + NAV 会自动调整tableView的contentInset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    //设置表格的间距
    _tableView.contentInset = UIEdgeInsetsMake(kTopImageViewHeight, 0, 0, 0);
    //设置滚动指示器的间距
    _tableView.scrollIndicatorInsets = _tableView.contentInset;
    [self.view addSubview:_tableView];
    
    [self setHeadView];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)setHeadView {
    _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, kTopImageViewHeight)];
    _headView.backgroundColor = [UIColor purpleColor];
    _headView.clipsToBounds = YES;
    [self.view addSubview:_headView];
    
    _headImageView = [[UIImageView alloc]init];
    _headImageView.frame = _headView.bounds;
    _headImageView.image = [UIImage imageNamed:@"11"];
    _headImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //图片按照比例缩放
    _headImageView.contentMode = UIViewContentModeScaleAspectFill;
    [_headView addSubview:_headImageView];
    
    _backBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    _backBtn.frame = CGRectMake(15, 25, 60, 30);
    _backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backBtn];
    
}
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark -- UITableViewDelegate and DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1000;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifity = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifity];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifity];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",(long)indexPath.row];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //contentOffset.y 定点y轴偏移量
    CGFloat offset = scrollView.contentOffset.y + scrollView.contentInset.top;
//    NSLog(@"contentOffsex.y : %0.1f",scrollView.contentOffset.y);
//    NSLog(@"contentInset.top : %0.1f",scrollView.contentInset.top);
//    NSLog(@"offsex:%0.1f",offset);
    
    CGFloat min = kTopImageViewHeight - 64;
    
    
    if (offset <= 0) {
        //下拉放大
        
        _headView.wx_y = 0;
        _headView.wx_height = kTopImageViewHeight - offset;
    }
    else {
        
        //图像移动
        //这里要把_headView重新设置回原来的高度，不然偶尔会受到上边下拉放大的影响
        _headView.wx_height = kTopImageViewHeight;
        _headView.wx_y = -MIN(min, offset);
  
        
        //设置透明度
        //NSLog(@"alpha:%f",offset/min);  // 从 0 - 1
        CGFloat alpha = 1 - (offset / min); // 从1 - 0
        _headImageView.alpha = alpha;
        
    }

}
@end
