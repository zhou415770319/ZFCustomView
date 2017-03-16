//
//  ClassTableView.m
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/3/16.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "ClassTableViewCell.h"

@implementation ClassTableViewCell


-(void)setCellInfo:(ZFTableViewCellModel *)cellInfo{
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    lab.textColor = [UIColor redColor];
    lab.textAlignment =NSTextAlignmentCenter;
    lab.text = cellInfo.title;
    
    [self addSubview:lab];
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
        // Drawing code
}

@end
