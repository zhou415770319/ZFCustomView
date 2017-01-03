//
//  ZFButtonToll.m
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/1/3.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "ZFButtonToll.h"

@implementation ZFButtonToll
+(void)createButtonWithTitle:(NSString *)title SuperView:(UIView *)superView{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    
    btn.frame = CGRectMake(10, 100, 200, 200);
    
    btn.backgroundColor = [UIColor cyanColor];
    [superView addSubview:btn];
}

@end
