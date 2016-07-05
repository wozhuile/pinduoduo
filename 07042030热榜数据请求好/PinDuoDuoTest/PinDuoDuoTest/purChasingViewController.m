//
//  purChasingViewController.m
//  PinDuoDuoTest
//
//  Created by mac on 16/7/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "purChasingViewController.h"

@interface purChasingViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation purChasingViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self CreateCollectionVIew];
    
    
    
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
    
    

    

    
}
#pragma mark collection  datasource and delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
 static NSString*cellID=@"cell";
    UICollectionViewCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    if (cell==nil) {
        cell=[[UICollectionViewCell alloc]init];
    }
   
    
    return cell;
    
}





@end
