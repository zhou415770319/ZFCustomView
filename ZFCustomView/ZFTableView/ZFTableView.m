//
//  ZFTableView.m
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/3/9.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "ZFTableView.h"
#import "ZFPopBaseViewController.h"

@interface ZFTableView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ZFTableView

-(void)setCellInfos:(NSMutableArray *)cellInfos{
    
    if (_cellInfos != cellInfos) {
        ZFTableViewCellModel *cellInfo;
        //cellName 注册
        NSMutableArray *arr =[NSMutableArray arrayWithCapacity:1];
        //xibcellName 注册
        NSMutableArray *xibArr =[NSMutableArray arrayWithCapacity:1];
        //自定义Frame的model数组
        NSMutableArray * frameModelArr = cellInfos;
        
        for (int i =0;i<cellInfos.count;i++) {
            id obj = cellInfos[i];
            if ([obj isKindOfClass:[NSArray class]]) {//多组的情况
                self.isMoreSection = YES;
                NSMutableArray * frameModelTemArr = [NSMutableArray arrayWithArray:(NSArray *)obj];
                for (int j =0;j<frameModelTemArr.count;j++) {
                    
                    if ([frameModelTemArr[j] isKindOfClass:[ZFTableViewCellFrameModel class]]) {
                        ZFTableViewCellFrameModel *fm =frameModelTemArr[j];
                        
                        cellInfo =fm.cellInfo;
                    }else{
                        cellInfo = frameModelTemArr[j];
                    }
                    if (cellInfo.classCellName) {
                        [arr addObject:cellInfo.classCellName];
                        if (cellInfo.isCustomCell == YES) {
                            if ([cellInfo.framModelName isEqualToString:@""]) {
                                NSLog(@"没有设置自定义cell的framModelName");
                            }else{
                                ZFTableViewCellFrameModel *frameM = [[NSClassFromString(cellInfo.framModelName) alloc] init];
                                
                                frameM.cellInfo = cellInfo;
                                [frameModelTemArr replaceObjectAtIndex:j withObject:frameM];
                            }
                            
                        }
                    }
                    if (cellInfo.xibCellName) {
                        [xibArr addObject:cellInfo.xibCellName];
                    }
                }
                [frameModelArr replaceObjectAtIndex:i withObject:frameModelTemArr];
            }else{//不是多组的情况
                if ([obj isKindOfClass:[ZFTableViewCellFrameModel class]]) {
                    ZFTableViewCellFrameModel *fm =obj;
                    
                    cellInfo =fm.cellInfo;
                }else{
                    cellInfo = obj;
                }
                
                if (cellInfo.classCellName) {
                    [arr addObject:cellInfo.classCellName];
                    if (cellInfo.isCustomCell == YES) {
                        if ([cellInfo.framModelName isEqualToString:@""]) {
                            NSLog(@"没有设置自定义cell的framModelName");
                        }else{
                            ZFTableViewCellFrameModel *frameM = [[NSClassFromString(cellInfo.framModelName) alloc] init];
                            
                            frameM.cellInfo = cellInfo;
                            [frameModelArr replaceObjectAtIndex:i withObject:frameM];
                        }
                    }
                }
                if (cellInfo.xibCellName) {
                    [xibArr addObject:cellInfo.xibCellName];
                }
            }
            
        }
        //        //如果是自定义的cell。。。
        //        if (cellInfo.isCustomCell == YES) {
        //            _cellInfos = frameModelArr;
        //        }
        
        _cellInfos = frameModelArr;
        
        [self registerCell:arr xib:xibArr];
        [self reloadData];
        
    }
}

-(BOOL)isMoreSection{
    if (!_isMoreSection) {
        _isMoreSection = NO;
    }
    return _isMoreSection;
}


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //去除分割线
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        self.delegate =self;
        self.dataSource =self;
        
    }
    return self;
}

//注册classCell和xibCell
-(void)registerCell:(NSMutableArray *)cellArr xib:(NSMutableArray *)xibArr{
    
    NSSet *set = [NSSet setWithArray:cellArr];
    for (NSString * s1 in set) {
        [self registerClass:[NSClassFromString(s1) class] forCellReuseIdentifier:s1];
    }
    
    NSSet *xibSet = [NSSet setWithArray:xibArr];
    for (NSString * s1 in xibSet) {
        [self registerNib:[UINib nibWithNibName:s1 bundle:nil] forCellReuseIdentifier:s1];
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
    
    //    ZFTableViewCellModel *cellInfo = [self getCellInfo:indexPath];
    //
    //    if (cellInfo.isCustomCell == YES) {
    //        return cellInfo.ce;
    //    }
    
    if ([[self getCellInfo:indexPath] isKindOfClass:[ZFTableViewCellFrameModel class]]) {
        ZFTableViewCellFrameModel *cellInfo = (ZFTableViewCellFrameModel *)[self getCellInfo:indexPath];
        return cellInfo.cellHeightF;
    }else{
        ZFTableViewCell *cell = [self getCellIndex:indexPath];
        
        if (cell != nil) {
            return cell.frame.size.height;
        }
        
    }
    
    
    return 70;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZFTableViewCell *cell;
    
    if ([[self getCellInfo:indexPath] isKindOfClass:[ZFTableViewCellFrameModel class]]) {
        ZFTableViewCellFrameModel *cellInfo = (ZFTableViewCellFrameModel *)[self getCellInfo:indexPath];
        cell =[[NSClassFromString(cellInfo.cellInfo.classCellName) alloc]initWithFrameModel:cellInfo];
        cell.frameCellInfo = cellInfo;
        if (cellInfo.cellInfo.isPop) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        }
        
        return cell;
    }else{
        
        
        
        ZFTableViewCellModel *cellInfo = [self getCellInfo:indexPath];
        
        
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
        cell.cellInfo = cellInfo;
        if (cellInfo.isPop) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        }    }
    UIView *v =[[UIView alloc]initWithFrame:CGRectMake(0, cell.frame.size.height-0.5, self.frame.size.width-0, 0.5)];
    v.backgroundColor = [UIColor lightGrayColor];
    [cell.contentView addSubview:v];
    
    
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
            [[self viewController].navigationController pushViewController:pop animated:YES];
        }
    }
    
}

//获取view所在的Controller
- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}


//获取cellInfo
-(id)getCellInfo:(NSIndexPath *)indexPath{
    id cellInfo;
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
        cell = [self dequeueReusableCellWithIdentifier:cellInfo.classCellName];
    }else if (cellInfo.xibCellName){//如果XibcellNmae存在
        //取出已注册的cell
        
        cell = [self dequeueReusableCellWithIdentifier:cellInfo.xibCellName];
        
    }else if(cellInfo.cellName){
        
        cell =[self dequeueReusableCellWithIdentifier:cellInfo.cellName];
        
    }else{
        
        cell = nil;
    }
    
    return cell;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
