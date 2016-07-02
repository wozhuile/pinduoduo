//
//  PDDRankViewController.h
//  PinDuoDuoTest
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDDRankViewController : UIViewController

#pragma mark 表
@property(nonatomic,strong)UITableView*rankTableView;


#pragma mark 创建3个数组接受传过来的数组
@property(nonatomic,strong)NSMutableArray*promotion_listArray;
@property(nonatomic,strong)NSMutableArray*country_listArray;
@property(nonatomic,strong)NSMutableArray*goods_listArray;

@end
