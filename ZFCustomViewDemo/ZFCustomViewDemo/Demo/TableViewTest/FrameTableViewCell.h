//
//  FrameTableViewCell.h
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/3/16.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "ZFTableViewCell.h"
#import "FrameTableViewCellModel.h"
@interface FrameTableViewCell : ZFTableViewCell

@property(nonatomic,retain)UILabel *title;

@property(nonatomic,retain)UILabel *des;

@property(nonatomic,retain)UIView *lineView;


@property(nonatomic,retain)FrameTableViewCellModel *frameModel;


@end
