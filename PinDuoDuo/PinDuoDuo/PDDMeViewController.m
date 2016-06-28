//
//  PDDMeViewController.m
//  PinDuoDuo
//
//  Created by mac on 16/6/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "PDDMeViewController.h"

@implementation PDDMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
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
