//
//  ZFStringTool.m
//  ZFSwiftCode
//
//  Created by w on 16/7/18.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "ZFStringTool.h"

@implementation ZFStringTool

+ (CGSize)getStrSize:(NSString *)textStr andTexFont:(UIFont *)font andMaxSize:(CGSize)maxSize

{
    
    NSDictionary *textAttDict = @{NSFontAttributeName : font};
    
    return [textStr boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttDict context:nil].size;
    
}


@end
