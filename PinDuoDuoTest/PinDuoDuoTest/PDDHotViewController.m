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
//static NSString*cellID=@"cell";


@interface PDDHotViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation PDDHotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets=YES;
    //初始化数组
    _dataArray=[[NSMutableArray alloc]init];
    
   // _rankTableView=[UITableView alloc]ini;
    
    
     _rankVC=[[rankVIew alloc]initWithFrame:self.view.frame];
    
    //[self.view addSubview:_rankVC];
    
    //[self CreateCollectionVIew];
//    [self.view addSubview:_rankVC];
    
      [self.view addSubview:_rankVC];
      [self CreateCollectionVIew];

    
}


#pragma mark 集合视图
-(void)CreateCollectionVIew
{
    UICollectionViewFlowLayout*flowlayout=[[UICollectionViewFlowLayout alloc]init];

    flowlayout.itemSize=CGSizeMake(self.view.frame.size.width-10, 180);
    flowlayout.minimumInteritemSpacing=5;
    flowlayout.scrollDirection=UICollectionViewScrollDirectionVertical;
    flowlayout.minimumLineSpacing=5;
    
    
    _dataConllection=[[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_rankVC.slideView.frame)+64, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowlayout];
    _dataConllection.backgroundColor=[UIColor greenColor];
    
    _dataConllection.delegate=self;
    _dataConllection.dataSource=self;
    
    [_rankVC addSubview:_dataConllection];

    // [self.view addSubview:_rankVC];
    
    
    //[_dataConllection registerClass:[HotCollectionViewCell class] forCellWithReuseIdentifier:cellID];

}
#pragma mark collection  datasource and delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString*cellID=@"cell";
    UICollectionViewCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];//看起来都没错。运行就崩溃。。就是这里，，好像海没有办法。。还必须注册了，，在看看吧。。
    if (cell==nil) {
        cell=[[UICollectionViewCell alloc]init];
    }
    
    //HotCollectionViewCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
//    if (cell==nil) {
//       NSArray*array= [[NSBundle mainBundle]loadNibNamed:@"HotCollectionViewCell" owner:nil options:nil];
//        
//        HotCollectionViewCell
//        
//    }
    
    //cell.indexSum.text=[NSString stringWithFormat:@"%ld", (long)indexPath.row];   ;
    
    cell.backgroundColor=[UIColor colorWithRed:arc4random()%255/256.0 green:arc4random()%255/256.0  blue:arc4random()%255/256.0  alpha:1.0];
    
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

@end
