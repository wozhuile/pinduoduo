//
//  MiddlescrollTableViewCell.h
//  PinDuoDuoTest
//
//  Created by mac on 16/7/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MiddlescrollTableViewCell : UITableViewCell


#pragma mark 中间滚动加按钮图片
@property(nonatomic,retain)UIScrollView*MiddleScrollView;
#pragma mark 创建数组，初始化就加上中间按钮下边的文字
@property(nonatomic,retain)NSMutableArray*middleTitleArray;


@end
