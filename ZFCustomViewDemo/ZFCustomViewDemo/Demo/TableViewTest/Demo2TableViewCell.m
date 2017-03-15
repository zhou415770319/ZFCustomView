//
//  Demo2TableViewCell.m
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/3/15.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "Demo2TableViewCell.h"
#import "TestCellModel.h"

@implementation Demo2TableViewCell


-(void)setCellInfo:(ZFTableViewCellModel *)cellInfo{
    
    TestCellModel *Tmodel = (TestCellModel *)cellInfo;
    self.title.text = Tmodel.title;
    self.des.text = Tmodel.des;
    self.image.image = [UIImage imageNamed:Tmodel.imgName];
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
