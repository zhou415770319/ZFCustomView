//
//  ZFTableViewController.m
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/3/9.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "ZFTableViewController.h"

@interface ZFTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ZFTableViewController

-(BOOL)isMoreSection{
    if (!_isMoreSection) {
        _isMoreSection = NO;
    }
    return _isMoreSection;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //去除分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



-(void)setCellInfos:(NSMutableArray *)cellInfos{
    
    if (_cellInfos != cellInfos) {
        _cellInfos = cellInfos;
        ZFTableViewCellModel *cellInfo;
        //cellName 注册
        NSMutableArray *arr =[NSMutableArray arrayWithCapacity:1];
        //xibcellName 注册
        NSMutableArray *xibArr =[NSMutableArray arrayWithCapacity:1];
        //自定义Frame的model数组
        NSMutableArray * frameModelArr = [NSMutableArray arrayWithCapacity:1];
        
        
        for (id obj in cellInfos) {
            if ([obj isKindOfClass:[NSArray class]]) {//多组的情况
                self.isMoreSection = YES;
                NSMutableArray * frameModelTemArr = [NSMutableArray arrayWithCapacity:1];
                
                for (id obj2 in obj) {
                    
                    cellInfo = obj2;
                    if (cellInfo.classCellName) {
                        [arr addObject:cellInfo.classCellName];
                        if (cellInfo.isCustomCell == YES) {
                            ZFTableViewCellFrameModel *frameM = [[ZFTableViewCellFrameModel alloc] init];
                            frameM.cellInfo = cellInfo;
                            [frameModelTemArr addObject:frameM];
                        }
                    }
                    if (cellInfo.xibCellName) {
                        [xibArr addObject:cellInfo.xibCellName];
                    }
                }
                [frameModelArr addObject:frameModelTemArr];
            }else{//不是多组的情况
                cellInfo = obj;
                if (cellInfo.classCellName) {
                    [arr addObject:cellInfo.classCellName];
                    if (cellInfo.isCustomCell == YES) {
                        ZFTableViewCellFrameModel *frameM = [[ZFTableViewCellFrameModel alloc] init];
                        frameM.cellInfo = cellInfo;
                        [frameModelArr addObject:frameM];
                    }
                }
                if (cellInfo.xibCellName) {
                    [xibArr addObject:cellInfo.xibCellName];
                }
            }
            
        }
        //如果是自定义的cell。。。
        if (cellInfo.isCustomCell == YES) {
            _cellInfos = frameModelArr;
        }
        [self registerCell:arr xib:xibArr];
        [self.tableView reloadData];
        
    }
}
//注册classCell和xibCell
-(void)registerCell:(NSMutableArray *)cellArr xib:(NSMutableArray *)xibArr{
    
    NSSet *set = [NSSet setWithArray:cellArr];
    for (NSString * s1 in set) {
        [self.tableView registerClass:[NSClassFromString(s1) class] forCellReuseIdentifier:s1];
    }
    
    NSSet *xibSet = [NSSet setWithArray:xibArr];
    for (NSString * s1 in xibSet) {
        [self.tableView registerNib:[UINib nibWithNibName:s1 bundle:nil] forCellReuseIdentifier:s1];
    }
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (_isMoreSection == YES) {
        return self.cellInfos.count;
    }
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (_isMoreSection == YES) {
        NSArray *arr = self.cellInfos[section];
        return arr.count;
    }
    else{
        return self.cellInfos.count;
        
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZFTableViewCellModel *cellInfo = [self getCellInfo:indexPath];

    if (cellInfo.isCustomCell == YES) {
        return 150;
    }
    
    ZFTableViewCell *cell = [self getCellIndex:indexPath];
    
    if (cell != nil) {
        return cell.frame.size.height;
    }
    
    return 70;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZFTableViewCellModel *cellInfo = [self getCellInfo:indexPath];
    
    ZFTableViewCell *cell;
    //    = [self getCellIndex:indexPath cellInfo:cellInfo];
    
    if (cell == nil) {
        
        if (cellInfo.classCellName) {//如果cellClassName存在
            //取出已注册的cell
            cell = [tableView dequeueReusableCellWithIdentifier:cellInfo.classCellName forIndexPath:indexPath];
        }else if (cellInfo.xibCellName){//如果XibcellNmae存在
            //取出已注册的cell
            
            cell = [tableView dequeueReusableCellWithIdentifier:cellInfo.xibCellName forIndexPath:indexPath];
            
        }else if(cellInfo.cellName){
            
            cell =[tableView dequeueReusableCellWithIdentifier:cellInfo.cellName forIndexPath:indexPath];
            
        }else{
            cell = [[ZFTableViewCell alloc] initWithStyle:!cellInfo.tableViewCellStyle? UITableViewCellStyleDefault:cellInfo.tableViewCellStyle reuseIdentifier:@"cell"];
            if (cellInfo.title) {
                cell.textLabel.text =cellInfo.title;
                
            }
            if (cellInfo.des) {
                cell.detailTextLabel.text = cellInfo.des;
            }
            if (cellInfo.imgName) {
                cell.imageView.image =[UIImage imageNamed:cellInfo.imgName];
            }
        }
        //        cell = [[NSClassFromString(cellInfo.cellName) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellInfo.cellName];
        
        //        cell.textLabel.text = @"kjskjdnks";
    }
    UIView *v =[[UIView alloc]initWithFrame:CGRectMake(10, cell.frame.size.height-1, self.view.frame.size.width-20, 1)];
    v.backgroundColor = [UIColor lightGrayColor];
    [cell.contentView addSubview:v];
    
    cell.cellInfo = cellInfo;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    ZFTableViewCellModel *cellInfo = [self getCellInfo:indexPath];
    
    if (cellInfo.PopToViewController) {
        if (NSClassFromString(cellInfo.PopToViewController)) {
            ZFPopBaseViewController *pop =[[NSClassFromString(cellInfo.PopToViewController) alloc] init];
            pop.title = cellInfo.PopToViewController;
            pop.cellInfo = cellInfo;
            [self.navigationController pushViewController:pop animated:YES];
        }
    }
    
    
}

//获取cellInfo
-(ZFTableViewCellModel *)getCellInfo:(NSIndexPath *)indexPath{
    ZFTableViewCellModel *cellInfo;
    if (_isMoreSection == YES) {
        cellInfo = self.cellInfos[indexPath.section][indexPath.row];
    }else{
        cellInfo = self.cellInfos[indexPath.row];
    }
    return cellInfo;
}

-(ZFTableViewCell *)getCellIndex:(NSIndexPath *)indexPath{
    ZFTableViewCellModel *cellInfo = [self getCellInfo:indexPath];
    ZFTableViewCell *cell;
    if (cellInfo.classCellName) {//如果cellClassName存在
        //取出已注册的cell
        cell = [self.tableView dequeueReusableCellWithIdentifier:cellInfo.classCellName];
    }else if (cellInfo.xibCellName){//如果XibcellNmae存在
        //取出已注册的cell
        
        cell = [self.tableView dequeueReusableCellWithIdentifier:cellInfo.xibCellName];
        
    }else if(cellInfo.cellName){
        
        cell =[self.tableView dequeueReusableCellWithIdentifier:cellInfo.cellName];
        
    }else{
        
        cell = nil;
    }
    
    return cell;
}


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
