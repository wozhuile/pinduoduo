//
//  PDDHotViewController.h
//  PinDuoDuoTest
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "rankVIew.h"
@interface PDDHotViewController : UIViewController

@property(nonatomic,strong)rankVIew*rankVC;

#pragma mark 网络连接不了，先大概布局把,先有数据数组和表
@property(nonatomic,retain)NSMutableArray*dataArray;



#pragma mark 表
//@property(nonatomic,strong)UITableView*rankTableView;


#pragma mark collectionView
@property(nonatomic,strong)UICollectionView*dataConllection;

#pragma mark 左右的滚动视图，点击最新或者大家都在买，可以切换全屏，。。还需要把按钮点击事件传出来
@property(nonatomic,strong)UIScrollView*choiceScroll;



@end
