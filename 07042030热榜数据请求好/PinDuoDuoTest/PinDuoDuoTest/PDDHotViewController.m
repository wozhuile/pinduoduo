//
//  PDDHotViewController.m
//  PinDuoDuoTest
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "PDDHotViewController.h"

#import "rankVIew.h"
#import "HotCollectionViewCell.h"
static NSString*cellID=@"cell";

#import <UIImageView+WebCache.h>

#import "HotTool.h"


#import "EveryOneBuyModle.h"
#import "EveryOneGoodsList.h"
#import "EveryOneGroup.h"


#import "NewBuyMessageModle.h"
#import "NewGoodsList.h"
#import "NewGroup.h"


#pragma mark 刷新
#import <MJRefresh.h>


@interface PDDHotViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,rankVIewDelegate,UIScrollViewDelegate,HotToolDelegate>

@end

@implementation PDDHotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _buttonTagCount=0;
    _pageCount=0;

    _everyCount=1;
    
#pragma mark 设置一开始是1也不行啊，，，每次点击就回头了。。
    _oneCount=0;
    _ScrollCount=0;
    
    
    
    //初始化数组
    _dataArray=[[NSMutableArray alloc]init];
    _EveryOneBuyArray=[[NSMutableArray alloc]init];
    _NewBuyArray=[[NSMutableArray alloc]init];

    _collectionArray=[[NSMutableArray alloc]init];
     _rankVC=[[rankVIew alloc]initWithFrame:self.view.frame];
    
    _Every_NewArray=[[NSMutableArray alloc]init];
    _New_NewArray=[[NSMutableArray alloc]init];
#pragma mark 遵循代理，把按钮传出来
    _rankVC.delegate=self;
    
    [self.view addSubview:_rankVC];
    
    
    [self CreateScrollView];
    
#pragma mark 导入工具类了，。创建对象，调用方法进行网络请求，并且代理设置，接受数据
   _hot=[[HotTool alloc]init];
    
    
    _hot.delegate=self;
    
 
#pragma mark 为什么没有效果？？对象释放了？  还没有创建麼？就保留最后一个，我需要去for循环保留集合哪里取出来？  试试看..如果海没有，，应该不出来的。。但是代码先后应该有了
    UICollectionView*conll=[_collectionArray objectAtIndex:0];
    
    
    conll.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        _everyCount=1;
        
        [_hot CreateEveryOneBuyRequest:@"http://apiv2.yangkeduo.com/v2/ranklist?page=1&size=50"];
        
//         [_hot CreateEveryOneBuyRequest:[NSString stringWithFormat: @"http://apiv2.yangkeduo.com/v2/ranklist?page=%ld&size=50",(long)_everyCount]];
    } ];
    
    [conll.header beginRefreshing];

    
    conll.footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        _everyCount++;
        
        [_hot CreateEveryOneBuyRequest:[NSString stringWithFormat: @"http://apiv2.yangkeduo.com/v2/ranklist?page=%ld&size=50",(long)_everyCount]];
    }];
    
    [conll.footer endRefreshing];
 
  
  
//  [_hot CreateEveryOneBuyRequest:@"http://apiv2.yangkeduo.com/v2/ranklist?page=1&size=50"];

  
  
  
  
  //[_hot CreateNewBuyRequest:@"http://apiv2.yangkeduo.com/v3/newlist?page=1&size=50"];
    
}


