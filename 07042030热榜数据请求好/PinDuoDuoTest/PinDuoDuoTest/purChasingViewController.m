//
//  purChasingViewController.m
//  PinDuoDuoTest
//
//  Created by mac on 16/7/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "purChasingViewController.h"
#import "purChaseCollectionViewCell.h"
#import "puchaseModle.h"
static NSString*cellID=@"cell";
#import <UIImageView+WebCache.h>


#import <MJRefresh.h>

#import "PURCHARSGoods.h"



@interface purChasingViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,puchaseModleDelegate>

@end

@implementation purChasingViewController



- (void)viewDidLoad {
    [super viewDidLoad];
     self.title=@"每日秒杀";
    
    
    
    _dataArray=[[NSMutableArray alloc]init];
    
#pragma mark 设置左边的按钮，就看不到那个拼多多商场文字，，但是返回的时候有点小bug，就是还会看到一些些拼多多文字。。
    UIBarButtonItem*item=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(backButon)];
    self.navigationItem.leftBarButtonItem=item;
    
    //purChaseCollectionViewCell*purChase=[[purChaseCollectionViewCell alloc]init];
    [self CreateCollectionVIew];

    //创建对象，准备接受数据
   _modle=[[puchaseModle alloc]init];
    _modle.delegate=self;
    
//    //TODO请求数据
//    [modle purchaseDataRequest:@"http://apiv2.yangkeduo.com/spike_list?page=1&size=50"];
    
    
    //[self CreateCollectionVIew];
    
    
    
}

//实现请求方法
-(void)successToGetPurChaseData:(puchaseModle *)netWorkRequestModel array:(NSMutableArray *)array
{
    
   
    _dataArray=array;
    
    //刷新
    [_dataConllection reloadData];
    
    
}
-(void)failToGetPurChaseData:(puchaseModle *)netWorkRequestModel error:(NSError *)error

{
    NSLog(@"purchase=%@",error);
}


-(void)backButon
{
    [self.navigationController popViewControllerAnimated:YES];
    //NSLog(@"---");
}
#pragma mark 操作返回按钮的文字
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    //TODO请求数据
    [_modle purchaseDataRequest:@"http://apiv2.yangkeduo.com/spike_list?page=1&size=50"];
    
    
   // [self.navigationItem.backBarButtonItem setTitle:@""];
    
    
    
    
    
    
    //[self.navigationController.navigationBar.backItem setHidesBackButton:YES];
    
    //UIBarButtonItem*item=[[UIBarButtonItem alloc]init];
    //item.title=@"oooo";
    //self.navigationItem.backBarButtonItem=item;
    /*隐藏导航条的返回按钮
     字数37 阅读0 评论0 喜欢0
     隐藏导航栏的返回按钮
     
     [self.navigationController.navigationItem setHidesBackButton:YES];
     
     [self.navigationItem setHidesBackButton:YES];
     
     [self.navigationController.navigationBar.backItem setHidesBackButton:YES];
     
     另类做法
     
     [self.navigationItem.backBarButtonItem setTitle:@""];
     
     推荐拓展阅读
     著作权归作者所有
     如果觉得我的文章对您有用，请随意打赏。您的支持将鼓励我继续创作！*/
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //[_modle purchaseDataRequest:@"http://apiv2.yangkeduo.com/spike_list?page=1&size=50"];

    
    
}

-(void)CreateCollectionVIew
{
    UICollectionViewFlowLayout*flowlayout=[[UICollectionViewFlowLayout alloc]init];
    
    flowlayout.itemSize=CGSizeMake(self.view.frame.size.width-10, 180);
    flowlayout.minimumInteritemSpacing=2;
    flowlayout.scrollDirection=UICollectionViewScrollDirectionVertical;
    flowlayout.minimumLineSpacing=2;
    
    
    
    _dataConllection=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) collectionViewLayout:flowlayout];
    
    _dataConllection.backgroundColor=[UIColor greenColor];

    
    
    
    _dataConllection.delegate=self;
    _dataConllection.dataSource=self;
    
    

    [self.view addSubview:_dataConllection];
    
    
 
    
#pragma mark 还是需要用这个xib。。
    [_dataConllection registerNib:[UINib nibWithNibName:@"purChaseCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:cellID];

    
}
#pragma mark collection  datasource and delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
#pragma mark  return 50; 之前为了先看看是不是创建成功cell，就写来一个固定的值，50来实验，但是在进行网络请求的时候，没有进行修改，每次运行都说数组是空的，如果不在cell哪里用数组布局的话，代码会回去在此请求获得请求数据（block回调），那就不会崩溃，，如果这里用_dataArray.count 也就是用到了数组，调用了数组，就会直接进行请求获得数据了。就不会崩溃
    //return 50;
    return _dataArray.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
// static NSString*cellID=@"cell";
#pragma mark 注意要进行注册  否则崩溃
    /*
     2016-07-05 20:29:58.102 PinDuoDuoTest[10701:328708] *** Assertion failure in -[UICollectionView _dequeueReusableViewOfKind:withIdentifier:forIndexPath:viewCategory:], /BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3512.30.14/UICollectionView.m:3690
     2016-07-05 20:29:58.396 PinDuoDuoTest[10701:328708] *** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'could not dequeue a view of kind: UICollectionElementKindCell with identifier cell - must register a nib or a class for the identifier or connect a prototype cell in a storyboard'
//*/
//    UICollectionViewCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
//    if (cell==nil) {
//        cell=[[UICollectionViewCell alloc]init];
//    }
   
    
    
    purChaseCollectionViewCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
   // if (cell==nil) {
     //   cell=[[purChaseCollectionViewCell alloc]init];
    //}
    
    PURCHARSGoods*goods=[_dataArray objectAtIndex:indexPath.row];
    
    [cell.thumb_url sd_setImageWithURL:[NSURL URLWithString:goods.thumbUrl] placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];

    
    
    cell.price.text=[NSString  stringWithFormat:@"%ld",(long)indexPath.row ];
    
    
    cell.backgroundColor=[UIColor redColor];
    
    return cell;
    
}





@end
