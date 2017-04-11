//
//  ZFCustomViewHeader.h
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/4/11.
//  Copyright © 2017年 ZF. All rights reserved.
//

#ifndef ZFCustomViewHeader_h
#define ZFCustomViewHeader_h


#endif /* ZFCustomViewHeader_h */

#define COLOR_e7e7e7 UIColorFromRGB(0xe7e7e7)
#define COLOR_dadada UIColorFromRGB(0xdadada)

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
