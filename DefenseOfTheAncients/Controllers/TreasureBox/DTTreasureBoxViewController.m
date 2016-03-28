//
//  DTTreasureBoxViewController.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/15.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTApiManager+DTTreasureBox.h"
#import "DTApiManager.h"
#import "DTTreasureBoxViewController.h"
#import "DTTreasureCell.h"
#import "DTNavItems.h"
#import "DTInformationDetailViewController.h"

@interface DTTreasureBoxViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *dataSource;

@end

@implementation DTTreasureBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [DTNavItems titleViewWithText:@"宝盒"];
    [self setUpViews];
    [self requestDataSource];
}

- (void)requestDataSource {
    
    if (!self.dataSource) {
        self.dataSource = [[NSMutableArray alloc]init];
    }

    [[DTApiManager sharedApiManager] requestBaoheListDataSuccBlocks:^(NSArray *BaoheItems) {
        [self.dataSource addObjectsFromArray:BaoheItems];
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [self.dataSource enumerateObjectsUsingBlock:^(DTTreasureBoxModels * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [dict setObject:obj forKey:obj.title];
        }];  //数据有重复的  在此去掉
        
        self.dataSource = [NSMutableArray arrayWithArray:[dict allValues]];
        [self.collectionView reloadData];
    }
        failBlocks:^(NSError *error){
            
    }];
}

- (void)setUpViews {
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([DTTreasureCell class]) bundle:nil]
          forCellWithReuseIdentifier:kDTTreasureCellIdentifier];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DTTreasureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kDTTreasureCellIdentifier forIndexPath:indexPath];
    [cell setUpDTTreasureCellViewsWithTreasureBoxModel:self.dataSource[indexPath.item]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(105,110);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DTTreasureBoxModels *item = self.dataSource[indexPath.row];
    DTInformationDetailViewController *detailVC = [[DTInformationDetailViewController alloc]init];
    detailVC.deatilUrl =item.url;
    detailVC.titleName = item.title;
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
