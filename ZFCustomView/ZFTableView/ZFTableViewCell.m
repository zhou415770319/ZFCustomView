//
//  ZFTableViewCell.m
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/3/10.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "ZFTableViewCell.h"

@implementation ZFTableViewCell


-(id)initWithFrameModel:(ZFTableViewCellFrameModel *)frameModel{

    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)setCellInfo:(ZFTableViewCellModel *)cellInfo{
    
    if (_cellInfo != cellInfo) {
        _cellInfo = cellInfo;
    }
    
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
