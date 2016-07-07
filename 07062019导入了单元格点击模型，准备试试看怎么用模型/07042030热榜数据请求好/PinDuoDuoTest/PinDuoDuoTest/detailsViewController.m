//
//  detailsViewController.m
//  PinDuoDuoTest
//
//  Created by mac on 16/7/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "detailsViewController.h"

@interface detailsViewController ()

@end

@implementation detailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"拼多多商城";
    self.view.backgroundColor=[UIColor greenColor];
    
#pragma mark 设置左边的按钮，就看不到那个拼多多商场文字，，但是返回的时候有点小bug，就是还会看到一些些拼多多文字。。
    UIBarButtonItem*item=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(backButon)];
    self.navigationItem.leftBarButtonItem=item;
#warning 注意跳转过来后的效果，，下边的标签栏应该隐藏的，然后再下边创建一个view来做下边的东西。。self.tabBarController.hidesBottomBarWhenPushed
    
    
  //  self.tabBarController.hidesBottomBarWhenPushed
    
    
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //self.tabBarController.hidesBottomBarWhenPushed=YES;
    //self.tabBarController.tabBar.hidden=YES;
    
    }

#pragma mark跳转过来，可以直接用表，，分几个区就好。就分大区？？，，宝贝介绍，包邮哪里（颜色不同，最后就是单独一个，，如果是按钮呢？）然后支付开团，以下伙伴头一个，，在分行，，进店一个，，后边图片展示一个，。。。推荐一个，。一共至少4个，，就先4个处理吧，，第一个大区哪些也不能点击吧》。。就图片，，点击可以放大，，然后放大后，，点击了。就会回到对应那一个，，这个滑动的时候看起来是bug，，还有图片放大着，，也可以滚动，。。点击下了，，滑动到哪里就到哪里，。。醉了。。。




-(void)backButon
{
    [self.navigationController popViewControllerAnimated:YES];
    //NSLog(@"---");
}

@end
