//
//  PDDMeViewController.m
//  PinDuoDuoTest
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "PDDMeViewController.h"



@interface PDDMeViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation PDDMeViewController

#pragma mark 懒加载
-(UITableView*)personCentertableView
{
    if (_personCentertableView==nil) {
        _personCentertableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
        [self.view addSubview:_personCentertableView];
        _personCentertableView.delegate=self;
        _personCentertableView.dataSource=self;
        _personCentertableView.backgroundColor=[UIColor greenColor];
        
    }
    
    return _personCentertableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self personCentertableView];
    
    
    
    
}

#pragma mark tableView   delegate  and datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString*cellID=@"cell";
    UITableViewCell*cell=[tableView  dequeueReusableCellWithIdentifier:cellID];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]init];
    }
    
    cell.textLabel.text=[NSString stringWithFormat:@"%ld",(long)indexPath.section];
    return cell;
    
    
}
#pragma mark 给区头修改颜色
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    view.tintColor=[UIColor grayColor];
}

//
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 10;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 160;
    }
    if (indexPath.section==1) {
        return 140;
    }
    if (indexPath.section==2) {
        return 170;
    }
    
    
    return 80;
    
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // self.navigationItem.title=@"#wewqe#";
    
#pragma mark 背景颜色和条颜色区别！
    // self.navigationController.navigationBar.backgroundColor=[UIColor grayColor];
    self.navigationItem.title=@"个人中心";
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:225/256.0 green:225/256.0 blue:225/256.0 alpha:1.0];
}

@end
