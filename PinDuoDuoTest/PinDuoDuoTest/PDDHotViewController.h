//
//  PDDHotViewController.h
//  PinDuoDuoTest
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDDHotViewController : UIViewController

#pragma mark 网络连接不了，先大概布局把,先有数据数组和表
@property(nonatomic,retain)NSMutableArray*dataArray;



#pragma mark 表
@property(nonatomic,strong)UITableView*rankTableView;

@end
