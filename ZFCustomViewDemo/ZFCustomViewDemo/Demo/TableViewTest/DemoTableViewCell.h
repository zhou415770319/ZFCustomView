//
//  DemoTableViewCell.h
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/3/15.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFTableViewCell.h"

@interface DemoTableViewCell : ZFTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *des;

@end
