//
//  detailsViewController.m
//  PinDuoDuoTest
//
//  Created by mac on 16/7/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "detailsViewController.h"

@interface detailsViewController ()<UITableViewDataSource,UITableViewDelegate,ViewControllerDataDelegate>

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
    
    
    [self createtableView];
    
    
#pragma mark 遵循首页代理，，实现代理方法
    _viewDelegate.dataDelegate=self;
    
    
    
}

#pragma mark跳转过来，可以直接用表，，分几个区就好。就分大区？？，，宝贝介绍，包邮哪里（颜色不同，最后就是单独一个，，如果是按钮呢？）然后支付开团，以下伙伴头一个，评论一个，在分行，，进店一个，图片一个，后边图片展示一个，。。。推荐一个，。一共至少6个，，就先4个处理吧，，第一个大区哪些也不能点击吧》。。就图片，，点击可以放大，，然后放大后，，点击了。就会回到对应那一个，，这个滑动的时候看起来是bug，，还有图片放大着，，也可以滚动，。。点击下了，，滑动到哪里就到哪里，。。醉了。。。
#pragma mark 创建表
-(void)createtableView
{
    _detailTableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];//注意样式
    _detailTableView.delegate=self;
    _detailTableView.dataSource=self;
    _detailTableView.backgroundColor=[UIColor greenColor];
    [self.view addSubview:_detailTableView];
    
    
     _viewDelegate.dataDelegate=self;
    
    
    NSLog(@"%ld",(long)self.dataIndex);
    
}

#pragma mark 首页商品id实现方法，先点击看看传值成功没有，如果成功了，，在进行网络请求
-(void)sendGoods_listIndex:(ViewController *)viewcontroller indexPath:(NSInteger)indexPath
{
    NSLog(@"商品indexPath＝＝＝＝%ld",(long)indexPath);
}








#pragma mark 进行网络请求,先在那边传数据过来了。。


#pragma mark tableview   delegate  and  datasource
//区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;//先至少6个，按照上边分析的
}

//行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   //推荐的药比较多 。看具体来
    if (section==5) {
        return 1;//这里放的可能还是一个行，上边放集合视图就好，，不需要之前写的50个
#warning 注意得到数据的时候修改数组
    }
    //展示图片的
    if (section==4) {
        return 10;
    }
    //展示商品图片的店的图片
    if (section==3) {
        return 1;
    }
    //进店
    if (section==2) {
        return 1;
    }
#warning  //评论有些有，有些没有
    //评论有些有，有些没有
    if (section==1) {
        return 1;//暂时先这样
        
    }
    //详情展示，都不可点击的，所以...
    else{
        return 1;
    }
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //暂时
    static NSString*cellID=@"cell";
    
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]init];
    }
    
    //看看各个分区情况
    cell.textLabel.text=[NSString stringWithFormat:@"%ld",(long)indexPath.row  ];
    
    cell.backgroundColor=[UIColor purpleColor];
    
    return cell;
    
    
    
}

//区高度。。先大概做，，后边在具体调整和计算
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return self.view.frame.size.height;
    }
    
    //这个是参团，，是不固定的，，药根据数据源来的。。所以这里就先大概来个100占位下而已
    if (indexPath.section==1) {
        return 100;
    }
    
    //进店
    if (indexPath.section==2) {
        return 60;
    }
    //标题图片
    if (indexPath.section==3) {
        return 60;
    }
    //展示的图片，一般10张，每张大概先350到400.。参数给有，，这里就任性先
    if (indexPath.section==4) {
        return 350;
    }
    //推荐..看数组给的..先大概给个全屏幕高
    else
    {
        return self.view.frame.size.height;
    
    }
    
}






-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //self.tabBarController.hidesBottomBarWhenPushed=YES;
    //self.tabBarController.tabBar.hidden=YES;
    
    }





-(void)backButon
{
    [self.navigationController popViewControllerAnimated:YES];
    //NSLog(@"---");
}

@end
