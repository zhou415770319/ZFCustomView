//
//  TestLableCell.m
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/3/10.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "TestLableCell.h"
#import "TestCellModel.h"

@implementation TestLableCell

-(void)setCellInfo:(ZFTableViewCellModel *)cellInfo{
    
    TestCellModel *Tmodel = (TestCellModel *)cellInfo;
    self.title.text = Tmodel.title;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