#pragma mark 实现代理方法  大家都在买  创建数组接受数据
-(void)SendEveryOneBuy:(HotTool *)hotTool dataArray:(NSMutableArray *)dataArray withCount:(NSInteger)count
{
    
    _EveryOneBuyArray=dataArray;
   // _requestCount=count;
    
    
    
#pragma mark 追加数据直接用之前的数组可以麼？试试看
    /*-[__NSArrayI addObjectsFromArray:]: unrecognized selector sent to instance 0x7f968597b640
     2016-07-04 20:59:11.866 PinDuoDuoTest[5269:147492] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[__NSArrayI addObjectsFromArray:]: unrecognized selector sent to instance 0x7f968597b640'
*///直接追加后果 NSInvalidArgumentException说是参数异常  创建数组试试吧  ,是不是第一次就加了两次？？
   // [_EveryOneBuyArray addObjectsFromArray:_EveryOneBuyArray];
    
//    
//    if (_everyCount==1) {
//        [_Every_NewArray setArray:_EveryOneBuyArray];
//         [_dataConllection.header endRefreshing];
//        
//    }
//    
//    else
//    {
//    [_Every_NewArray addObjectsFromArray:_EveryOneBuyArray];
//        [_dataConllection.footer endRefreshing];
//        

   // }
   // [_dataConllection.header endRefreshing];
    //[_dataConllection.footer endRefreshing];
    
    
#pragma mark 记得刷新表，。。。否则没用   两个都刷新？？？
 
    UICollectionView*collection=[_collectionArray objectAtIndex:0];
    
#pragma mark 找到对应的在刷新，，不要用全局
    
    if (_everyCount==1) {
        [_Every_NewArray setArray:_EveryOneBuyArray];
        [collection.header endRefreshing];
        
    }
    
    else
    {
        [_Every_NewArray addObjectsFromArray:_EveryOneBuyArray];
        [collection.footer endRefreshing];
        
    }
    
    
    
    [collection reloadData ];
     
}
-(void)failTogetEveryOnebuy:(HotTool *)hotTool error:(NSError *)error
{
    NSLog(@"大家都在买error=%@",error);
    
}
#pragma mark  最新
-(void)sendNewBuy:(HotTool *)hotTool dataArray:(NSMutableArray *)dataArray
{
       _NewBuyArray=dataArray;
    
    
#pragma mark 追加数组
    //[_NewBuyArray addObjectsFromArray:_NewBuyArray];
    
//    
//    if (_oneCount==1||_ScrollCount==1) {
//        
//        
//        [_New_NewArray setArray:_NewBuyArray];//??dataArray
//        [_dataConllection.header endRefreshing];
//
//    }
//    
//    else
//    {
//    
//    [_New_NewArray addObjectsFromArray:_NewBuyArray];
//        [_dataConllection.footer endRefreshing];
//    }
    //[_dataConllection.header endRefreshing];
    
    
    
#pragma mark 记得刷新表，。。。否则没用
    //[_dataConllection reloadData ];
    
    UICollectionView*collection=[_collectionArray objectAtIndex:1];
    
    
    
    if (_oneCount==1||_ScrollCount==1) {
        
        
        [_New_NewArray setArray:_NewBuyArray];//??dataArray
        [collection.header endRefreshing];
        
    }
    
    else
    {
        
        [_New_NewArray addObjectsFromArray:_NewBuyArray];
        [collection.footer endRefreshing];
    }

    
    
    [collection reloadData ];

    
}
-(void)failTogetNewbuy:(HotTool *)hotTool error:(NSError *)error
{
    NSLog(@"最新error=%@",error);
}

#pragma mark scrollview
-(void)CreateScrollView
{
 
    _choiceScroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 103, self.view.frame.size.width,577)];
  
     _choiceScroll.contentSize=CGSizeMake(self.view.frame.size.width*2, CGRectGetMaxY(_rankVC.slideView.frame));
    //_choiceScroll.backgroundColor=[UIColor redColor];
    
    
    
#pragma mark 代理没设置，方法都没用调用！！！
    _choiceScroll.delegate=self;
      _choiceScroll.bounces=NO;
    
    
    
    _choiceScroll.showsHorizontalScrollIndicator=YES;
    _choiceScroll.showsVerticalScrollIndicator=YES;
    
    _choiceScroll.pagingEnabled=YES;
    
    [_rankVC addSubview:_choiceScroll];
    
