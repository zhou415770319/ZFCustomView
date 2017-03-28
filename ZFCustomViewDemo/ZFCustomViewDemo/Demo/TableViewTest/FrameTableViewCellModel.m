//
//  FrameTableViewCellModel.m
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/3/16.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "FrameTableViewCellModel.h"
#import "ZFStringTool.h"

#define PADDING_VIEW_VIEW 5

#define ICONWIDTH 100

#define LABLE_WIDTH (SCREENWIDTH-20)/3

@implementation FrameTableViewCellModel


-(void)setCellInfo:(ZFTableViewCellModel *)cellInfo{
    [super setCellInfo:cellInfo];
    //计算 标题的frame
    [self setupTitleFrame];
    
    //计算 描述的frame
    [self setupdesFrame];
    
    //计算 图片的frame
//    [self setupImgFrame];
//    
    //计算 lineViewF的frame
    [self setupLineViewFrame];
    
    
    self.cellHeightF = CGRectGetMaxY(_lineViewF);

//    CGRectGetMaxY(_desF);
    
    
}


-(void)setupTitleFrame{
    _titleF = CGRectMake(10, 10, 100, 30);
    
//    _titleF =CGRectMake(PADDING_VIEW_VIEW, PADDING_VIEW_VIEW, ([UIScreen mainScreen].bounds.size.width)-2*PADDING_VIEW_VIEW, [ZFStringTool getStrSize:self.cellInfo.title andTexFont:[UIFont systemFontOfSize:18.0] andMaxSize:CGSizeMake(([UIScreen mainScreen].bounds.size.width)-2*PADDING_VIEW_VIEW, 90)].height);
}

-(void)setupdesFrame{
    
    _desF = CGRectMake(110, 50, 100, 30);
//    _desF =CGRectMake(PADDING_VIEW_VIEW, CGRectGetMaxY(_titleF)+PADDING_VIEW_VIEW, ([UIScreen mainScreen].bounds.size.width)-(PADDING_VIEW_VIEW*2), 60);
}

-(void)setupLineViewFrame{
    
        
        _lineViewF =CGRectMake(PADDING_VIEW_VIEW, CGRectGetMaxY(_desF)+PADDING_VIEW_VIEW, ([UIScreen mainScreen].bounds.size.width)-2*PADDING_VIEW_VIEW, 0.5);
        
}


@end
