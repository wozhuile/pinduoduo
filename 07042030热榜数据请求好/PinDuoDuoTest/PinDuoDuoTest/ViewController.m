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
#import "PDDHotViewController.h"
#import "PDDGoodsList.h"
#import "PDDHomeData.h"
#import "PDDGroup.h"
#import "PDDHomeRecommendSubjects.h"
#import "PDDHomeSuperBrand.h"
#import "PDDRankViewController.h"




#import "goods_listTableViewCell.h"
#import "home_recommend_subjectsTableViewCell.h"
#import "home_super_brandTableViewCell.h"

static  NSString*goodsCell=@"goods_list";

static  NSString*home_recommend_subjectsCell=@"home_recommend_subjects";
static  NSString*home_super_brandCell=@"home_super_brand";


#import <UIImageView+WebCache.h>


#import <MJRefresh.h>

#import "TopScrollTableViewCell.h"
#import "MiddlescrollTableViewCell.h"
#import "textFieldTableViewCell.h"

#import "purChasingViewController.h"
#import "UIColor+Hex.h"


@interface ViewController ()<NetWorkRequestModelDelegate,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,MiddlescrollTableViewCellDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      countSum=1;
 
    //声明代理
    self.milldeScroll.delegate=self;
    
    
    _goods_listArray=[[NSMutableArray alloc]init];
    _home_recommend_subjectsArray=[[NSMutableArray alloc]init];
    _home_super_brandArray=[[NSMutableArray alloc]init];
    _dataArray=[[NSMutableArray alloc]init];
    _totalarray=[[NSMutableArray alloc]init];
    
    _topScrollArray=[[NSMutableArray alloc]init];
    

    
    _netModel =[[NetWorkRequestModel alloc]init];
    
    
    
    
#pragma mark 代理传值过来了。。。获取顶部图片URL。先声明代理
    _netModel.delegate=self;
    
    
    
    
    //表
    [self createTableView];
    
 
    
    
    //[_netModel topScrollViewImage:[NSString stringWithFormat:@"http://apiv2.yangkeduo.com/subjects"]];
    
        //[_netModel buttomDataRequest:[NSString stringWithFormat:@"http://apiv2.yangkeduo.com/v2/goods?page=1&size=50"]];
    
    
    
    //刷新
    [self refresh];

    
    [_buttomDataTableView registerNib:[UINib nibWithNibName:@"goods_listTableViewCell" bundle:nil]   forCellReuseIdentifier:goodsCell];
    
  }


-(void)createTableView
{
    
    
#pragma mark 表创建和代理  注意：CGRectGetMaxY(_mainView.buttomScrollView.frame)-CGRectGetMaxY(_mainView.middleView.frame)计算出来的高度
    _buttomDataTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
    
    _buttomDataTableView.backgroundColor=[UIColor greenColor];
    _buttomDataTableView.delegate=self;
    
#pragma mark 先写一个死值！
    _buttomDataTableView.rowHeight=268;
    
#pragma mark 暂时用个分割线
    _buttomDataTableView.separatorColor=[UIColor grayColor];
//    
//    [_buttomDataTableView registerNib:[UINib nibWithNibName:@"goods_listTableViewCell" bundle:nil]   forCellReuseIdentifier:goodsCell];
#pragma mark  隐藏滚动条
   // _buttomDataTableView.showsVerticalScrollIndicator=NO;
    
    
#pragma mark 这里没有实现，怎么运行数据都没有出来；
    _buttomDataTableView.dataSource=self;
    
    [self.view addSubview:_buttomDataTableView];
    
 
#pragma mark 不允许反弹，都下拉不了了。
    //_buttomDataTableView.bounces=NO;
    
}

#pragma mark 刷新
-(void)refresh
{

    
    
    
    _buttomDataTableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        countSum=1;
        [_netModel topScrollViewImage:@"http://apiv2.yangkeduo.com/subjects"];
        
        [_netModel buttomDataRequest:@"http://apiv2.yangkeduo.com/v2/goods?page=1&size=50"];
    }];
    
    [_buttomDataTableView.header beginRefreshing];
    
   
    _buttomDataTableView.footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        countSum++;
        
        
        [_netModel topScrollViewImage:@"http://apiv2.yangkeduo.com/subjects"];
        [_netModel buttomDataRequest:[NSString stringWithFormat:@"http://apiv2.yangkeduo.com/v2/goods?page=%ld&size=50",(long)countSum]];
            
      }];
    
    //[_buttomDataTableView.footer beginRefreshing];
    
    
}
#pragma mark 顶部图片遵循代理后。实现方法，
-(void)sucessToGetImageURL:(NetWorkRequestModel *)netWorkRequestModel url:(NSMutableArray *)urlArray
{
    
    _topScrollArray=urlArray;
    
    
#pragma mark 小心刷新重复了
   // [_buttomDataTableView reloadData];   //先不要刷新，，否则一会下边美进行请求好就在此刷新了。。就会数组没数据，会崩溃
    
 
    
}

