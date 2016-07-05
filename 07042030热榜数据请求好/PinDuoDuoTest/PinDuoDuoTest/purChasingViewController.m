//
//  purChasingViewController.m
//  PinDuoDuoTest
//
//  Created by mac on 16/7/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "purChasingViewController.h"
#import "purChaseCollectionViewCell.h"

static NSString*cellID=@"cell";


@interface purChasingViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation purChasingViewController



- (void)viewDidLoad {
    [super viewDidLoad];
     self.title=@"每日秒杀";
    
#pragma mark 设置左边的按钮，就看不到那个拼多多商场文字，，但是返回的时候有点小bug，就是还会看到一些些拼多多文字。。
    UIBarButtonItem*item=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(backButon)];
    self.navigationItem.leftBarButtonItem=item;
    
    
    [self CreateCollectionVIew];
    
    
    
}

-(void)backButon
{
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"---");
}
#pragma mark 操作返回按钮的文字
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationItem.backBarButtonItem setTitle:@""];
    
    
    
    
    
    
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
    return 50;
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
    
    if (cell==nil) {
        cell=[[purChaseCollectionViewCell alloc]init];
    }
    
    
    
    
    return cell;
    
}





@end
