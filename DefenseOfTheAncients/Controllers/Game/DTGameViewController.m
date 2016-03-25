//
//  DTGameViewController.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/15.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//
#import "DTGameViewController.h"
#import "DTNavigationBarView.h"
#import "DTScheduleViewController.h"

@interface DTGameViewController () <UIScrollViewDelegate>
@property (nonatomic, retain) DTNavigationBarView *naTabView;
@property (nonatomic, retain) UIScrollView *scrollViewDown;
@property (nonatomic, retain) NSArray *arr;
@end

@implementation DTGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViews];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self addChildViewControllerToScroller];

}

#pragma mark - Getters & Setters

- (UIScrollView *)scrollViewDown {
    if (!_scrollViewDown) {
        self.scrollViewDown = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        self.scrollViewDown.contentSize = CGSizeMake(kScreenWidth * 3, 0);
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
    self.arr = @[ @"赛程", @"赛事", @"战队" ];
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    self.navigationController.navigationBar.translucent = NO;
    self.naTabView = [[DTNavigationBarView alloc] initWithFrame:CGRectMake(0, 20, kScreenWidth, 40) withWidth:kScreenWidth withArray:self.arr];
    self.navigationItem.titleView = self.naTabView;
    self.scrollViewDown.contentOffset = CGPointMake(0, 0);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deliverValue:) name:@"DTNavigationBarView" object:nil];
}

- (void)addChildViewControllerToScroller {
    DTScheduleViewController *ScheduleVC = [[DTScheduleViewController alloc] init];
    
    [self addChildViewController:ScheduleVC];
    
    ScheduleVC.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - 44);
   
    
    [self.scrollViewDown addSubview:ScheduleVC.view];

}

#pragma mark - NSNotificationCenter selector

- (void)deliverValue:(NSNotification *)notification {
    NSString *str = [notification object];
    CGFloat temp = [str intValue];
    self.scrollViewDown.contentOffset = CGPointMake(temp * kScreenWidth, 0);
}

#pragma mark - ScrollDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.naTabView deliver:scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
