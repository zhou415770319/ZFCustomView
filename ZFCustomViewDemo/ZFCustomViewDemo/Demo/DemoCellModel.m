//
//  DemoCellModel.m
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/3/15.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "DemoCellModel.h"

@implementation DemoCellModel

-(id)initWithDict:(NSDictionary *)dict{
    
    self.title = [dict objectForKey:@"title"];
    self.des = [dict objectForKey:@"des"];
    self.subTitle = [dict objectForKey:@"subTitle"];
    self.subDes = [dict objectForKey:@"subDes"];
    
    return self;
}


@end
