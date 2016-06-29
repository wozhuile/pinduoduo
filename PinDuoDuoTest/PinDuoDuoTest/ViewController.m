//
//  ViewController.m
//  PinDuoDuoTest
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "MainView.h"
#import "NetWorkRequestModel.h"
#import "DataModels.h"
@interface ViewController ()<NetWorkRequestModelDelegate,UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //_dataArray=[[NSMutableArray alloc]initWithArray:@{_home_super_brandArray}];
    //_dataArray=[[NSMutableArray alloc]initWithObjects:_home_super_brandArray,_home_recommend_subjectsArray,_goods_listArray, nil];
  
    _dataArray=[[NSMutableArray alloc]init];
    
    
   // self.view.frame
#pragma mark 不知道为什么在初始化里边赋值和调用就出来效果了。应该是加载先后导致的吧，
    _mainView=[[MainView alloc]initWithFrame:self.view.frame];
    //[mainVIew CreateButtomScrollViewWithWidth:self.view.frame.size.width withHeight:self.view.frame.size.height];
   
    
    NetWorkRequestModel*netModel=[[NetWorkRequestModel alloc]init];
    
    [netModel topScrollViewImage];
    
    
#pragma mark  第一次运行的时候崩溃了，底部数据URL书写错误
    [netModel buttomDataRequest];
 
    
    
    
#pragma mark page and timer
   // [_mainView CreatePageControl];
    
#pragma mark 代理传值过来了。。。获取顶部图片URL。先声明代理
    netModel.delegate=self;
    
    //[_mainView  CreateMiddleScrollView];
    
    
    #pragma mark 暂时拿一张来试试
    
    /*NSString*str=@"http://omsproductionimg.yangkeduo.com/images/goods/425/SY6fRexYypFRtRiQdKzxo3RMrXZVR1bI.jpg";
    NSURL*url=[NSURL URLWithString:str];
    [mainVIew CreateTopScrollViewWithUrl:url];*/
    
    //[self.view addSubview:_mainView];
    
    
    
    
#pragma mark 表创建和代理  注意：CGRectGetMaxY(_mainView.buttomScrollView.frame)-CGRectGetMaxY(_mainView.middleView.frame)计算出来的高度
    _buttomDataTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_mainView.middleView.frame), CGRectGetWidth(self.view.frame), CGRectGetMaxY(_mainView.buttomScrollView.frame)*15-CGRectGetMaxY(_mainView.middleView.frame)) style:UITableViewStylePlain];
    
    _buttomDataTableView.backgroundColor=[UIColor greenColor];
    [_mainView.buttomScrollView addSubview:_buttomDataTableView];
    _buttomDataTableView.delegate=self;
    
    
    
    [self.view addSubview:_mainView];
    
}



#pragma mark 顶部图片遵循代理后。实现方法，
-(void)sucessToGetImageURL:(NetWorkRequestModel *)netWorkRequestModel url:(NSMutableArray *)urlArray
{
    
    //for (int i=0; i<urlArray.count; i++) {
        
     //   NSURL*url=[urlArray objectAtIndex:i];
#pragma mark 这么取值喝传值本来没有错误的，，但是到里边滚动视图的时候，，又一次循环取值了。。导致这里传值一次赋值一次进去，里边就重新调用一次，也就创新创建移除滚动视图喝图片，导致每次赋值还是第一个图片的   
#pragma mark 要想办法救赋值一次，也就是里边方法久调用创建一次，，那就不应该在这里循环取值了。。应该到里边的for循环在取值赋值，这里就应该把数组先传进去，，要懂得灵活。。
        [_mainView CreateTopScrollViewWithUrl:urlArray];
        
    //}
    
}

-(void)failToGetImageURL:(NetWorkRequestModel *)etWorkRequestModel error:(NSError *)error
{
    NSLog(@"%@",error);
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
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


#pragma mark 底部数据处理, 代理遵循了。。就直接实现方法就好
-(void)sucessToGetData:(NetWorkRequestModel *)netWorkRequestModel modelData:(PDDHomeData *)modelData
{
    //成功了。完成任务，注释吧！准备tableview创建和数组布局了
    //NSLog(@"modelData===%@",modelData);
    
    /*  //数组都可以得到对应数据了，在这里处理数组得到数据麼？
     PDDHomeData*modelData=[PDDHomeData modelObjectWithDictionary:responseObject];
     
     #pragma mark 先试试数组可以取出来完整的麼   也是够了。。打的时候不提示！！！！！！要慢慢复制过来！！
     //NSLog(@"超值大牌的:=%@--count:=%lu",modelData.homeSuperBrand.goodsList,(unsigned long)modelData.homeSuperBrand.goodsList.count);
     
     //NSLog(@"查看更多等:=%@--count=%lu",modelData.homeRecommendSubjects,(unsigned long)modelData.homeRecommendSubjects.count);
     
     //NSLog(@"最多的数据:%@--count:%lu",modelData.goodsList,(unsigned long)modelData.goodsList.count);

     */
    
    
    _home_super_brandArray=(NSMutableArray*)modelData.homeSuperBrand.goodsList;
    _home_recommend_subjectsArray=(NSMutableArray*)modelData.homeRecommendSubjects;
    _goods_listArray=(NSMutableArray*)modelData.goodsList;
    
    
}

-(void)failToGetData:(NetWorkRequestModel *)etWorkRequestModel error:(NSError *)error
{
    NSLog(@"%@",error);
}


#pragma mark table datasource and delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _home_super_brandArray.count+_home_recommend_subjectsArray.count+_goods_listArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    return cell;
}

@end
