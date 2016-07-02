//
//  PDDRankViewController.m
//  PinDuoDuoTest
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "PDDRankViewController.h"
#import "rankTool.h"

#import <UIImageView+WebCache.h>
#pragma mark 按钮背景图片
#import <UIButton+WebCache.h>


#import "promotion_listTableViewCell.h"
#import "country_listTableViewCell.h"
#import "goods_listRankTableViewCell.h"

#pragma mark 因为goods这个喝首页的goods样式一样，所以直接导入用吧

#import "goods_listTableViewCell.h"
//static NSString*goodCell=@"goodsCell";
/*PinDuoDuoTest[7509:179638] *** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'cell reuse indentifier in nib (goods_list) does not match the identifier used to register the nib (goodsCell)'
 *** First throw call stack:
*/

static NSString*goodCell=@"goods_list";





#import "RankBaseModle.h"
#import "RankCountryList.h"
#import "RankGoodsList.h"
#import "RankGroup.h"
#import "RankPromotionList.h"



@interface PDDRankViewController ()<UITableViewDataSource,UITableViewDelegate,rankToolDelegate>

@end

@implementation PDDRankViewController

//创建表

-(UITableView*)rankTableView
{
  if (_rankTableView==nil) {
        _rankTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        [self.view addSubview:_rankTableView];
        _rankTableView.delegate=self;
        _rankTableView.dataSource=self;
        //_rankTableView.backgroundColor=[UIColor greenColor];
      _rankTableView.rowHeight=268;
      
      
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
 
#pragma mark 自动上去64了   妈蛋。第0区加了滚动就不要了。
    //self.automaticallyAdjustsScrollViewInsets=NO;
    
    _country_listArray=[[NSMutableArray alloc]init];
    _promotion_listArray=[[NSMutableArray alloc]init];
    _goods_listArray=[[NSMutableArray alloc]init];
    
    [self rankTableView];
   // NSLog(@"%f",self.view.frame.size.width);
    
    rankTool*ranlTL=[[rankTool alloc]init];
    
    [ranlTL sendRequestForGetData:[NSString stringWithFormat:@"http://apiv2.yangkeduo.com/v2/haitaov2?page=1&size=50"]];
    
    
#pragma mark 代理传值，先遵循代理
    ranlTL.delegate=self;
    


#pragma mark 注册goods
    
    
     [_rankTableView registerNib:[UINib nibWithNibName:@"goods_listTableViewCell" bundle:nil]   forCellReuseIdentifier:goodCell];
    //[self rankTableView];
                                
}
#pragma mark rankTool   delegate method
-(void)sendData:(rankTool *)rankTool country_listArray:(NSMutableArray *)country_listArray promotion_listArray:(NSMutableArray *)promotion_listArray goods_listArray:(NSMutableArray *)goods_listArray
{
    
    //接受数据
    self.country_listArray=country_listArray;
    self.promotion_listArray=promotion_listArray;
    self.goods_listArray=goods_listArray;
    
    NSLog(@" self.promotion_listArray==%@", self.promotion_listArray);
    
    
#pragma mark  不是没用。。表忘记刷新了。能有数据出来才怪，，第一次数组本来就是美数据的，，虽然这里有了。。但是不刷新也没用
    [_rankTableView reloadData];
    
}

-(void)failToGetData:(rankTool *)rankTool error:(NSError *)error
{
    NSLog(@"rankError===%@",error);
}

#pragma mark tableView datasource  and  delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    if (section==0) {
        return 1;
    }
    if (section==1) {
        return 1;
    }
    
    
    return 50;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString*cellID=@"cell";
   // UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (indexPath.section==0) {
        static NSString*cellID=@"promotion_list";
        promotion_listTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (cell==nil) {
            cell=[[promotion_listTableViewCell alloc]init];
        }
        
        [_promotion_listArray enumerateObjectsUsingBlock:^(RankPromotionList*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
#pragma mark 为什么到这里了还说数组是空的？？上去数据源输出试试看，，是不是强转这个问题再次来了／／
            //NSLog(@"obj===%@",obj);
            
            
            
            /*
             #pragma mark 注意了。现在 图片放在的是滚动视图上，一会在cell。contentview上是找不到的，，所以不奇怪没出来图片
             [_topScrollView addSubview:imageView];*/
            
            
          
#pragma mark 两个都可以的，，就是一开始没有刷新表，，数据得到不刷新没用，，然后后边美出来，，估计缓存原因吧／／／
            //UIScrollView*scro=[cell.contentView viewWithTag:8888];
            UIImageView*img=[cell.contentView viewWithTag:200+idx];
            
            [img sd_setImageWithURL:[NSURL URLWithString:obj.homeBanner] placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];
            
        }];
        
        cell.backgroundColor=[UIColor purpleColor];
        
        //cell.selectionStyle=UITableViewCellSelectionStyleGray;
        
        return cell;
    }
    
    
    
    if (indexPath.section==1) {
        static NSString*cellID=@"country_list";
        
        country_listTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
        
        
        if (cell==nil) {
            cell=[[country_listTableViewCell alloc]init];
        }
        [_country_listArray enumerateObjectsUsingBlock:^(   RankCountryList*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
         
            UIButton*button=[cell.contentView viewWithTag:100+idx];
            [button sd_setBackgroundImageWithURL:[NSURL URLWithString:obj.homeBanner] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];
            
            [button setTitle:[NSString stringWithFormat:@"%@",obj.subject] forState:0  ];
            
            button.contentEdgeInsets=UIEdgeInsetsMake(10, 0, -15, 0);//慢慢调节下
            button.titleEdgeInsets=UIEdgeInsetsMake(80, 0, 10, 0);
            
#pragma mark 设置下文字大小;
             button.titleLabel.font=[UIFont systemFontOfSize:15];//12左右就差不多
            //不设置字体颜色就是白色的
            [button setTitleColor:[UIColor whiteColor] forState:0];
            
            
            
            
            
        }];
        
        
        
        return cell;
        
        
    }
    
    
    
    
