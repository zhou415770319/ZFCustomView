//
//  demoViewController.m
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/1/3.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "demoViewController.h"
#import "ZFCustomView.h"
@interface demoViewController ()

@end

@implementation demoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ZFButtonToll createButtonWithSuperView:self.view Frame:CGRectMake(100, 140, 100, 30) Title:@"zhou" Tag:1005 ButtonType:ZFButtonType_custom ActionHandler:^(UIButton *btn) {
        NSLog(@"%ld",(long)btn.tag);
        switch (btn.tag) {
            case 1005:
                NSLog(@"第一个");
                break;
            case 1006:
                NSLog(@"第2个");
                break;
            case 1007:
                NSLog(@"第3个");
                break;
            case 1008:
                NSLog(@"第4个");
                break;
            
            default:
                break;
        }
        
    }];
    [ZFButtonToll createButtonWithSuperView:self.view Frame:CGRectMake(100, 180, 100, 30) Title:@"zhou" Tag:1006 ButtonType:ZFButtonType_custom ActionHandler:^(UIButton *btn) {
        NSLog(@"%ld",(long)btn.tag);
    }];
    [ZFButtonToll createButtonWithSuperView:self.view Frame:CGRectMake(100, 220, 100, 30) Title:@"zhou" Tag:1007 ButtonType:ZFButtonType_custom ActionHandler:^(UIButton *btn) {
        NSLog(@"%ld",(long)btn.tag);
    }];
    [ZFButtonToll createButtonWithSuperView:self.view Frame:CGRectMake(100, 260, 100, 30) Title:@"zhou" Tag:1008 ButtonType:ZFButtonType_custom ActionHandler:^(UIButton *btn) {
        NSLog(@"%ld",(long)btn.tag);
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
