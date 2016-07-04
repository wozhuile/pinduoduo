//
//  MainView.h
//  PinDuoDuoTest
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainView : UIView<UIScrollViewDelegate>
{
    NSInteger _speed;
}

#pragma mark 最大的底层的滚动视图属性
@property(nonatomic,retain)UIScrollView*buttomScrollView;


#pragma mark 顶部的滚动视图
@property(nonatomic,retain)UIScrollView*topScrollView;

//-(void)CreateButtomScrollViewWithWidth:(CGFloat)width withHeight:(CGFloat)height;

-(void)CreateButtomScrollViewWithWidth:(CGFloat)width withHeight:(CGFloat)height;


-(void)CreateTopScrollViewWithUrl:(NSMutableArray*)urlArray;


#pragma mark pagecontrol  and timer
@property(nonatomic,retain)UIPageControl*pageControl;
@property(nonatomic,retain)NSTimer*timer;

-(void)CreatePageControl;


#pragma mark 中间滚动加按钮图片
@property(nonatomic,retain)UIScrollView*MiddleScrollView;

-(void)CreateMiddleScrollView;

#pragma mark 创建数组，初始化就加上中间按钮下边的文字
@property(nonatomic,retain)NSMutableArray*middleTitleArray;

#pragma mark 中间输入框！
-(void)CreateMiddleTextField;
@property(nonatomic,retain)UIView*middleView;
@property(nonatomic,retain)UITextField*middleTF;
@property(nonatomic,retain)UIButton*comfirmBtn;
@property(nonatomic,retain)UIButton*alertBtn;
@property(nonatomic,retain)UIAlertView*alertView;
@property(nonatomic,retain)UIImageView*fruitImage;

@end