#pragma mark *** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'UITableView (<UITableView: 0x7fe2fb180600; frame = (0 0; 414 736); clipsToBounds = YES; gestureRecognizers = <NSArray: 0x7fe2fcbd52a0>; layer = <CALayer: 0x7fe2fcb66660>; contentOffset: {0, -64}; contentSize: {414, 2288}>) failed to obtain a cell from its dataSource (<PDDRankViewController: 0x7fe2fa491440>)'如果不写下边的那些，哪怕是实验，都有可能崩溃了。。一直崩溃。。。http://www.cnblogs.com/ygm900/archive/2013/06/13/3134425.html
    

  
   // if (cell==nil) {
      //  cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    //}
  
#pragma mark 先暂时用这个来看看有没有分区
    //cell.textLabel.text=[NSString stringWithFormat:@"%ld",(long)indexPath.row];
    //cell.backgroundColor=[UIColor greenColor];
    
    
    //cell.selectionStyle=UITableViewCellSelectionStyleBlue;

    
    
    goods_listTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:goodCell];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    RankGoodsList*rank=[_goods_listArray objectAtIndex:indexPath.row];
    
    [cell.good_listImageView sd_setImageWithURL:[NSURL URLWithString:rank.imageUrl] placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];
    
    cell.goods_name.text=rank.goodsName;
    
    cell.customer_num.text=[NSString stringWithFormat:@"%d人团",(int)rank.group.customerNum ];
    cell.price.text=[NSString stringWithFormat:@"$%.2f",rank.group.price/100];
    

    
    
    
    
    return cell;
}


#pragma mark 大概先定死一个高度，然后再计算
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 220;
    }
    if (indexPath.section==1) {
        
        return 140;
    }
    
    return 268;
}


//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    
//    if (section==0) {
//        
//        
//        return 50;
//    }
//    return 50;
//}

@end
