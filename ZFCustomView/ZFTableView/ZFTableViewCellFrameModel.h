//
//  ZFTableViewCellFrameModel.h
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/3/16.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZFTableViewCellModel.h"
@interface ZFTableViewCellFrameModel : NSObject

/** cellModel 信息 */
@property(nonatomic,strong)ZFTableViewCellModel *cellInfo;

/** cell的高度 */
@property (nonatomic, assign) CGFloat cellHeightF;


@end
