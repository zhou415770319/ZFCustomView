//
//  FrameTableViewCell.m
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/3/16.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "FrameTableViewCell.h"

@implementation FrameTableViewCell

-(id)initWithFrameModel:(FrameTableViewCellModel *)frameModel{
    // 1.定义一个标识
//    NSString *ID = frameModel.cellInfo.classCellName;
//    
//    // 2.去缓存池中取出可循环利用的cell
//    FrameTableViewCell *cell ;
//    
//    cell = [self.tableView dequeueReusableCellWithIdentifier:cellInfo.classCellName];
//
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    
//    // 3.如果缓存中没有可循环利用的cell
//    if (cell == nil) {
//        cell = [[FrameTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//    }
    
    _frameModel = frameModel;
    
    self = [super init];
    if (self) {
        // 添加所有需要显示的子控件
        [self setupViews];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;

    
    
}

- (void) setupViews {
    
    
    self.title = [[UILabel alloc] init];
    self.title.text = self.frameModel.cellInfo.title;
    [self addSubview:self.title];
    self.title.numberOfLines = 0;
    self.des = [[UILabel alloc] init];
    self.des.text = self.frameModel.cellInfo.des;
    [self addSubview:self.des];
    self.des.numberOfLines = 0;

//    self.icon = [[UIImageView alloc] init];
//    [self.icon sd_setImageWithURL:[NSURL URLWithString:self.frameModel.cellInfo.imgUrl] placeholderImage:[UIImage imageNamed:@"0"]];
//    [self addSubview:self.icon];
//    
//    self.des = [CustomViewTool labelWithTitle:self.frameModel.cellInfo.newsInfo];
//    
//    self.des.font =TEXTSIZEMIDDLE;
//    
//    
    self.lineView =[[UIView alloc]init];
    self.lineView.backgroundColor =[UIColor lightGrayColor];
    [self addSubview:self.lineView];
    
    self.title.frame = self.frameModel.titleF;
//    self.icon.frame =self.frameModel.iconF;
    self.des.frame =self.frameModel.desF;
    
    self.lineView.frame =self.frameModel.lineViewF;
    
}



//-(void)setFrameCellInfo:(ZFTableViewCellFrameModel *)frameCellInfo{
//    
//    self.backgroundColor = [UIColor cyanColor];
//    
//    
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
