//
//  ZFTableViewController.h
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/3/9.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFTableViewCell.h"
#import "ZFPopBaseViewController.h"

@interface ZFTableViewController : UITableViewController

/**
 *  cell 信息
 */
@property(nonatomic,retain)NSMutableArray *cellInfos;

/**
 *  是否多组
 */
@property(nonatomic,assign)BOOL isMoreSection;


@end
