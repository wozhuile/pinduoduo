//
//  ViewController.m
//  PinDuoDuoTest
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "MainView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.view.frame
#pragma mark 不知道为什么在初始化里边赋值和调用就出来效果了。应该是加载先后导致的吧，
    MainView*mainVIew=[[MainView alloc]initWithFrame:self.view.frame];
    //[mainVIew CreateButtomScrollViewWithWidth:self.view.frame.size.width withHeight:self.view.frame.size.height];
   
    
    #pragma mark 暂时拿一张来试试
    
    NSString*str=@"http://omsproductionimg.yangkeduo.com/images/goods/425/SY6fRexYypFRtRiQdKzxo3RMrXZVR1bI.jpg";
    NSURL*url=[NSURL URLWithString:str];
    [mainVIew CreateTopScrollViewWithUrl:url];
    
    [self.view addSubview:mainVIew];
    
}

#pragma mark 底层最大的滚动视图，contentsize要根据内容数据来设置，这里就先设置一个值先试试，不知道为什么不用表来重用，应该是用集合试图来展示了。还有这个界面和海淘界面差不多，应该考虑外边封装！



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // self.navigationItem.title=@"#wewqe#";
 

    
   // MainView*mainVIew=[[MainView alloc]init];
   // [mainVIew CreateButtomScrollView];
    
    
#pragma mark 背景颜色和条颜色区别！
    
    //self.navigationController.navigationBar.backgroundColor=[UIColor grayColor];
    self.navigationItem.title=@"拼多多商城";
    //self.navigationController.navigationBar.barTintColor=[UIColor grayColor];
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:225/256.0 green:225/256.0 blue:225/256.0 alpha:1.0];
    //self.navigationController.alpha=0.1;
    
}


@end
