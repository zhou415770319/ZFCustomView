//
//  TestCell.m
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/3/10.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "TestCell.h"
#import "TestCellModel.h"
@implementation TestCell


//-(void)setCellInfo:(ZFTableViewCellModel *)cellInfo{
//    if (self.cellInfo != cellInfo) {
//        TestCellModel *Tmodel = (TestCellModel *)cellInfo;
//        self.title.text = Tmodel.title;
//        self.cellInfo = Tmodel;
//    }
//}

//-(id)initWithModel:(ZFTableViewCellModel *)model{
//    TestCellModel *Tmodel = (TestCellModel *)model;
//    self.title.text = Tmodel.title;
//    return self;
//}


//-(void)setCellInfo:(ZFTableViewCellModel *)cellInfo{
//    
//    TestCellModel *Tmodel = (TestCellModel *)cellInfo;
//    self.title.text = Tmodel.title;
//    
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
