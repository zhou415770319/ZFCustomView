//
//  ZFTableViewCell.h
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/3/10.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFTableViewCellModel.h"
#import "ZFTableViewCellFrameModel.h"

@interface ZFTableViewCell : UITableViewCell
//CellModel
@property(nonatomic,retain)ZFTableViewCellModel *cellInfo;
//CellFrameModel
@property(nonatomic,retain)ZFTableViewCellFrameModel *frameCellInfo;



//-(id)initWithModel:(ZFTableViewCellModel *)model;


@end
