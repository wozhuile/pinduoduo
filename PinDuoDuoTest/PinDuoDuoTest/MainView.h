//
//  MainView.h
//  PinDuoDuoTest
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainView : UIView


#pragma mark 最大的底层的滚动视图属性
@property(nonatomic,retain)UIScrollView*buttomScrollView;


#pragma mark 顶部的滚动视图
@property(nonatomic,retain)UIScrollView*topScrollView;

//-(void)CreateButtomScrollViewWithWidth:(CGFloat)width withHeight:(CGFloat)height;

-(void)CreateButtomScrollViewWithWidth:(CGFloat)width withHeight:(CGFloat)height;


-(void)CreateTopScrollViewWithUrl:(NSMutableArray*)urlArray;

@end
