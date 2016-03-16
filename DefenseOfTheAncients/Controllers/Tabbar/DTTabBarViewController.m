//
//  DTTabBarViewController.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/15.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTTabBarViewController.h"

#import "DTGameViewController.h"
#import "DTInformationViewController.h"
#import "DTMineViewController.h"
#import "DTTreasureBoxViewController.h"
#import "DTVideoViewController.h"
#import "UIImage+ColorImage.h"

@interface DTTabBarViewController ()

@end

@implementation DTTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 定制外观
    self.tabBar.tintColor = [HXColor hx_colorWithHexRGBAString:@"#c21d02"];
    [[UITabBar appearance] setShadowImage:[UIImage imageWithColor:[UIColor blackColor]]];
    [[UITabBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor blackColor]]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor blackColor]] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];

    self.tabBar.translucent = NO;

    DTInformationViewController *informationVC = [[DTInformationViewController alloc] init];
    informationVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_3_normal"];
    informationVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_3_pressed"];
    informationVC.tabBarItem.title = @"资讯";
    UINavigationController *informationNavC = [[UINavigationController alloc] initWithRootViewController:informationVC];

    DTTreasureBoxViewController *treasureBoxVC = [[DTTreasureBoxViewController alloc] init];
    treasureBoxVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_5_normal"];
    treasureBoxVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_5_pressed"];
    treasureBoxVC.tabBarItem.title = @"宝盒";
    UINavigationController *treasureBoxNavC = [[UINavigationController alloc] initWithRootViewController:treasureBoxVC];

    DTGameViewController *gameVC = [[DTGameViewController alloc] init];
    gameVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_1_normal"];
    gameVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_1_pressed"];
    gameVC.tabBarItem.title = @"赛事";
    UINavigationController *gameNavC = [[UINavigationController alloc] initWithRootViewController:gameVC];

    DTVideoViewController *videoVC = [[DTVideoViewController alloc] init];
    videoVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_4_normal"];
    videoVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_4_pressed"];
    videoVC.tabBarItem.title = @"视频";
    UINavigationController *videoNavC = [[UINavigationController alloc] initWithRootViewController:videoVC];

    DTMineViewController *mineVC = [[DTMineViewController alloc] init];
    mineVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_2_normal"];
    mineVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_2_pressed"];
    mineVC.tabBarItem.title = @"我的";
    UINavigationController *mineNavC = [[UINavigationController alloc] initWithRootViewController:mineVC];

    self.viewControllers = @[ informationNavC, treasureBoxNavC, videoNavC, gameNavC, mineNavC ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
