//
//  ZFTableViewCellModel.h
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/3/10.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZFTableViewCellModel : NSObject

//已经注册的cell (传入cellName是为了获取复用的cell)
@property(nonatomic,copy)NSString *cellName;
//需要注册class的cell
@property(nonatomic,copy)NSString *classCellName;
//需要注册xib的cell
@property(nonatomic,copy)NSString *xibCellName;

/**
 *  是否自定义cell，代码自定义frame
 */
@property(nonatomic,assign)BOOL isCustomCell;


//没有设置cell类型的情况下可以设置tableViewCellStyle 默认为UITableViewCellStyleDefault
@property(nonatomic)UITableViewCellStyle tableViewCellStyle;


//didSelectRow 需要跳转的controller
@property(nonatomic,copy)NSString *PopToViewController;

//标题
@property(nonatomic,copy)NSString *title;
//图片名字
@property(nonatomic,copy)NSString *imgName;
//子标题
@property(nonatomic,copy)NSString *des;



-(id)initWithDict:(NSDictionary *)dict;


@end
