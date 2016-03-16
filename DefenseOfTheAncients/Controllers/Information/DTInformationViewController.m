//
//  DTInformationViewController.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/15.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTInformationViewController.h"
#import "DTMatchViewController.h"
#import "DTMediaViewController.h"
#import "DTNavigationBarView.h"
#import "DTOfficialViewController.h"
#import "DTRefreshHeader.h"
#import "DTUpdateViewController.h"
#import "DTWholeViewController.h"
#import <MJRefresh/MJRefresh.h>

@interface DTInformationViewController () <UIScrollViewDelegate>

@property (nonatomic, retain) DTNavigationBarView *naTabView;
@property (nonatomic, retain) UIScrollView *scrollViewDown;
@property (nonatomic, retain) NSArray *arr;

@end

@implementation DTInformationViewController

#pragma mark - Lift Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViews];
}

#pragma mark - Getters & Setters

- (UIScrollView *)scrollViewDown {
    if (!_scrollViewDown) {
        self.scrollViewDown = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        self.scrollViewDown.contentSize = CGSizeMake(kScreenWidth * 5, 0);
        self.scrollViewDown.pagingEnabled = YES;
        self.scrollViewDown.bounces = NO;
        self.scrollViewDown.delegate = self;
        [self.view addSubview:self.scrollViewDown];
    }
    return _scrollViewDown;
}

#pragma mark - init Views

- (void)setUpViews {
    self.view.backgroundColor = [UIColor whiteColor];
    self.arr = @[ @"全部", @"官方", @"更新", @"媒体", @"赛事" ];
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    self.navigationController.navigationBar.translucent = NO;
    self.naTabView = [[DTNavigationBarView alloc] initWithFrame:CGRectMake(0, 20, kScreenWidth, 40) withWidth:kScreenWidth withArray:self.arr];
    self.navigationItem.titleView = self.naTabView;
    self.scrollViewDown.contentOffset = CGPointMake(0, 0);
    [self addChildViewControllerToScroller];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deliverValue:) name:@"DTNavigationBarView" object:nil];
}

- (void)addChildViewControllerToScroller {
    DTWholeViewController *wholeVC = [[DTWholeViewController alloc] init];
    DTOfficialViewController *OfficalVC = [[DTOfficialViewController alloc] init];
    DTUpdateViewController *updateVC = [[DTUpdateViewController alloc] init];
    DTMediaViewController *mediaVC = [[DTMediaViewController alloc] init];
    DTMatchViewController *matchVC = [[DTMatchViewController alloc] init];
    
    [self addChildViewController:wholeVC];
    [self addChildViewController:OfficalVC];
    [self addChildViewController:updateVC];
    [self addChildViewController:mediaVC];
    [self addChildViewController:matchVC];

    wholeVC.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    OfficalVC.view.frame = CGRectMake(kScreenWidth, 0, kScreenWidth, kScreenHeight);
    updateVC.view.frame = CGRectMake(2 * kScreenWidth, 0, kScreenWidth, kScreenHeight);
    mediaVC.view.frame = CGRectMake(3 * kScreenWidth, 0, kScreenWidth, kScreenHeight);
    matchVC.view.frame = CGRectMake(4 * kScreenWidth, 0, kScreenWidth, kScreenHeight);

    [self.scrollViewDown addSubview:wholeVC.view];
    [self.scrollViewDown addSubview:OfficalVC.view];
    [self.scrollViewDown addSubview:updateVC.view];
    [self.scrollViewDown addSubview:mediaVC.view];
    [self.scrollViewDown addSubview:matchVC.view];
}

#pragma mark - ScrollDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.naTabView deliver:scrollView];
}

#pragma mark - NSNotificationCenter selector

- (void)deliverValue:(NSNotification *)notification {
    NSString *str = [notification object];
    CGFloat temp = [str intValue];
    self.scrollViewDown.contentOffset = CGPointMake(temp * kScreenWidth, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
