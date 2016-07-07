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

#import "detailsViewController.h"





@interface ViewController ()<NetWorkRequestModelDelegate,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,MiddlescrollTableViewCellDelegate,home_recommend_subjectsTableViewCellDelegate>

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
        
        
#pragma mark 声明代理，传值手势过来
        cell.delegate=self;
        
        
        
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



#pragma mark 单元格点击方法,要做的就是，点击跳转到下一个控制器类，第二，把每个单元格对应的产品的goods——id传值过去，最好还有多少人团和价格，第三，用这个id来拼接http进行请求， 第一个应该简单的，，第二个应该是找到cell，，因为数据源不同，，但是可以试试找到cell，，然后用id 类型来接受，，输出看看都可以得到麼，，如果可以，，就id obj 找到，，试试看吧。。。不行就找到一个就添加一次到数组，然后再传值，，插入法..还有要注意上拉更多的时候。。慢慢一步步来
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
#warning 注意跳转过来后的效果，，下边的标签栏应该隐藏的，然后再下边创建一个view来做下边的东西。。self.tabBarController.hidesBottomBarWhenPushed
    
    
    //  self.tabBarController.hidesBottomBarWhenPushed
    
  
    
    
    
#pragma mark 先输出看看效果，点击对不对先
    //NSLog(@"indexPath.section===%ld  indexPath.row ===%ld",(long)indexPath.section,(long)indexPath.row);
    
    
    //上边可以看出来点击了。。现在做第一步跳转！！
    
    
    
    
   detailsViewController*detailVC=[[detailsViewController alloc]init];
    
    //[self.navigationController pushViewController:detailVC animated:YES];
    
#pragma mark 实现了跳转，但是发现一个bug，那就是第三个类型的单元格，点击滚动上边不进行跳转，，加个手势试试吧  ，要考虑的点，再cell上放滚动和按钮什么的，点击进行跳转有问题。。。
    
    
    
//手势做好了。问题应该也有，，传值的时候，有点麻烦。。这里就传值大牌和goodslist的吧，手势的就传值推荐，，然后过去的时候请求怎么办？？先不理，，一步一步来
#pragma makr 动态特性之动态类型
   //TODO: 动态特性之动态类型
    //id obj=[tableView cellForRowAtIndexPath:indexPath];
    //输出试试
    //NSLog(@"%@",obj);
    
    
   // if ([obj isKindOfClass:[home_super_brandTableViewCell class]]) {
        //PDDGoodsList*goods=[_ho];
#pragma makr 这个要先跳转到超值大牌。。和上边10个按钮的一样，然后才会跳转到拼多多商城，，所以，这里就先不做，，或者，要做，也是先做手势，在手势做说不定好点，，一会先吧
        
        
   // }
    
    
    //if ([obj isKindOfClass:[goods_listTableViewCell class]]) {
        //先输出数组对不对，一定要是这类型的  ,或者可以在遍历里边限制类型
        //遍历数组把goods都传过去吧
        
        
        
        
        
        
        
        
        
       // [_goods_listArray enumerateObjectsUsingBlock:^(PDDGoodsList*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
#pragma mark 为了试试，先不进行跳转代码。。
            //输出试试看。。是不是要在这个遍历之前进行类型判断
           // NSLog(@"(int)obj.goodsId=====%d",(int)obj.goodsId);
       
#warning 崩溃意义
   /*崩溃反馈，，，就是超值大牌哪里就崩溃了...，，看来要进行类型判断，因为这个时候_goods_listArray已经追加了超值大牌喝推荐了。应该要数组先取出来，按照类型来，，要知道这个数组里边在插入超值大牌和推荐的时候是对象，而不是goods类型对象，，是不是不需要找到cell了？？输出了所有的indexpath。row了。。都成功了。。我们其实就可以用数组取出来，判断类型了。。不需要cell找到来判断类型了。。。。。试试
             
             2016-07-06 21:44:55.599 PinDuoDuoTest[11303:366817] <goods_listTableViewCell: 0x7facb1844a00; baseClass = UITableViewCell; frame = (0 360; 414 268); autoresize = W; layer = <CALayer: 0x7facb3957770>>
             2016-07-06 21:44:55.600 PinDuoDuoTest[11303:366817] (int)obj.goodsId=====234865
             2016-07-06 21:44:55.600 PinDuoDuoTest[11303:366817] (int)obj.goodsId=====232920
             2016-07-06 21:44:55.600 PinDuoDuoTest[11303:366817] (int)obj.goodsId=====202706
             2016-07-06 21:44:55.600 PinDuoDuoTest[11303:366817] (int)obj.goodsId=====244104
             2016-07-06 21:44:55.600 PinDuoDuoTest[11303:366817] -[PDDHomeSuperBrand goodsId]: unrecognized selector sent to instance 0x7facb39372d0
             2016-07-06 21:44:55.604 PinDuoDuoTest[11303:366817] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[PDDHomeSuperBrand goodsId]: unrecognized selector sent to instance 0x7facb39372d0'
             *** First throw call stack:
             (
*/
            
            
            
            
            
            
            
            
            
        //}];
   // }
    
    