-(void)failToGetImageURL:(NetWorkRequestModel *)etWorkRequestModel error:(NSError *)error
{
    NSLog(@"%@",error);
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.navigationItem.title=@"拼多多商城";
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithHexString:@"#ffffff"];
    
}


#pragma mark 底部数据处理, 代理遵循了。。就直接实现方法就好
-(void)sucessToGetData:(NetWorkRequestModel *)netWorkRequestModel modelData:(PDDHomeData *)modelData
{
    if (countSum == 1) {
        //刷新
        _home_super_brandArray=[[NSMutableArray alloc]initWithArray:modelData.homeSuperBrand.goodsList];
        _home_recommend_subjectsArray=[[NSMutableArray alloc]initWithArray:modelData.homeRecommendSubjects];
        _goods_listArray=[[NSMutableArray alloc]initWithArray:modelData.goodsList];
        
        [self.goods_listArray insertObject:modelData.homeSuperBrand atIndex:modelData.homeSuperBrand.position];
        
        [_home_recommend_subjectsArray enumerateObjectsUsingBlock:^(PDDHomeRecommendSubjects*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [_goods_listArray insertObject:obj atIndex:obj.position+1];//加1试试
            
            
        }];
        
      
        [_totalarray setArray:_goods_listArray];
            //NSLog(@"获得首页数据");
//        [_buttomDataTableView.header endRefreshing];
//        
//#pragma mark 不知道为什么加这个就可以防止有时候多次进来返回相同数据
      //return;
//        
        
    }else{
        
       // NSLog(@"获得分页数据");
        //加载更多
        [_totalarray   addObjectsFromArray:modelData.goodsList];
        // [_buttomDataTableView.footer endRefreshing];
    }

    
    
    //结束刷新
    [_buttomDataTableView.header endRefreshing];
    
#pragma mark 记得设置结束
    [_buttomDataTableView.footer endRefreshing];
    
#pragma mark 得到数据进行刷新 
    [_buttomDataTableView reloadData];
}

-(void)failToGetData:(NetWorkRequestModel *)etWorkRequestModel error:(NSError *)error
{
    NSLog(@"%@",error);
}


#pragma mark table datasource and delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
     if (section==3) {
        return _totalarray.count;

    }
    
    
    return 1;
}

#pragma mark 高度

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 200;
    }
    
    if (indexPath.section==1) {
        return 100;
    }
    if (indexPath.section==2) {
        return 60;
    }
    
    
    return 268;
}


#pragma mark 对表分4个区，前三个就一行，展示顶部滚动，中间滚动，输入框，
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 4;
}



-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    

    
    
    
#pragma mark 分区后
    
   if (indexPath.section==0) {
        static NSString*cellID=@"topImageCell";
        TopScrollTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (cell==nil) {
            cell=[[TopScrollTableViewCell alloc]init];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
            
        }
       
        
        [_topScrollArray enumerateObjectsUsingBlock:^(NSURL*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            UIImageView*img=[cell.contentView viewWithTag:idx+300];

            [img sd_setImageWithURL:obj placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];
            
        }];
       
#pragma mark 忘记写reture  。所以一直全部运行，，直接就崩溃了／
       //  cell.backgroundColor=[UIColor purpleColor];
     //  cell.backgroundColor=[UIColor purpleColor];
         return cell;
        
    }
    
    
    if (indexPath.section==1) {
        
        static NSString*cellID=@"MidleCell";
        MiddlescrollTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
        
       // cell.delegate=self;
        
        if (cell==nil) {
            cell=[[MiddlescrollTableViewCell alloc]init];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
        }
           cell.delegate=self;
         //cell.backgroundColor=[UIColor purpleColor];
        
         return cell;
        
    }
    
    if (indexPath.section==2) {
        static NSString*cellID=@"textCell";
        textFieldTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell==nil) {
            cell=[[textFieldTableViewCell alloc]init];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
        }

         return cell;
    }
    
 
    
    id obj=[_totalarray objectAtIndex:indexPath.row];
    
    
    
    
    if ([obj isKindOfClass:[PDDHomeRecommendSubjects class]]) {
        
        
        PDDHomeRecommendSubjects*pddRecomment=obj;
        home_recommend_subjectsTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:home_recommend_subjectsCell];
        if (cell==nil) {
            cell=[[home_recommend_subjectsTableViewCell alloc]init];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
        }
        [pddRecomment.goodsList enumerateObjectsUsingBlock:^(PDDGoodsList*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIImageView*img=[cell.contentView viewWithTag:idx+30];
            [img sd_setImageWithURL:[NSURL URLWithString:obj.hdThumbUrl] placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];
            UILabel*lab=[cell.contentView viewWithTag:idx+60];
            lab.text=obj.goodsName;
            
            
            
            UILabel*pricelabel=[cell.contentView viewWithTag:idx+75];
            
            pricelabel.text=[NSString stringWithFormat:@"$%.2f",obj.price/100];
        }];
        
        UILabel*sub=[cell.contentView viewWithTag:22];
        sub.text=pddRecomment.subject;
        return cell;
    }
    
  
    if ([obj isKindOfClass:[PDDGoodsList class]]) {
        PDDGoodsList*goodsLists=obj;
        goods_listTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:goodsCell];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        [cell.good_listImageView sd_setImageWithURL:[NSURL URLWithString:goodsLists.imageUrl] placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];
        
        cell.goods_name.text=goodsLists.goodsName;
        cell.goods_name.font=[UIFont systemFontOfSize:13];
        
        cell.customer_num.text=[NSString stringWithFormat:@"%d人团",(int)goodsLists.group.customerNum ];
        cell.price.text=[NSString stringWithFormat:@"$%.2f",goodsLists.group.price/100];
        
        return cell;
        
    }
    
    
    else{
        home_super_brandTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:home_super_brandCell];
        
        if (cell==nil ) {
            cell=[[home_super_brandTableViewCell alloc]init];
            
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
        }
        
        [_home_super_brandArray enumerateObjectsUsingBlock:^(PDDGoodsList * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            UIImageView*img=[cell.contentView viewWithTag:100+idx];
            [img sd_setImageWithURL:[NSURL URLWithString:obj.imageUrl] placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];
            
            
            UILabel*labe=[cell.contentView viewWithTag:10+idx];
            labe.text=[NSString stringWithFormat:@"$%.2f",obj.price/100];
            labe.textColor=[UIColor redColor];
            
            
        }];
        
        
      