#pragma mark 把集合视图放到上边，，布局是一样的就不需要多个控制器了，，如果布局不一样，就需要不同控制器了，？？   后边的那些数据资源，就在点击按钮的时候在请求，在获得数据，在发送各自的URL吧，，然后刷新。
    for (int i=0; i<2; i++) {
        
        [self CreateCollectionVIew:i];
    }
    
    
}


#pragma mark 集合视图
-(void)CreateCollectionVIew:(NSInteger)sender
{
    UICollectionViewFlowLayout*flowlayout=[[UICollectionViewFlowLayout alloc]init];

    flowlayout.itemSize=CGSizeMake(self.view.frame.size.width-10, 180);
    flowlayout.minimumInteritemSpacing=5;
    flowlayout.scrollDirection=UICollectionViewScrollDirectionVertical;
    flowlayout.minimumLineSpacing=5;
    
    
    _dataConllection=[[UICollectionView alloc]initWithFrame:CGRectMake(sender*self.view.frame.size.width, 0, CGRectGetWidth(_choiceScroll.frame), CGRectGetHeight(_choiceScroll.frame)) collectionViewLayout:flowlayout];
    
    _dataConllection.backgroundColor=[UIColor whiteColor];
#pragma mark 去掉这个颜色居然是黑色的了。。。 上边不添加这个集合的时候还是红色的，添加后是黑色的了。
    //判断试试看
//    if (sender==0) {
//        _dataConllection.backgroundColor=[UIColor orangeColor];
//    }
//    else {
//    _dataConllection.backgroundColor=[UIColor yellowColor];
//    }
    
#pragma mark 创建对象，保留不了第一个，，来这里试试看  实现了！！！，但是请求没有结束啊。。怎么回事？？？
    
//    if (sender==0) {
//        _dataConllection.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
//            _everyCount=1;
//            
//            [_hot CreateEveryOneBuyRequest:@"http://apiv2.yangkeduo.com/v2/ranklist?page=1&size=50"];
//            
//            //         [_hot CreateEveryOneBuyRequest:[NSString stringWithFormat: @"http://apiv2.yangkeduo.com/v2/ranklist?page=%ld&size=50",(long)_everyCount]];
//        } ];
//        
//        [_dataConllection.header beginRefreshing];
//        
//        
//        _dataConllection.footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//            _everyCount++;
//            
//            [_hot CreateEveryOneBuyRequest:[NSString stringWithFormat: @"http://apiv2.yangkeduo.com/v2/ranklist?page=%ld&size=50",(long)_everyCount]];
//        }];
//        
//        [_dataConllection.footer endRefreshing];
//        
//
//    }
//    
    
    
    
    _dataConllection.delegate=self;
    _dataConllection.dataSource=self;
    
    
#pragma mark 放到滚动视图上?
    [_choiceScroll addSubview:_dataConllection];
    
   
    
#pragma mark 保存集合视图
    [_collectionArray addObject:_dataConllection];
    
    
    
#pragma mark 还是需要用这个xib。。
    [_dataConllection registerNib:[UINib nibWithNibName:@"HotCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:cellID];

}
#pragma mark collection  datasource and delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
 #pragma mark 数据源不同，那就判断着来做
    if (_pageCount==0&&_buttonTagCount==0) {
        
#pragma mark 一开始就进来返回0个cell了。。应该在加条件，可以去请求哪里传个条件过来，比如requestcount＝88；然后就是先设置固定值,,两个数据源在同一个控制器真心难处理 啊,还不如分开写两个了。。或者写两个继承这个的子类，，
      
        return _Every_NewArray.count;
    }
    else
    {
    return _New_NewArray.count;
    }
    //return 50;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    HotCollectionViewCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];//看起来都没错。运行就崩溃。。就是这里，，好像海没有办法。。还必须注册了，，在看看吧。。
#pragma mark 注册了还需要写这个
    if (cell==nil) {
        cell=[[HotCollectionViewCell alloc]init];
    }
    
#pragma mark 其实能不能用id 然后类型判断是哪个类型就布局？？
    if (_pageCount==0&&_buttonTagCount==0) {
        //EveryOneGoodsList*model=[_EveryOneBuyArray objectAtIndex:indexPath.row];
#pragma mark  注意修改啊！！！！！
        
        
        
        
        EveryOneGoodsList*model=[_Every_NewArray objectAtIndex:indexPath.row];
        [cell.showDataImage sd_setImageWithURL:[NSURL URLWithString:model.hdThumbUrl] placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];
        cell.goods_Name.text=model.goodsName;
        cell.goods_Name.font=[UIFont systemFontOfSize:12];
        
#pragma mark  苹果的要求 如果超过一万件，书写就要改变  反正先搞整形吧
        cell.orderCnt.text=[NSString stringWithFormat:@"%d",(int)model.cnt];
        
        cell.orderCnt.font=[UIFont systemFontOfSize:14];
        
     
        cell.pricelabel.text=[NSString stringWithFormat:@"$%.2f",model.group.price/100];
        
        

        
        cell.pricelabel.textColor=[UIColor redColor];
        //cell.pricelabel.font=[UIFont systemFontOfSize:13];
         cell.indexSum.text=[NSString stringWithFormat:@"%ld", (long)indexPath.row+1];
        
        //cell.backgroundColor=[UIColor purpleColor];
        return cell;
        
    }
    else
    {
        
       // NewGoodsList*Model=[_NewBuyArray objectAtIndex:indexPath.row];

    NewGoodsList*Model=[_New_NewArray objectAtIndex:indexPath.row];
    [cell.showDataImage sd_setImageWithURL:[NSURL URLWithString:Model.hdThumbUrl] placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];
    cell.goods_Name.text=Model.goodsName;
    
#pragma mark 最新是有时间的，，cell就这里不一样，但是现在没见给数据，，所以就用同一个的了。会不会导致数据重用问题？？？？？？？？  有时间，，，醉了。。先试试看先吧。
        
    cell.goods_Name.font=[UIFont systemFontOfSize:12];
#pragma mark 最新这里还有个发布时间没有处理
    //cell.orderCnt.text=[NSString stringWithFormat:@"%f",Model.cnt];
    cell.pricelabel.text=[NSString stringWithFormat:@"$%.2f",Model.group.price/100];
    cell.pricelabel.textColor=[UIColor redColor];
        
        
        
        
    cell.indexSum.text=[NSString stringWithFormat:@"%ld", (long)indexPath.row+1];
        
        
   // cell.backgroundColor=[UIColor redColor];
    return cell;

    
    }
 
}




-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    

    self.navigationItem.title=@"排行榜";
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:225/256.0 green:225/256.0 blue:225/256.0 alpha:1.0];
}


