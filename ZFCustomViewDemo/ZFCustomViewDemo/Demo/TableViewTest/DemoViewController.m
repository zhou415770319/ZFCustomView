//
//  DemoViewController.m
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/3/21.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "DemoViewController.h"
#import "DemoCellModel.h"
@interface DemoViewController ()
//显示数据
@property(nonatomic,retain)NSMutableArray *infos;

@property(nonatomic,retain)ZFTableView *tab;

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    [self initCellInfos];
    
    // Do any additional setup after loading the view.
}
-(void)initTableView{
    
    self.tab = [[ZFTableView alloc]initWithFrame:self.view.bounds];
//    self.tab.delegate = self;
//    self.tab.heightForRow = 200;
//    self.tab.cellInfos = self.infos;
    
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tab];

    
}

-(void)initCellInfos{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cellInfos2" ofType:@"plist"];
    //读取plist文件的内容
    NSMutableArray *arr = [NSMutableArray arrayWithContentsOfFile:path];
    //    NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePatch];
    NSMutableArray *mArr = [NSMutableArray arrayWithCapacity:1];
    for (NSArray *temArr in arr) {
        NSMutableArray *temMArr = [NSMutableArray arrayWithCapacity:1];
        for (NSDictionary *dict in temArr) {
            DemoCellModel *model = [[DemoCellModel alloc]initWithDict:dict];
            if ([dict objectForKey:@"cellName"]) {
                model.cellName = [dict objectForKey:@"cellName"];
                
                
            }else if([dict objectForKey:@"xibCellName"]) {
                model.xibCellName = [dict objectForKey:@"xibCellName"];
                
            }else if([dict objectForKey:@"classCellName"]) {
                model.classCellName = [dict objectForKey:@"classCellName"];
                if ([dict objectForKey:@"isCustomCell"]) {
                    model.isCustomCell = [dict objectForKey:@"isCustomCell"];
                    model.framModelName = @"FrameTableViewCellModel";
                }
            }else{
//                model.cellName = @"DemoTableViewCell";
                
            }
            if ([dict objectForKey:@"isPop"]) {
                model.isPop = [dict objectForKey:@"isPop"];
            }
            
            model.PopToViewController = @"PopDemoViewController";
            
            [temMArr addObject:model];
        }
        [mArr addObject:temMArr];
    }
    
    self.tab.cellInfos = mArr;
    //    [self.tableView reloadData];
    NSLog(@"%@",mArr);
    
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
