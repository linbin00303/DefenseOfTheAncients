//
//  DTNavigationBarView.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/16.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTNavigationBarView.h"

@interface DTNavigationBarView ()

@property(nonatomic,assign)CGFloat viewWidth;
@property(nonatomic,assign)CGFloat viewHeight;
@property(nonatomic,retain)UIScrollView *scrollViewTop;
@property(nonatomic,retain)UIView *lineView;
@property(nonatomic,retain)NSArray *titleArray;
@property(nonatomic,assign)NSInteger presentTag;
@property(nonatomic,assign)NSInteger arrayCount;
@property(nonatomic,assign)NSInteger width;
@property(nonatomic,assign)BOOL flag;

@end

@implementation DTNavigationBarView

- (instancetype)initWithFrame:(CGRect)frame withWidth:(CGFloat)width withArray:(NSArray *)arr{
    self=[super initWithFrame:frame];
    if (self) {
        self.viewWidth = width;
        self.titleArray = arr;
        self.arrayCount = self.titleArray.count;
        [self createTabBarUI];
    }
    return self;
}

- (void)createTabBarUI{
    self.width = 60;
    self.scrollViewTop = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.viewWidth - 75, 40)];
    self.scrollViewTop.contentSize = CGSizeMake(self.arrayCount * 60 , 0);
    [self addSubview:self.scrollViewTop];
    
    for (int i = 0; i < self.arrayCount; i ++) {
        UIButton *button=[UIButton buttonWithType:0];
        button.frame=CGRectMake(self.width * i, 0, self.width, 40);
        [button setTitle:self.titleArray[i] forState:0];
        button.tag=i+10000;
        [button setTitleColor:[UIColor whiteColor] forState:0];
        [button addTarget:self action:@selector(click:) forControlEvents:1<<6];
        [self.scrollViewTop addSubview:button];
    }
    self.presentTag = 10000;
    self.flag = NO;
}

- (void)click:(UIButton *)button{
    self.flag = YES;
    UIButton *tagButton = (UIButton *)[self viewWithTag:self.presentTag];
    tagButton.titleLabel.font = [UIFont systemFontOfSize:17];
    
    button.titleLabel.font = [UIFont systemFontOfSize:25];
    self.presentTag = button.tag;
    
    if (button.tag >= 10004 && button.tag < (self.arrayCount+10000-3)) {
        self.scrollViewTop.contentOffset=CGPointMake(self.width*(button.tag-2-10000 ), 0);
    }
    
    NSString *str=[NSString stringWithFormat:@"%ld",(button.tag-10000)];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"123" object:str];
    self.flag = NO;
}

- (void)deliver:(UIScrollView *)scrollView{
    CGFloat temp = scrollView.contentOffset.x/self.viewWidth;
    if (temp >= 3 && temp < (self.arrayCount - 2.5)) {
        self.scrollViewTop.contentOffset=CGPointMake(self.width * (temp - 3), 0);
    }
    
    if (self.flag == NO) {
        UIButton *button = (UIButton *)[self viewWithTag:self.presentTag];
        button.titleLabel.font = [UIFont systemFontOfSize:17];
        UIButton *button1 = (UIButton *)[self viewWithTag:(temp+10000)];
        button1.titleLabel.font = [UIFont systemFontOfSize:25];
        self.presentTag = temp +10000;
    }
}

@end
