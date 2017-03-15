//
//  ZFTableView.m
//  ZFCustomViewDemo
//
//  Created by 周飞 on 2017/3/9.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "ZFTableView.h"

@interface ZFTableView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ZFTableView

-(void)setCellInfos:(NSMutableArray *)cellInfos{
    if (_cellInfos !=cellInfos) {
        _cellInfos =cellInfos;
        
        for (id obj in cellInfos) {
            if ([obj isKindOfClass:[NSArray class]]) {
                self.isMoreSection = YES;
                
            }
            
        }
        
        [self registerClass:[NSClassFromString(@"TestLableCell") class] forCellReuseIdentifier:@"TestLableCell"];

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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    if (self.isMoreSection == YES) {
        return self.cellInfos.count;
    }
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.isMoreSection ==YES) {
        return [self.cellInfos[section] count];
    }
    
    return self.cellInfos.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    float height = 60 ;
//    if (self.isCustomCell == YES) {
//        ZFTableViewCellFrameModel *cellInfo;
//        if (self.isMoreSection ==YES) {
//            cellInfo = self.cellInfos[indexPath.section][indexPath.row];
//        }else{
//            cellInfo = self.cellInfos[indexPath.row];
//        }
//        return cellInfo.cellHeightF;
//    }
//    
//    if (self.heightForRow) {
//        height =self.heightForRow;
//    }
    
    return height;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZFTableViewCellModel *cellInfo;
    ZFTableViewCell *cell = nil;
    if (self.isMoreSection ==YES) {
        cellInfo = self.cellInfos[indexPath.section][indexPath.row];
        
    }else{
        cellInfo = self.cellInfos[indexPath.row];
        
    }

    if (cell ==nil) {
        if (cellInfo.cellName) {//如果cellNmae存在
            //取出已注册的cell
            cell = [tableView dequeueReusableCellWithIdentifier:cellInfo.cellName forIndexPath:indexPath];
        }
        UIView *v =[[UIView alloc]initWithFrame:CGRectMake(10, cell.frame.size.height+15, cell.frame.size.width-20, 1)];
        v.backgroundColor = [UIColor lightGrayColor];
        [cell.contentView addSubview:v];
    }
    cell.cellInfo = cellInfo;

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
