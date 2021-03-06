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



@interface PDDHotViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,rankVIewDelegate,UIScrollViewDelegate,HotToolDelegate>

@end

@implementation PDDHotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _buttonTagCount=0;
    _pageCount=0;
    
    //self.view.backgroundColor=[UIColor whiteColor];
    //self.automaticallyAdjustsScrollViewInsets=YES;
    //初始化数组
    _dataArray=[[NSMutableArray alloc]init];
    _EveryOneBuyArray=[[NSMutableArray alloc]init];
    _NewBuyArray=[[NSMutableArray alloc]init];
    
    
   // _rankTableView=[UITableView alloc]ini;
    
    
     _rankVC=[[rankVIew alloc]initWithFrame:self.view.frame];
    
    
    
#pragma mark 遵循代理，把按钮传出来
    _rankVC.delegate=self;
    
    
    //[self.view addSubview:_rankVC];
    
    //[self CreateCollectionVIew];
//    [self.view addSubview:_rankVC];
    
      [self.view addSubview:_rankVC];
    
       [self CreateScrollView];
    
      //[self CreateCollectionVIew];

    
   
#pragma mark 导入工具类了，。创建对象，调用方法进行网络请求，并且代理设置，接受数据
   _hot=[[HotTool alloc]init];
    
    
      _hot.delegate=self;
    
    //[_hot CreateNewBuyRequest:@"http://apiv2.yangkeduo.com/v3/newlist?page=1&size=50"];
    //if (_buttonTagCount==0||_pageCount==0) {
        
          [_hot CreateEveryOneBuyRequest:@"http://apiv2.yangkeduo.com/v2/ranklist?page=1&size=50"];
   // }
    
    //[_hot CreateEveryOneBuyRequest:@"http://apiv2.yangkeduo.com/v2/ranklist?page=1&size=50"];//注意要字符串拼接的时候，刷新要注意的
    
#pragma mark 问题来了。。现在创建两个数组来接受数据？怎么操作？是一开始就一起请求了？还是一开始就先进来的是大家都在买，，然后再点击决定加载那个？？再决定请求那个？？看效果本来就是第一次进来就是大家都在买。。如果点击最新了，再点击其他回来还是展示最新，也就是说应该是点击了在请求，那么问题也来了。。点击就请求？那不是每次都请求一次？刷新的时候要注意了。。。不要随便让一会page加1，。。先请求一个吧。。，数据源不要处理啊同一个控制器，，。。根据按钮点击tag值或者滚动的page来吧。。应该在这里写也可以的，，那就接受下tag和滚动page？？好吧，，接受了来这里判断。。//
    
    
    //if (_buttonTagCount==1||_pageCount==1) {
        
    //}
   //[_hot CreateNewBuyRequest:@"http://apiv2.yangkeduo.com/v3/newlist?page=1&size=50"];
    
 
    
    
    
    
}


#pragma mark 实现代理方法  大家都在买  创建数组接受数据
-(void)SendEveryOneBuy:(HotTool *)hotTool dataArray:(NSMutableArray *)dataArray withCount:(NSInteger)count
{
    
    self.EveryOneBuyArray=dataArray;
    _requestCount=count;
    
#pragma mark 记得刷新表，。。。否则没用
    [_dataConllection reloadData ];
     
}
-(void)failTogetEveryOnebuy:(HotTool *)hotTool error:(NSError *)error
{
    NSLog(@"大家都在买error=%@",error);
    
}
#pragma mark  最新
-(void)sendNewBuy:(HotTool *)hotTool dataArray:(NSMutableArray *)dataArray
{
    self.NewBuyArray=dataArray;
    
#pragma mark 记得刷新表，。。。否则没用
    [_dataConllection reloadData ];
}
-(void)failTogetNewbuy:(HotTool *)hotTool error:(NSError *)error
{
    NSLog(@"最新error=%@",error);
}

#pragma mark scrollview
-(void)CreateScrollView
{
   // _choiceScroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_rankVC.slideView.frame)+64, self.view.frame.size.width,self.view.frame.size.height-CGRectGetMaxY(_rankVC.slideView.frame)-120)];//44是标签的 120勉强可以滑动下边看到。翻页效果。。目前就这样先吧
   
#pragma mark 下边一点击就不见集合视图啦。现在不把滚动和集合放到rankview上试试，就放到view上，位置调整下,之前相对位置，可以先去输出看看的,然后就可以相对view来说了
    //NSLog(@"%f",CGRectGetMaxY(_rankVC.slideView.frame)+64);//输出是103
   // NSLog(@"%f",self.view.frame.size.height-CGRectGetMaxY(_rankVC.slideView.frame)-120);/／输出是577
    
    
    _choiceScroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 103, self.view.frame.size.width,577)];
    
    _choiceScroll.contentSize=CGSizeMake(self.view.frame.size.width*2, self.view.frame.size.height-CGRectGetMaxY(_rankVC.slideView.frame)-120);
    _choiceScroll.backgroundColor=[UIColor redColor];
    
    
    