#pragma mark 处理点击按钮滚动和滚动按钮也滑动。。。首先先去把按钮传出来  代理

//遵循了代理。实现按钮传出来方法
-(void)sendButton:(rankVIew *)rankView button:(UIButton *)button
{
    
#pragma mark 请求的时候就第一个请求就好了。。然后点击在请求，其他的滑动什么的在刷新吧，，先这样
    
       UICollectionView*collection=[_collectionArray objectAtIndex:1];
    
    
#pragma mark bug 就是每次点击就会重新请求，这个药保证一次，，，那就用刚刚那个_oneCount吧。。试试看  ，没改之前if (button.tag==111)  注意，一开始的时候就是0啊。。。
    
    if (button.tag==111) {
#pragma mark 注意这里加起来的会导致下边活动也刷了
       // _oneCount=1;
        
        if (_oneCount<=1) {
            collection.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
                
#pragma 不要写在外边
                _oneCount=1;
                
                [_hot CreateNewBuyRequest:@"http://apiv2.yangkeduo.com/v3/newlist?page=1&size=50"];
            }];
            
            
            
            [collection.header beginRefreshing];
        }
//        collection.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
//            
//#pragma 不要写在外边
//            _oneCount=1;
//
//          [_hot CreateNewBuyRequest:@"http://apiv2.yangkeduo.com/v3/newlist?page=1&size=50"];
//        }];
//        
//        
//        
//        [collection.header beginRefreshing];
        //[_hot CreateNewBuyRequest:@"http://apiv2.yangkeduo.com/v3/newlist?page=1&size=50"];
   

        
        collection.footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            _oneCount++;
            
            [_hot CreateNewBuyRequest:[NSString stringWithFormat:@"http://apiv2.yangkeduo.com/v3/newlist?page=%ld&size=50",(long)_oneCount++]];
        }];
        
        [collection.footer endRefreshing];

        
    }
    
    
    
    
    
    
    
    
