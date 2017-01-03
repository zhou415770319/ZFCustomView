//
//  ZFButtonToll.h
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/1/3.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ZFButtonType_custom,//自定义button
    ZFButtonType_countDown,//倒计时button
    ZFButtonType_radiu,//单选button
} ZFButtonType;

/**
 按钮点击回调

 */
typedef void (^ButtonClickBlock)(UIButton * btn);

@interface ZFButtonToll : NSObject




/**
 创建按钮   监听点击事件需要    addTarget

 @param buttonType 按钮样式
 @return 创建的按钮
 */
+(UIButton *)createButtonWithSuperView:(UIView *)superView Frame:(CGRect)frame Title:(NSString *)title Tag:(NSInteger)tag ButtonType:(ZFButtonType)buttonType;

/**
 创建按钮 通过block监听点击事件     针对单个按钮

 @param buttonType 按钮样式
 @param actionHandler 按钮回调函数
 */
+(UIButton *)createButtonWithSuperView:(UIView *)superView Frame:(CGRect)frame Title:(NSString *)title Tag:(NSInteger)tag ButtonType:(ZFButtonType)buttonType ActionHandler:(ButtonClickBlock)actionHandler;

@end
