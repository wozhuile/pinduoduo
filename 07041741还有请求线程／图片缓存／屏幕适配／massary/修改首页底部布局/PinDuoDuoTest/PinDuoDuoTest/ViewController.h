//
//  ViewController.h
//  PinDuoDuoTest
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>



#pragma mark   顶部图片传过来，要接受，需要全局变量，也要保证不被提前释放  ,声明成属性
#import "MainView.h"
#import "NetWorkRequestModel.h"


@interface ViewController : UIViewController

{
    NSInteger countSum;
}


#pragma mark 底部滚动视图
//@property(nonatomic,retain)UIScrollView*buttomScrollview;

@property(nonatomic,strong)MainView*mainView;
@property(nonatomic,strong)NetWorkRequestModel*netModel;

#pragma mark  数据数组建立
//home_super_brand 超值大牌的数组
@property(nonatomic,retain)NSMutableArray*home_super_brandArray;
//goods_list 的数组，也就是数据最多的那个数据数组

@property(nonatomic,retain)NSMutableArray*goods_listArray;
//home_recommend_subjects  查查看类数组
@property(nonatomic,retain)NSMutableArray*home_recommend_subjectsArray;

//总数据数组
@property(nonatomic,retain)NSMutableArray*dataArray;


@property(nonatomic,retain)NSMutableArray*recommentArray;

#pragma mark 推荐的position数组
@property(nonatomic,retain)NSMutableArray*recommentPositionArray;

@property(nonatomic,assign)NSInteger HomePositionSum;




#pragma mark 创建table表
@property(nonatomic,strong)UITableView*buttomDataTableView;

#pragma mark position 处理数据插入，先记录，后边有时间在来优化纪录方式
@property(nonatomic,assign)NSInteger home_recommend_subjectsPosition;

@property(nonatomic,assign)NSInteger home_super_brandPosition;



#pragma mark page
@property(nonatomic,assign)NSInteger CountNumber;

@property(nonatomic,strong)NSMutableArray*totalarray;


#pragma mark 第一区顶部图片
@property(nonatomic,strong)NSMutableArray*topScrollArray;


@end

