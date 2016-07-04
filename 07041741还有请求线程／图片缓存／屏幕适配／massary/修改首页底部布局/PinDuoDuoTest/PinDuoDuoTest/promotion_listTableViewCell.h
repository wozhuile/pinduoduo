//
//  promotion_listTableViewCell.h
//  PinDuoDuoTest
//
//  Created by mac on 16/7/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface promotion_listTableViewCell : UITableViewCell
{
    NSInteger _speed;
}

#pragma mark 顶部的滚动视图
@property(nonatomic,strong)UIScrollView*topScrollView;

#pragma mark pagecontrol  and timer
@property(nonatomic,strong)UIPageControl*pageControl;
@property(nonatomic,strong)NSTimer*timer;

@end
