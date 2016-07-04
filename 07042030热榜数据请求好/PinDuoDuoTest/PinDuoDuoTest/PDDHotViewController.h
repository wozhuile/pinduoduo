//
//  PDDHotViewController.h
//  PinDuoDuoTest
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "rankVIew.h"

#import "HotTool.h"
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

#pragma mark 声明变量，代表滚动滑动页数
@property(nonatomic,assign)NSInteger pageCount;

#pragma mark 数组数据
@property(nonatomic,strong)NSMutableArray*EveryOneBuyArray;

@property(nonatomic,strong)NSMutableArray*NewBuyArray;

#pragma mark 纪录按钮tag
@property(nonatomic,assign)NSInteger buttonTagCount;

@property(nonatomic,strong) HotTool*hot;

@property(nonatomic,assign)NSInteger requestCount;


#pragma mark 存放集合视图对象，for循环创建哪怕是属性，也会保留最后一个，，也是前边遇到的很多的tag问题，试试看吧
@property(nonatomic,strong)NSMutableArray*collectionArray;


@end