#pragma mark 代理没设置，方法都没用调用！！！
    _choiceScroll.delegate=self;
    
    
    
    
    _choiceScroll.showsHorizontalScrollIndicator=YES;
    _choiceScroll.showsVerticalScrollIndicator=YES;
    
    _choiceScroll.pagingEnabled=YES;
    
    [_rankVC addSubview:_choiceScroll];
    
    //[self.view addSubview:_choiceScroll];
    
    _choiceScroll.bounces=NO;
    
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
    
    
#pragma mark 去掉这个颜色居然是黑色的了。。。
    _dataConllection.backgroundColor=[UIColor whiteColor];
    
    _dataConllection.delegate=self;
    _dataConllection.dataSource=self;
    
    //[self.view addSubview:_dataConllection];

    // [self.view addSubview:_rankVC];
    
#pragma mark 放到滚动视图上?
    [_choiceScroll addSubview:_dataConllection];
    
    
    
    
    
    
    //[_dataConllection registerClass:[HotCollectionViewCell class] forCellWithReuseIdentifier:cellID];
    //[_dataConllection registerClass:[HotCollectionViewCell class] forCellWithReuseIdentifier:cellID];
#pragma mark 还是需要用这个xib。。
    [_dataConllection registerNib:[UINib nibWithNibName:@"HotCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:cellID];

}
#pragma mark collection  datasource and delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
//    if (_EveryOneBuyArray.count==0) {
//        return 50;
//    }
//    
    
#pragma mark 数据源不同，那就判断着来做
    if (_pageCount==0&&_buttonTagCount==0) {
        
#pragma mark 一开始就进来返回0个cell了。。应该在加条件，可以去请求哪里传个条件过来，比如requestcount＝88；然后就是先设置固定值,,两个数据源在同一个控制器真心难处理 啊,还不如分开写两个了。。或者写两个继承这个的子类，，
      
        return _EveryOneBuyArray.count;
    }
    else
    {
    return _NewBuyArray.count;
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
        
        EveryOneGoodsList*model=[_EveryOneBuyArray objectAtIndex:indexPath.row];
        [cell.showDataImage sd_setImageWithURL:[NSURL URLWithString:model.hdThumbUrl] placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];
        cell.goods_Name.text=model.goodsName;
        cell.orderCnt.text=[NSString stringWithFormat:@"%f",model.cnt];
        cell.pricelabel.text=[NSString stringWithFormat:@"$%.2f",model.group.price/100];
        cell.pricelabel.textColor=[UIColor redColor];
        
        
    }
    else
    {
    NewGoodsList*Model=[_NewBuyArray objectAtIndex:indexPath.row];
    [cell.showDataImage sd_setImageWithURL:[NSURL URLWithString:Model.hdThumbUrl] placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];
    cell.goods_Name.text=Model.goodsName;
    
#pragma mark 最新是有时间的，，cell就这里不一样，但是现在没见给数据，，所以就用同一个的了。会不会导致数据重用问题？？？？？？？？  有时间，，，醉了。。先试试看先吧。
    //cell.orderCnt.text=[NSString stringWithFormat:@"%f",Model.cnt];
    cell.pricelabel.text=[NSString stringWithFormat:@"$%.2f",Model.group.price/100];
        cell.pricelabel.textColor=[UIColor redColor];
        

    
    }
    
    //HotCollectionViewCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
//    if (cell==nil) {
//       NSArray*array= [[NSBundle mainBundle]loadNibNamed:@"HotCollectionViewCell" owner:nil options:nil];
//        
//        HotCollectionViewCell
//        
//    }
    
    
    //[cell.showDataImage sd_setImageWithURL: placeholderImage:];
    
    
    
    cell.indexSum.text=[NSString stringWithFormat:@"%ld", (long)indexPath.row+1];
    
    //cell.backgroundColor=[UIColor colorWithRed:arc4random()%255/256.0 green:arc4random()%255/256.0  blue:arc4random()%255/256.0  alpha:1.0];
    
    return cell;
}




-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // self.navigationItem.title=@"#wewqe#";
    
#pragma mark 背景颜色和条颜色区别！
    // self.navigationController.navigationBar.backgroundColor=[UIColor grayColor];
    self.navigationItem.title=@"排行榜";
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:225/256.0 green:225/256.0 blue:225/256.0 alpha:1.0];
}


#pragma mark 处理点击按钮滚动和滚动按钮也滑动。。。首先先去把按钮传出来  代理

