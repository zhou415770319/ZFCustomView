//
//  UIButton+countDown.h
//  NetworkEgOc
//
//  Created by iosdev on 15/3/17.
//  Copyright (c) 2015年 iosdev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CountDown)

/**
 *  显示倒计时
 *
 *  @param timeout    <#timeout description#>
 *  @param tittle     <#tittle description#>
 *  @param waitTittle <#waitTittle description#>
 */
-(void)startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle;
@end
