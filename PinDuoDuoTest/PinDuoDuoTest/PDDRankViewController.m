//
//  PDDRankViewController.m
//  PinDuoDuoTest
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "PDDRankViewController.h"


#import <UIImageView+WebCache.h>

@interface PDDRankViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation PDDRankViewController

//创建表

-(UITableView*)rankTableView
{
    if (_rankTableView==nil) {
        _rankTableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        [self.view addSubview:_rankTableView];
        _rankTableView.delegate=self;
        _rankTableView.dataSource=self;
        _rankTableView.backgroundColor=[UIColor greenColor];
        
        
    }
    
    return _rankTableView;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.title=@"海淘专区";
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:225/256.0 green:225/256.0 blue:225/256.0 alpha:1.0];
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    
}

#pragma mark tableView datasource  and  delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    
    return 0;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString*cellID=@"cell";
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    
    
    
    return cell;
}


@end
