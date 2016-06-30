//
//  rankVIew.h
//  PinDuoDuoTest
//
//  Created by mac on 16/6/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface rankVIew : UIView

#pragma mark 上边有一个view，view上可以放两个按钮，点击按钮，下边就是大滚动视图，可以左右滑动
@property(nonatomic,strong)UIView*topVIew;

#pragma mark 小滑条
@property(nonatomic,strong)UIView*slideView;

//
//#pragma mark collectionView
//@property(nonatomic,strong)UICollectionView*dataConllection;


@end