//    if (button.tag==110) {
//         [_hot CreateEveryOneBuyRequest:@"http://apiv2.yangkeduo.com/v2/ranklist?page=1&size=50"];
//    }
    
#pragma mark 记得剪掉110
    _buttonTagCount=button.tag-110;
    

    _choiceScroll.contentOffset=CGPointMake((button.tag-110)*CGRectGetWidth(_choiceScroll.frame), 0);//是实现点击滑动了，，但是呢，，，集合视图不见了。
    [_choiceScroll setContentOffset:CGPointMake((button.tag-110)*CGRectGetWidth(_choiceScroll.frame), 0) animated:YES];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    
    
      UICollectionView*collection=[_collectionArray objectAtIndex:1];
    
    _pageCount=scrollView.contentOffset.x/_rankVC.frame.size.width;
 #pragma mark 要保证请求一次就可以了。。滚动的时候不请求，，下拉上啦在请求，，！！
    
#pragma mark 滑动就请求一次就好...怎么保证啊？？
    if (_pageCount==1) {
//        _ScrollCount=1;
        if (_ScrollCount<=1) {
            
            collection.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
                _ScrollCount=1;
                [_hot CreateNewBuyRequest:@"http://apiv2.yangkeduo.com/v3/newlist?page=1&size=50"];
            }];
            
            
            
            [collection.header beginRefreshing];
        }
        
//        collection.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
//             _ScrollCount=1;
//            [_hot CreateNewBuyRequest:@"http://apiv2.yangkeduo.com/v3/newlist?page=1&size=50"];
//        }];
//        
//        
//        
//        [collection.header beginRefreshing];
        //[_hot CreateNewBuyRequest:@"http://apiv2.yangkeduo.com/v3/newlist?page=1&size=50"];
        
        
        collection.footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            _ScrollCount++;
            
            [_hot CreateNewBuyRequest:[NSString stringWithFormat:@"http://apiv2.yangkeduo.com/v3/newlist?page=%ld&size=50",(long)_ScrollCount++]];
        }];
        
        [collection.footer endRefreshing];

    
    
    }
    
//    if (_pageCount==0) {
//         [_hot CreateEveryOneBuyRequest:@"http://apiv2.yangkeduo.com/v2/ranklist?page=1&size=50"];
//    }
    
    
    
    UIButton*button=[_rankVC viewWithTag:_pageCount+110];
    
    NSLog(@"%ld",(long)button.tag);
  
    button.frame=CGRectMake(_pageCount*_rankVC.frame.size.width/2, 0, _rankVC.frame.size.width/2, 37 );

    UIView*slideView=[_rankVC viewWithTag:99];
    
    [UIView animateWithDuration:0.25 animations:^{

    slideView.center=CGPointMake(_pageCount*_rankVC.frame.size.width*2/5+125, 38);
    }];
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isKindOfClass:[UICollectionView class]]) {
      
    }
    else {
    }
}




@end