//遵循了代理。实现按钮传出来方法
-(void)sendButton:(rankVIew *)rankView button:(UIButton *)button
{
    
    
#pragma mark 记得剪掉110
    _buttonTagCount=button.tag-110;
    
    
    if (_buttonTagCount==0&&_pageCount==0) {
        
        //[_hot CreateEveryOneBuyRequest:@"http://apiv2.yangkeduo.com/v2/ranklist?page=1&size=50"];
        return;
    }

    
    [_hot CreateNewBuyRequest:@"http://apiv2.yangkeduo.com/v3/newlist?page=1&size=50"];
    
    
    
#pragma mark 根据按钮tag。赋值滚动的偏移量;
    

#pragma mark 在热榜那里，我是把按钮传出来了，集合视图的什么都做好了。滑动集合视图都见，但是点击按钮就出来全红的滚动，集合就不见来，，我因为重新创建了对象了！！但是不是，。。。是tag！！！！我前边为了怕找到这个tag，就加来110，，不剪掉就直接在偏移量哪里用tag想乘，能找到集合才怪！！！！
    
    _choiceScroll.contentOffset=CGPointMake((button.tag-110)*CGRectGetWidth(_choiceScroll.frame), 0);//是实现点击滑动了，，但是呢，，，集合视图不见了。
    [_choiceScroll setContentOffset:CGPointMake((button.tag-110)*CGRectGetWidth(_choiceScroll.frame), 0) animated:YES];
    
   // NSLog(@"%s",__func__);
   // NSLog(@"%@",self);
    //NSLog(@"rankView==%@",rankView);
    //NSLog(@"_dataConllection====%@",_dataConllection);
    
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageCount=scrollView.contentOffset.x/_rankVC.frame.size.width;
   // NSLog(@"%ld",(long)_pageCount);
    
    
    
    
#pragma mark 要保证请求一次就可以了。。滚动的时候不请求，，下拉上啦在请求，，！！
    
    if (_buttonTagCount==0||_pageCount==0) {
        
        //[_hot CreateEveryOneBuyRequest:@"http://apiv2.yangkeduo.com/v2/ranklist?page=1&size=50"];
        return;
    }
    
    
    [_hot CreateNewBuyRequest:@"http://apiv2.yangkeduo.com/v3/newlist?page=1&size=50"];
    

    
    
    
    
    
    UIButton*button=[_rankVC viewWithTag:_pageCount+110];
    //button.frame=CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    
    NSLog(@"%ld",(long)button.tag);
    //button.center=CGPointMake(_pageCount*_rankVC.frame.size.width, 80);
    
#pragma mark bug问题.   x我直接成不对了。。。。多来一般。。看视图层都找不到。。
    //button.frame=CGRectMake(_pageCount*_rankVC.frame.size.width, 64, _rankVC.frame.size.width/2, 39 );
    button.frame=CGRectMake(_pageCount*_rankVC.frame.size.width/2, 0, _rankVC.frame.size.width/2, 37 );
    
#pragma mark 实现小滑条滚动了，在创建的时候通过tag标记，，然后再外边只要有那个类对象，就可以找到了。。。tag／／
    
    UIView*slideView=[_rankVC viewWithTag:99];
    
    //slideView.center=CGPointMake(<#CGFloat x#>, <#CGFloat y#>)
    
    
   //slideView.frame=CGRectMake(_pageCount*_rankVC.frame.size.width*2/5+50, 37, _rankVC.frame.size.width*2/5, 2);
    
#pragma mark 都用center比较少bug点  再加个动画吧   注意UI view动画
    [UIView animateWithDuration:0.25 animations:^{
        
        
#pragma mark 有个bug，，那就是一直滚动的话，，小滑条有时候不会跟着滚动了。。是不是runloop？试试看。
        
        
        
        
        slideView.center=CGPointMake(_pageCount*_rankVC.frame.size.width*2/5+125, 38);
    }];
    //slideView.center=CGPointMake(_pageCount*_rankVC.frame.size.width*2/5+125, 38);
    
#pragma mark 这个就给加定时器啊，，  时间缩短到0.25试试。。还是不行，，不知道怎么办好了？？？？是不是这个动画本身问题？
   //[ [NSRunLoop currentRunLoop]addPort: forMode:];
    //[[NSRunLoop currentRunLoop]addTimer:slideView forMode:NSRunLoopCommonModes];
    
    
    
    
    
    
    
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isKindOfClass:[UICollectionView class]]) {
        //NSLog(@"------是列表---");
        //_buttomDataTableView.scrollEnabled=NO;
        //_choiceScroll.scrollEnabled=NO;
        //_dataConllection.scrollEnabled=NO;
    }
    else {
       // NSLog(@"------是滚动试图----");
    }
}




@end
