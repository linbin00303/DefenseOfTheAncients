//
//  DTGameViewController.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/15.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTApiManager+DTGame.h"
#import "DTApiManager.h"
#import "DTGameModel.h"
#import "DTGameViewController.h"
#import "DTRefreshFooter.h"
#import "DTRefreshHeader.h"
#import "DTScheduleTableViewCell.h"
#import "DTGameTool.h"

@interface DTGameViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataSource;
@property (nonatomic, assign) NSInteger pageIndex;

@end

@implementation DTGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViews];
}

- (void)setUpViews {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DTScheduleTableViewCell class]) bundle:nil]
         forCellReuseIdentifier:kDTScheduleTableViewCellIdentifier];
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [DTRefreshHeader headerWithRefreshingBlock:^{
      self.pageIndex = 1;
      [weakSelf requestDataSource];
    }];

    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [DTRefreshFooter footerWithRefreshingBlock:^{
      weakSelf.pageIndex++;
      [self requestDataSource];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    DTGameHomeModel *gameItem = self.dataSource[section];
    return gameItem.agendas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DTScheduleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDTScheduleTableViewCellIdentifier];
    DTGameHomeModel *gameItem = self.dataSource[indexPath.section];
    [cell setUpDTScheduleTableViewCellViewsWithAgendasModel:gameItem.agendas[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    DTGameHomeModel *gameItem = self.dataSource[section];
    
    return [DTGameTool createSectionheaderWithTitleString:gameItem.date];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (void)requestDataSource {
    if (!self.dataSource) {
        self.dataSource = [[NSMutableArray alloc] init];
    }
    [[DTApiManager sharedApiManager] requestGameHomeDatasourceSuccBlocks:^(NSArray *gameItems) {
      if (self.pageIndex == 1) {
          [self.dataSource removeAllObjects];
      }
      [self.dataSource addObjectsFromArray:gameItems];
      [self.tableView reloadData];
      [self stopRefreshing];
    }
        failBlocks:^(NSError *error) {
          [self stopRefreshing];
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
}

@end
