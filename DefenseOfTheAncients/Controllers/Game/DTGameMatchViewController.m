//
//  DTMatchViewController.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/28.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTApiManager+DTGame.h"
#import "DTApiManager.h"
#import "DTGameMatchTableViewCell.h"
#import "DTGameMatchViewController.h"
#import "DTRefreshHeader.h"
#import "DTSegmentedControl.h"

@interface DTGameMatchViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (weak, nonatomic) IBOutlet DTSegmentedControl *segmentControl;
@property (nonatomic, assign) NSInteger type;
@end

@implementation DTGameMatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.type = 1;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DTGameMatchTableViewCell class]) bundle:nil]
         forCellReuseIdentifier:kDTGameMatchTableViewCellIdentifier];
    self.tableView.mj_header = [DTRefreshHeader headerWithRefreshingBlock:^{
      [self requestdataSource];
    }];
    [self.tableView.mj_header beginRefreshing];
}

- (void)stopRefreshing {
    if ([self.tableView.mj_header isRefreshing]) {
        [self.tableView.mj_header endRefreshing];
    }
    if ([self.tableView.mj_footer isRefreshing]) {
        [self.tableView.mj_footer endRefreshing];
    }
}

- (void)requestdataSource {
    if (!self.dataSource) {
        self.dataSource = [[NSMutableArray alloc] init];
    }
    [[DTApiManager sharedApiManager] requestGmaeMatchDataWithType:self.type
        SourceBlocks:^(NSArray *matchItems) {
          [self.dataSource addObjectsFromArray:matchItems];
          [self.tableView reloadData];
          [self stopRefreshing];
        }
        failBlocks:^(NSError *error) {
          [self stopRefreshing];

        }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionr {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DTGameMatchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDTGameMatchTableViewCellIdentifier];
    [cell setUpGameMatchCellViewsWithDTGameMatchItem:self.dataSource[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 180;
}
- (IBAction)segmentControlAction:(id)sender {
    DTSegmentedControl *segmentControl = (DTSegmentedControl *)sender;
    self.type = segmentControl.selectedSegmentIndex+1;
    [segmentControl setSelectedSegmentIndex:segmentControl.selectedSegmentIndex];
    [self.dataSource removeAllObjects];
    [self requestdataSource];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
