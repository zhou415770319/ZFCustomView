//
//  FrameTableViewCellModel.h
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/3/16.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "ZFTableViewCellFrameModel.h"

@interface FrameTableViewCellModel : ZFTableViewCellFrameModel


/** 标题的frame  */
@property (nonatomic, assign) CGRect titleF;

/** 描述的frame  */
@property (nonatomic, assign) CGRect desF;

/*图片frame*/
@property (nonatomic, assign) CGRect imgF;

@end
