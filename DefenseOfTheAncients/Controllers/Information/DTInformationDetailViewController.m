//
//  DTInformationDetailViewController.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/16.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTInformationDetailViewController.h"
#import <MJRefresh/MJRefresh.h>
#import "DTRefreshFooter.h"
#import "DTRefreshHeader.h"
#import "DTNavItems.h"
#import "WebViewJavascriptBridge.h"

@interface DTInformationDetailViewController ()<UIWebViewDelegate,UIScrollViewDelegate>

@property (nonatomic, strong)UIWebView *webView;
@property WebViewJavascriptBridge *bridge;

@end

@implementation DTInformationDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItems = [DTNavItems backButtonItemWithTarget:self.navigationController action:@selector(popViewControllerAnimated:)];
    self.navigationItem.titleView = [DTNavItems titleViewWithText:@"资讯详情"];
    [WebViewJavascriptBridge enableLogging];
    
    self.bridge = [WebViewJavascriptBridge bridgeForWebView:_webView];
    [self.bridge setWebViewDelegate:self];
    

    [self.bridge registerHandler:@"getUserIdFromObjC" handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"js call getUserIdFromObjC, data from js is %@", data);
        if (responseCallback) {
            // 反馈给JS
            responseCallback(@{@"userId": @"123456"});
        }
    }];
    
    [self.bridge registerHandler:@"getBlogNameFromObjC" handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"js call getBlogNameFromObjC, data from js is %@", data);
        if (responseCallback) {
            // 反馈给JS
            responseCallback(@{@"blogName": @"标哥的技术博客"});
        }
    }];
    
    [self.bridge callHandler:@"getUserInfos" data:@{@"name": @"标哥"} responseCallback:^(id responseData) {
        NSLog(@"from js: %@", responseData);
    }];


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
