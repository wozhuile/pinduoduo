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

@interface PDDHotViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,rankVIewDelegate,UIScrollViewDelegate>

@end

@implementation PDDHotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.view.backgroundColor=[UIColor whiteColor];
    //self.automaticallyAdjustsScrollViewInsets=YES;
    //初始化数组
    _dataArray=[[NSMutableArray alloc]init];
    
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
    _dataConllection.backgroundColor=[UIColor greenColor];
    
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
    return 50;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    HotCollectionViewCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];//看起来都没错。运行就崩溃。。就是这里，，好像海没有办法。。还必须注册了，，在看看吧。。
#pragma mark 注册了还需要写这个
    if (cell==nil) {
        cell=[[HotCollectionViewCell alloc]init];
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
    NSLog(@"%ld",(long)_pageCount);
    
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
    [UIView animateWithDuration:0.5 animations:^{
        slideView.center=CGPointMake(_pageCount*_rankVC.frame.size.width*2/5+125, 38);
    }];
    //slideView.center=CGPointMake(_pageCount*_rankVC.frame.size.width*2/5+125, 38);
    

    
    
    
    
    
    
    
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
