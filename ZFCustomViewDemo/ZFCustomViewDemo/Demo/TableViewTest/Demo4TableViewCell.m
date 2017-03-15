//
//  Demo4TableViewCell.m
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/3/15.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "Demo4TableViewCell.h"
#import "DemoCellModel.h"

@implementation Demo4TableViewCell

-(void)setCellInfo:(ZFTableViewCellModel *)cellInfo{
    
    DemoCellModel *Tmodel = (DemoCellModel *)cellInfo;
    self.title.text = Tmodel.title;
    self.des.text = Tmodel.des;
    self.subTitle.text = Tmodel.subTitle;
    self.subDes.text = Tmodel.subDes;

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
