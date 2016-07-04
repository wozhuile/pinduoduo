//
//  TopScrollTableViewCell.h
//  PinDuoDuoTest
//
//  Created by mac on 16/7/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopScrollTableViewCell : UITableViewCell
{
    NSInteger _speed;
}
#pragma mark 顶部的滚动视图
@property(nonatomic,retain)UIScrollView*topScrollView;


#pragma mark pagecontrol  and timer
@property(nonatomic,retain)UIPageControl*pageControl;
@property(nonatomic,retain)NSTimer*timer;

@end
