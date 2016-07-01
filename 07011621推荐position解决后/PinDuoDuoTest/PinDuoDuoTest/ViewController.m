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
//#import "DataModels.h"
#import "PDDHotViewController.h"
#import "PDDGoodsList.h"
#import "PDDHomeData.h"
#import "PDDGroup.h"
#import "PDDHomeRecommendSubjects.h"
#import "PDDHomeSuperBrand.h"
#import "PDDRankViewController.h"
//#import "PDDHomeSuperBrand.h"//重复导入上边


#import "goods_listTableViewCell.h"
#import "home_recommend_subjectsTableViewCell.h"
#import "home_super_brandTableViewCell.h"

static  NSString*goodsCell=@"goods_list";

static  NSString*home_recommend_subjectsCell=@"home_recommend_subjects";
static  NSString*home_super_brandCell=@"home_super_brand";

#import <UIImageView+WebCache.h>

@interface ViewController ()<NetWorkRequestModelDelegate,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化
    _recommentPositionArray=[[NSMutableArray alloc]init];
    _goods_listArray=[[NSMutableArray alloc]init];
    _home_recommend_subjectsArray=[[NSMutableArray alloc]init];
    _home_super_brandArray=[[NSMutableArray alloc]init];
    _dataArray=[[NSMutableArray alloc]init];
    
    //view
    _mainView=[[MainView alloc]initWithFrame:self.view.frame];
    NetWorkRequestModel*netModel=[[NetWorkRequestModel alloc]init];
    [netModel topScrollViewImage:@"http://apiv2.yangkeduo.com/subjects"];
    [netModel buttomDataRequest:@"http://apiv2.yangkeduo.com/v2/goods?page=1&size=50"];
    netModel.delegate=self;
    
    //表
    _buttomDataTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_mainView.middleView.frame), CGRectGetWidth(self.view.frame), CGRectGetMaxY(_mainView.buttomScrollView.frame)*15-CGRectGetMaxY(_mainView.middleView.frame)) style:UITableViewStylePlain];
    _buttomDataTableView.delegate=self;
    _buttomDataTableView.dataSource=self;
    [_mainView.buttomScrollView addSubview:_buttomDataTableView];
    _buttomDataTableView.rowHeight=268;
    _buttomDataTableView.separatorColor=[UIColor grayColor];
    _buttomDataTableView.showsVerticalScrollIndicator=NO;
    [self.view addSubview:_mainView];
    
 }
#pragma mark 顶部图片遵循代理后。实现方法，
-(void)sucessToGetImageURL:(NetWorkRequestModel *)netWorkRequestModel url:(NSMutableArray *)urlArray
{
    [_mainView CreateTopScrollViewWithUrl:urlArray];
}
-(void)failToGetImageURL:(NetWorkRequestModel *)etWorkRequestModel error:(NSError *)error
{
    NSLog(@"%@",error);
}

#pragma mark 底部数据处理, 代理遵循了。。就直接实现方法就好
-(void)sucessToGetData:(NetWorkRequestModel *)netWorkRequestModel modelData:(PDDHomeData *)modelData
{
    //初始化数据源
    _home_super_brandArray=[[NSMutableArray alloc]initWithArray:modelData.homeSuperBrand.goodsList];
    _home_recommend_subjectsArray=[[NSMutableArray alloc]initWithArray:modelData.homeRecommendSubjects];
    _goods_listArray=[[NSMutableArray alloc]initWithArray:modelData.goodsList];
    
    //插入goods_listArray
    [self.goods_listArray insertObject:modelData.homeSuperBrand atIndex:modelData.homeSuperBrand.position];
    
    [_home_recommend_subjectsArray enumerateObjectsUsingBlock:^(PDDHomeRecommendSubjects*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [_goods_listArray insertObject:obj atIndex:obj.position+1];//加1试试
        _recommentArray=[[NSMutableArray alloc]initWithArray:obj.goodsList];
    }];
    
 #pragma mark  position 纪录
    _home_super_brandPosition=modelData.homeSuperBrand.position;
    
    for (PDDHomeRecommendSubjects*recommentSub in modelData.homeRecommendSubjects) {
        NSNumber*nub=[[NSNumber alloc]initWithInt:recommentSub.position];
        [_recommentPositionArray addObject:nub];
    }
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
    return _goods_listArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==_home_super_brandPosition) {
        home_super_brandTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:home_super_brandCell];
        
        if (cell==nil ) {
            cell=[[home_super_brandTableViewCell alloc]init];
            
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
        }
        [_home_super_brandArray enumerateObjectsUsingBlock:^(PDDGoodsList * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            UIImageView*img=[cell.contentView viewWithTag:100+idx];
            [img sd_setImageWithURL:[NSURL URLWithString:obj.imageUrl] placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];
            
            
            UILabel*labe=(UILabel*)[cell.contentView viewWithTag:10+idx];
            labe.text=[NSString stringWithFormat:@"$%.2f",obj.price/100];
            labe.textColor=[UIColor redColor];
            
        }];
        //cell.backgroundColor=[UIColor orangeColor];
        
        return cell;
    }
    
    
    
    id obj=[_goods_listArray objectAtIndex:indexPath.row];
    if ([obj isKindOfClass:[PDDHomeRecommendSubjects class]]) {
        PDDHomeRecommendSubjects*pddRecomment=obj;
        NSLog(@"%f",pddRecomment.position);
        
#pragma mark 一直没出来就是多了这个方法判断，多了一个代码： if (indexPath.row==pddRecomment.position) {  其实本来也是可以的，，但是没有理解好，因为position其实就是8啊，。12什么的，，但是在数组里边取出来的时候，indexpath。row都是10了。。。／在基础上加2了。。。。。。
        
//        if (indexPath.row==pddRecomment.position) {
            home_recommend_subjectsTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:home_recommend_subjectsCell];
            if (cell==nil) {
                
                
               //cell=[[home_recommend_subjectsTableViewCell alloc]init];
                cell = [[[NSBundle mainBundle] loadNibNamed:@"home_recommend_subjectsTableViewCell" owner:nil options:nil] lastObject];
            }
            [_recommentArray enumerateObjectsUsingBlock:^(PDDGoodsList*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                //注意tag
                UIImageView*img=[cell.contentView viewWithTag:idx+60];
                [img sd_setImageWithURL:[NSURL URLWithString:obj.imageUrl] placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];
                UILabel*lab=[cell.contentView viewWithTag:idx+60];
                lab.text=obj.goodsName;
            }];
            cell.backgroundColor=[UIColor purpleColor];
            return cell;
//        }
    }
    
    
    goods_listTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:goodsCell];
    if (cell==nil) {
                //从xib文件中获取cell
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"goods_listTableViewCell" owner:nil options:nil];
        cell = [array objectAtIndex:0];
        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    
    if ([obj isKindOfClass:[PDDGoodsList class]]) {
        PDDGoodsList*goodsLists=obj;
        [cell.good_listImageView sd_setImageWithURL:[NSURL URLWithString:goodsLists.imageUrl] placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];
        
        cell.goods_name.text=goodsLists.goodsName;
        
        cell.customer_num.text=[NSString stringWithFormat:@"%d人团",(int)goodsLists.group.customerNum ];
        cell.price.text=[NSString stringWithFormat:@"$%.2f",goodsLists.group.price/100];
    }
    
    //cell.backgroundColor=[UIColor greenColor];
    
        return cell;
 }

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _buttomDataTableView.scrollEnabled=NO;
    self.navigationItem.title=@"拼多多商城";
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:225/256.0 green:225/256.0 blue:225/256.0 alpha:1.0];
}
@end
