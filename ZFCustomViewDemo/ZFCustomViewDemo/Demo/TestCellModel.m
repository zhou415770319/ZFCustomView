//
//  TestCellModel.m
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/3/10.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "TestCellModel.h"

@implementation TestCellModel


-(id)initWithDict:(NSDictionary *)dict{
    
    self.title = [dict objectForKey:@"title"];
    self.des = [dict objectForKey:@"des"];
    self.imgName = [dict objectForKey:@"img"];
    
    return self;
}

@end