#pragma mark 直接通过索引，在_goods_listArray里边取出来所有对象，，在判断，，不需要用cell找到来判断。。麻烦，后边还是需要回到这个
#pragma mark 动态类型
    id obj=[_goods_listArray objectAtIndex:indexPath.row];
    
    if ([obj isKindOfClass:[PDDHomeSuperBrand class]]) {
        #pragma makr 这个要先跳转到超值大牌。。和上边10个按钮的一样，然后才会跳转到拼多多商城，，所以，这里就先不做，，或者，要做，也是先做手势，在手势做说不定好点，，一会先吧
        //不过可以加个输出试试
        PDDHomeSuperBrand*brand=obj;
        NSLog(@"%@",brand.goodsList);//数组
    }
    if ([obj isKindOfClass:[PDDHomeRecommendSubjects class]]) {
#warning 注意手势没有放满可能导致的问题。。这里应该也要传值，，因为有些部分点击还是会跳转的
        //这个好像要在下边的手势里边做了。。因为这里点击不太有效。。对了，有一部分有效的，，因为我的手势没有放满cell
        
        PDDHomeRecommendSubjects*recomment=obj;
        
#pragma mark 下边崩溃，。。。那是这里找数组不对。。这里直接用对象找到数组在遍历啊！！！还有就是点击一个按钮是对应打开不同的拼多多商城的，，所以看看下边的手势还需要不？？，，，效果是这样的，，点击滚动上的按钮，就进行跳转到不同的拼多多商城，，如果不是滚动而是cell的其他部分，，就先跳转到所有的，也就是最上边10个按钮对应的一个之一的，，然后才。。。。／。。。。／／  这里就分两种情况，一种是点击按钮分别跳转多商城先，一种cell其他部分也就是查看更多哪里先跳转展示。。。，首先这里，数组先修改不崩溃先。。。
        
        
        
        //[_home_recommend_subjectsArray enumerateObjectsUsingBlock:^(PDDGoodsList*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
#warning 数组不要用之前的了。。要用这里对象对应的不会错，。试试看
        
#warning 不崩溃了。。。但是也不需要都一起传过去了的，，我们要的是点击按钮传过去，。，。。，这里后边在处理吧。。。
         [recomment.goodsList enumerateObjectsUsingBlock:^(PDDGoodsList*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
            //输出试试.其实就点击一次就跳转到cell了。。应该放满手势
            NSLog(@"PDDHomeRecommendSubjects====%d",(int)obj.goodsId);
#warning 推荐点击还崩溃
            /*点击其他的，没有崩溃。。点击这个推荐就崩溃了。。。 2016-07-06 22:03:04.961 PinDuoDuoTest[11346:373401] indexPath.section===3  indexPath.row ===9
             2016-07-06 22:03:04.961 PinDuoDuoTest[11346:373401] -[PDDHomeRecommendSubjects goodsId]: unrecognized selector sent to instance 0x7ffb4c0e3090
             2016-07-06 22:03:04.999 PinDuoDuoTest[11346:373401] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[PDDHomeRecommendSubjects goodsId]: unrecognized selector sent to instance 0x7ffb4c0e3090'
             *** First throw call stac*/
            
            
            
        }];
        
    }
    
    if ([obj isKindOfClass:[PDDGoodsList class]]) {
        PDDGoodsList*goods=obj;
        NSLog(@"PDDGoodsList===%d",(int)goods.goodsId);
        
#pragma mark 不知道为什么，这里属性传值就可以，，但是下边的代理传值就没用效果，这个本来就是这么简单，那就是代理传值是从后边往前传的，之所以我们在请求的时候看起来就是前往后传，那其实不是前往后，而是里边的block回调，其实本来我们就先有视图了，在里边菜请求，，也就是视图就是前，请求是后，再说block也会回调。。。。一定是后往前传值的
        
        detailVC.dataIndex=goods.goodsId;
        
#pragma mark 上边处理好了。。这里也得到goodsID了。。可以过去请求啦。。
        
        
#pragma mark 创建代理，，让点击跳转的时候，代理传值数据过去...
        
        if ([_dataDelegate respondsToSelector:@selector(sendGoods_listIndex:indexPath:)]) {
            [_dataDelegate sendGoods_listIndex:self indexPath:goods.goodsId];
        }
        
         //[self.navigationController pushViewController:detailVC animated:YES];
    }
    
    //要想知道传值成功没有，就需要跳转
     [self.navigationController pushViewController:detailVC animated:YES];
    
    
    
}


#pragma mark 点击推荐，手势进行跳转
-(void)sendGesture:(home_recommend_subjectsTableViewCell *)home_recomment_subjects gesture:(UITapGestureRecognizer *)gesture
{
    //试试看
    detailsViewController*detailVC=[[detailsViewController alloc]init];
    
#pragma mark 现在可以实现跳转隐藏了，之前  ，着两个办法都是加人家本身控制器，隐藏的就是它自己最下边的，，，，能有用麼？？虽然现在实现了，，但是也要注意，如果还需要从下边导航push到第三个界面还需要tabbar，那就要小心不出来的了。
    //self.tabBarController.hidesBottomBarWhenPushed=YES;
    //detailVC.tabBarController.hidesBottomBarWhenPushed=YES;
   
    
    detailVC.hidesBottomBarWhenPushed=YES;
    
    
    
    [self.navigationController pushViewController:detailVC animated:YES];

    
    
}










-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
