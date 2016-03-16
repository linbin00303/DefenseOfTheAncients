//
//  DTInformationDetailViewController.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/16.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTInformationDetailViewController.h"
#import <Masonry/Masonry.h>
#import <MJRefresh/MJRefresh.h>
#import "DTRefreshFooter.h"
#import "DTRefreshHeader.h"
#import "DTNavItems.h"
@interface DTInformationDetailViewController ()<UIWebViewDelegate,UIScrollViewDelegate>

@property (nonatomic, strong)UIWebView *webView;

@end

@implementation DTInformationDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItems = [DTNavItems backButtonItemWithTarget:self.navigationController action:@selector(popViewControllerAnimated:)];
    self.navigationItem.titleView = [DTNavItems titleViewWithText:@"资讯详情"];


    NSURL* url = [NSURL URLWithString:_deatilUrl];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];//加载
    // Do any additional setup after loading the view from its nib.
}

- (UIWebView *)webView {
    if (!_webView){
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        _webView.scrollView.scrollsToTop = YES;
        _webView.delegate = self;
        _webView.scrollView.delegate = self;
        _webView.scalesPageToFit = YES;
        [self.view addSubview:_webView];
    }
    return _webView;
}

-(BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*) reuqest navigationType: (UIWebViewNavigationType)navigationType{
    DTLog(@"%@",reuqest.URL);
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
