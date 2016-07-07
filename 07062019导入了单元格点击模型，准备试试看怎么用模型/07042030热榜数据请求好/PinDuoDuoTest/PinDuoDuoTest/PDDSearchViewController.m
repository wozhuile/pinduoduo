//
//  PDDSearchViewController.m
//  PinDuoDuoTest
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "PDDSearchViewController.h"
#import "UIColor+Hex.h"
@interface PDDSearchViewController ()

@end

@implementation PDDSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // self.navigationItem.title=@"#wewqe#";
    
#pragma mark 背景颜色和条颜色区别！
    // self.navigationController.navigationBar.backgroundColor=[UIColor grayColor];
    self.navigationItem.title=@"搜索";
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithHexString:@"#ffffff"];
}


@end
