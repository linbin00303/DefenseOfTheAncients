//
//  DTInformationViewController.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/15.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTInformationViewController.h"
#import <MJRefresh/MJRefresh.h>
#import "DTRefreshHeader.h"
#import "DTNavigationBarView.h"

@interface DTInformationViewController ()<UIScrollViewDelegate>

@property(nonatomic,retain)DTNavigationBarView *naTabView;
@property(nonatomic,retain)UIScrollView *scrollViewDown;
@property(nonatomic,retain)NSArray *arr;

@end

@implementation DTInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.arr = @[@"全部",@"官方",@"更新",@"媒体",@"赛事"];
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    self.navigationController.navigationBar.translucent = NO;
    self.naTabView = [[DTNavigationBarView alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, 40) withWidth:kScreenWidth withArray:self.arr];
    self.navigationItem.titleView = self.naTabView;
    [self createScrollViewDown];
}

- (void)createScrollViewDown{
    
    self.scrollViewDown=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.scrollViewDown.contentSize=CGSizeMake(kScreenWidth*5, 0);
    self.scrollViewDown.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:arc4random()%256/255.0];
    self.scrollViewDown.pagingEnabled=YES;
    self.scrollViewDown.bounces=NO;
    self.scrollViewDown.delegate = self;
    [self.view addSubview:self.scrollViewDown];
       ///传值
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(deliverValue:) name:@"123" object:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.naTabView deliver:scrollView];
}

- (void)deliverValue:(NSNotification *)notification{
    NSString *str = [notification object];
    CGFloat temp = [str intValue];
    self.scrollViewDown.contentOffset = CGPointMake(temp * kScreenWidth, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
