//
//  ZFButtonToll.m
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/1/3.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "ZFButtonToll.h"
#import "UIButton+Block.h"
#import "UIButton+CountDown.h"
@implementation ZFButtonToll

+(UIButton *)createButtonWithSuperView:(UIView *)superView Frame:(CGRect)frame Title:(NSString *)title Tag:(NSInteger)tag ButtonType:(ZFButtonType)buttonType{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font =[UIFont systemFontOfSize:18];
    [btn setBackgroundColor:[UIColor whiteColor]];
    btn.tag = tag;
    
    btn.layer.borderWidth = 1;
    btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    btn.clipsToBounds =YES;
    btn.layer.cornerRadius = 5;
    
    __weak UIButton *weakSelf = btn;
    [btn addActionHandler:^(NSInteger tag) {
        
        switch (buttonType) {
            case ZFButtonType_countDown:
                [weakSelf startTime:10 title:title waitTittle:@"倒计时"];
                
                break;
                
            default:
                break;
        }
        
    }];
    
    switch (buttonType) {
        case ZFButtonType_custom:
            
            break;
            
        case ZFButtonType_radiu:
            
            break;
        case ZFButtonType_countDown:
            
            //            [btn startTime:10 title:@"zhou" waitTittle:@"fei"];
            break;
            
        default:
            break;
    }
    
    [superView addSubview:btn];
    
    
    return btn;

    
}


+(UIButton *)createButtonWithSuperView:(UIView *)superView Frame:(CGRect)frame Title:(NSString *)title Tag:(NSInteger)tag ButtonType:(ZFButtonType)buttonType ActionHandler:(ButtonClickBlock)actionHandler{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font =[UIFont systemFontOfSize:18];
    [btn setBackgroundColor:[UIColor whiteColor]];
    btn.tag = tag;
    
    btn.layer.borderWidth = 1;
    btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    btn.clipsToBounds =YES;
    btn.layer.cornerRadius = 5;
    __weak UIButton *weakSelf = btn;

    [btn addActionHandler:^(NSInteger tag) {
        
        switch (buttonType) {
            case ZFButtonType_countDown:
                [weakSelf startTime:10 title:title waitTittle:@"倒计时"];
                
                break;
                
            default:
                break;
        }
        actionHandler(weakSelf);
        
    }];
    
    switch (buttonType) {
        case ZFButtonType_custom:
            
            break;
            
        case ZFButtonType_radiu:
            
            break;
        case ZFButtonType_countDown:
            
            //            [btn startTime:10 title:@"zhou" waitTittle:@"fei"];
            break;
            
        default:
            break;
    }
    
    [superView addSubview:btn];
    
    
    return btn;

}


@end
