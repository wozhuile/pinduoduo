//
//  detailsViewController.h
//  PinDuoDuoTest
//
//  Created by mac on 16/7/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark 导入首页控制器,声明成属性，然后遵循代理，实现方法，先输出看看对不对！
#import "ViewController.h"
@interface detailsViewController : UIViewController


#pragma mark 创建表
@property(nonatomic,strong)UITableView*detailTableView;


@property(nonatomic,strong)ViewController*viewDelegate;


@property(nonatomic,assign)NSInteger dataIndex;

@end
