//
//  DTOfficialViewController.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/16.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//
#import "DTApiManager+DTInformation.h"
#import "DTApiManager.h"
#import "DTInformationCell.h"
#import "DTRefreshFooter.h"
#import "DTRefreshHeader.h"
#import "DTOfficialViewController.h"
#import "DTInformationDetailViewController.h"

@interface DTOfficialViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (assign, nonatomic) NSInteger pageIndex;
@property (strong, nonatomic) NSMutableArray *dataSource;
@end

@implementation DTOfficialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViews];
}

- (void)requestDataSource {
    if (!self.dataSource) {
        self.dataSource = [NSMutableArray new];
    }
    [[DTApiManager sharedApiManager]requestInformationForOfficalWithPageIndex:self.pageIndex SuccBlocks:^(NSArray *data){
        if (self.pageIndex == 0) {
            [self.dataSource removeAllObjects];
        }
        [self.dataSource addObjectsFromArray:data];
        [self.tableView reloadData];
        [self stopRefreshing];
    } failBlocks:^(NSError *error) {
        [self stopRefreshing];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DTInformationCell *cell = [tableView dequeueReusableCellWithIdentifier:kDTInformationCellIdentifier];
    [cell setUpCellViewsWithItem:self.dataSource[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DTInformationModels *item =self.dataSource[indexPath.row];
    DTInformationDetailViewController *detailVC = [[DTInformationDetailViewController alloc]init];
    detailVC.deatilUrl = item.url;
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 102.0f;
}

- (void)setUpViews {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DTInformationCell class]) bundle:nil]
         forCellReuseIdentifier:kDTInformationCellIdentifier];
    
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [DTRefreshHeader headerWithRefreshingBlock:^{
        self.pageIndex = 1;
        [weakSelf requestDataSource];
    }];
    
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [DTRefreshFooter footerWithRefreshingBlock:^{
        self.pageIndex++;
        [weakSelf requestDataSource];
    }];
}

- (void)stopRefreshing {
    if ([self.tableView.mj_header isRefreshing]) {
        [self.tableView.mj_header endRefreshing];
    }
    if ([self.tableView.mj_footer isRefreshing]) {
        [self.tableView.mj_footer endRefreshing];
    }
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

@end
