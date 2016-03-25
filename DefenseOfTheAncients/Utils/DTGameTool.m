//
//  DTGameTool.m
//  DefenseOfTheAncients
//
//  Created by Mr.Yao on 16/3/25.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "DTGameTool.h"
#import <Masonry/Masonry.h>

@implementation DTGameTool

+ (UIView *)createSectionheaderWithTitleString:(NSString *)title {
    UIView *sectionView = [[UIView alloc] init];
    sectionView.frame = CGRectMake(0, 0, kScreenWidth, 40);
    sectionView.backgroundColor = [HXColor hx_colorWithHexRGBAString:@"e2e2e2"];
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:13];
    [sectionView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.equalTo(sectionView);
      make.center.equalTo(sectionView);
      make.height.mas_equalTo(@20);
    }];

    titleLabel.text = title;
    return sectionView;
}

@end
