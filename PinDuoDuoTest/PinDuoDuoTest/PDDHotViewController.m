//
//  PDDHotViewController.m
//  PinDuoDuoTest
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "PDDHotViewController.h"

#import "rankVIew.h"

@interface PDDHotViewController ()

@end

@implementation PDDHotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化数组
    _dataArray=[[NSMutableArray alloc]init];
    
   // _rankTableView=[UITableView alloc]ini;
    
    
    rankVIew*rank=[[rankVIew alloc]initWithFrame:self.view.frame];
    
    [self.view addSubview:rank];
    
}







-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // self.navigationItem.title=@"#wewqe#";
    
#pragma mark 背景颜色和条颜色区别！
    // self.navigationController.navigationBar.backgroundColor=[UIColor grayColor];
    self.navigationItem.title=@"排行榜";
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:225/256.0 green:225/256.0 blue:225/256.0 alpha:1.0];
}

@end
