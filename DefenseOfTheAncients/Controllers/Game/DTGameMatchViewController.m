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

@interface DTGameMatchViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

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
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DTGameMatchTableViewCell class]) bundle:nil]
         forCellReuseIdentifier:kDTGameMatchTableViewCellIdentifier];
    self.tableView.mj_header = [DTRefreshHeader headerWithRefreshingBlock:^{
        [self requestdataSource];
    }];
    [self.tableView.mj_header beginRefreshing];
}

- (void)requestdataSource {
    [[DTApiManager sharedApiManager]requestGmaeMatchDataSourceBlocks:^(NSArray *matchItems) {
        
    } failBlocks:^(NSError *error) {
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionr {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DTGameMatchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDTGameMatchTableViewCellIdentifier];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 180;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
