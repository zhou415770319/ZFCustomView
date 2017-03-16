//
//  TestViewController.m
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/3/10.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "TestViewController.h"
#import "TestCellModel.h"
#import "ZFTableView.h"
@interface TestViewController ()

@property(nonatomic,retain)ZFTableView *tableV;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViews];

    
    [self initData];


    
    // Do any additional setup after loading the view.
}

-(void)initData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cellInfos1" ofType:@"plist"];
    //读取plist文件的内容
    NSMutableArray *arr = [NSMutableArray arrayWithContentsOfFile:path];
    //    NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePatch];
    NSMutableArray *mArr = [NSMutableArray arrayWithCapacity:1];
    for (NSArray *temArr in arr) {
        NSMutableArray *temMArr = [NSMutableArray arrayWithCapacity:1];
        for (NSDictionary *dict in temArr) {
            TestCellModel *model = [[TestCellModel alloc]initWithDict:dict];
            model.cellName = @"TestLableCell";
            [temMArr addObject:model];
        }
        [mArr addObject:temMArr];
    }
    self.tableV.cellInfos = mArr;
    //    ZFTableView *tableV = (ZFTableView *)self.tableView;
    //    tableV.cellInfos = mArr;
//    self.cellInfos = mArr;
//    [self.tableView reloadData];
    NSLog(@"%@",mArr);
    //    self.tableView.
    
}


-(void)initViews{
    
    self.tableV = [[ZFTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    self.tableV.backgroundColor =[UIColor redColor];
    [self.view addSubview:self.tableV];
    
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
