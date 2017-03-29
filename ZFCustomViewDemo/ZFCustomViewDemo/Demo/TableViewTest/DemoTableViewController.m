//
//  DemoTableViewController.m
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/3/15.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "DemoTableViewController.h"
#import "TestCellModel.h"
#import "DemoTableViewCell.h"
#import "DemoCellModel.h"
@interface DemoTableViewController ()

@end

@implementation DemoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTableView];
    [self initCellInfos];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)initTableView{
    
    
//    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, SCREENWIDTH, 140)];
//    lab.backgroundColor = [UIColor redColor];
//    [self.view addSubview:lab];
    
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
//    self.isMoreSection =YES;
    
}

-(void)initCellInfos{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cellInfos1" ofType:@"plist"];
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
                model.cellName = @"DemoTableViewCell";

            }
            if ([dict objectForKey:@"isPop"]) {
                model.isPop = [dict objectForKey:@"isPop"];
            }
            
            model.PopToViewController = @"PopDemoViewController";
            
            [temMArr addObject:model];
        }
        [mArr addObject:temMArr];
    }
    
    self.cellInfos = mArr;
//    [self.tableView reloadData];
    NSLog(@"%@",mArr);
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    
//    if (self.isMoreSection == YES) {
//        return self.cellInfos.count;
//    }
//    return 1;
//    
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    
//    if (self.isMoreSection == YES) {
//        NSArray *arr = self.cellInfos[section];
//        return arr.count;
//    }
//    else{
//        return self.cellInfos.count;
//        
//    }
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    return 70;
//}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    TestCellModel *cellInfo;
//    if (self.isMoreSection == YES) {
//        cellInfo = self.cellInfos[indexPath.section][indexPath.row];
//    }else{
//        cellInfo = self.cellInfos[indexPath.row];
//    }
//    
//    //    ZFTableViewCell *cell = [[NSClassFromString(@"TestCell") alloc] init];
//    DemoTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"DemoTableViewCell"];
//    if (cell == nil) {
//        cell = [[DemoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DemoTableViewCell"];
//        
//        //        cell.textLabel.text = @"kjskjdnks";
//    }
//    //    cell.cellInfo = cellInfo;
//    cell.title.text = cellInfo.title;
//    //    cell.textLabel.text = cellInfo.cellName;
//    //    cell.imageView.image = [UIImage imageNamed:[cellInfo objectForKey:@"img"]];
//    // Configure the cell...
//    
//    return cell;
//    
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