//    
//    static NSString*cellID=@"dell";
//    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
//    if (cell==nil) {
//        cell=[[UITableViewCell alloc]init];
//    }
//    cell.textLabel.text =[NSString stringWithFormat:@"%ld",(long)indexPath.row];
//    cell.backgroundColor=[UIColor greenColor];
        return cell;
    }
    
    

}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   // NSLog(@"------是滚动试图----");

   // NSLog(@"%f",scrollView.contentOffset.y);
    
    
     CGFloat height=scrollView.contentOffset.y;
    
    
#pragma mark 最好不要移除，，就是显示和隐藏就好  ,hidden属性就可以了的
    
    
    //大概一下试试  系统效果差不多就是这个位置
    if (height>300) {
        
        //_isShowButton=NO;
        _scrollToTopButton.hidden=NO;
       if (_scrollToTopButton==nil&&_isShowButton==NO) {
            _scrollToTopButton=[[UIButton alloc]initWithFrame:CGRectMake(350, 600, 40, 40)];
           // _scrollToTopButton.backgroundColor=[UIColor whiteColor];
           //[_scrollToTopButton setTitle:@"顶部" forState:0];
           //[_scrollToTopButton setTintColor:[UIColor blackColor]];
           //切
           _scrollToTopButton.layer.cornerRadius=20;
           _scrollToTopButton.layer.masksToBounds=YES;
           
           [_scrollToTopButton setBackgroundImage: [UIImage imageNamed:@"go_top"] forState:0];
           [_scrollToTopButton setTitle:@"顶部" forState:0];
           [_scrollToTopButton setTitleColor:[UIColor blackColor] forState:0];
          // [_scrollToTopButton setTintColor:[UIColor blackColor]];//
           //[_scrollToTopButton settit];//这里不能设置大小，下边的才可以
           
           
           
           _scrollToTopButton.titleLabel.font=[UIFont systemFontOfSize:13];
           
           
           
           
            [_scrollToTopButton addTarget:self action:@selector(topButton) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:_scrollToTopButton];
            
            
        }
        
        
        
    }
    
    else
    { _buttomDataTableView.bounces=YES;
        
        //_isShowButton=YES;
        _scrollToTopButton.hidden=YES;
        //[_scrollToTopButton removeFromSuperview];
    }
    

}

-(void)topButton
{
    //_buttomDataTableView.scrollEnabled=YES;
    //_buttomDataTableView.scrollsToTop=YES;
    //_buttomDataTableView.bounces=NO;
    
    [_buttomDataTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
//    [_buttomDataTableView setContentOffset:CGPointMake(0, -120)];//不知道为什么要120来对冲掉，，还有需要设置不反弹在这里，创建的时候不能设置，否则下拉都没有拉..其实在这里也是没有了的，要不还是在上边坐标哪里判断？在开始的时候反弹开启，，没多大效果
    
    
}

#pragma mark 第二区10个按钮实现方法   注意tag对不对
-(void)sendButton:(MiddlescrollTableViewCell *)cell button:(UIButton *)button
{
    NSLog(@"%ld",(long)button.tag);
    
    if (button.tag==0) {
        purChasingViewController*purchasing=[[purChasingViewController alloc]init];
        
        //[purchasing.navigationController.navigationBar.backItem setHidesBackButton:YES];
        //这个可以隐藏，但是连按钮都没有了
        //[purchasing.navigationItem setHidesBackButton:YES];
        //[purchasing.navigationItem.backBarButtonItem setTitle:@""];
        [self.navigationController pushViewController:purchasing animated:YES];//注意动画效果要不要
        
    }
}

@end
