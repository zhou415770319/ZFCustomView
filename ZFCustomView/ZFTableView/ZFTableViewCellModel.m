//
//  ZFTableViewCellModel.m
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/3/10.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "ZFTableViewCellModel.h"

@implementation ZFTableViewCellModel

-(id)initWithDict:(NSDictionary *)dict{
    if ([dict objectForKey:@"title"]) {
        self.title = [dict objectForKey:@"title"];

    }
    if ([dict objectForKey:@"img"]) {
        self.imgName = [dict objectForKey:@"img"];
        
    }
    if ([dict objectForKey:@"des"]) {
        self.des = [dict objectForKey:@"des"];
        
    }
    
    return self;
    
}

@end
