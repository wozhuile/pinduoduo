//
//  MainView.m
//  PinDuoDuoTest
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "MainView.h"

#define SCREEN_WIDTH self.frame.size.width
#define SCREEN_HEIGHT  self.frame.size.height
#define SCREEN_FRAME  self.frame


@implementation MainView

/*
 1,创建底层最大的滚动视图
 2，创建顶部滚动视图
 3，中间滚动加点击按钮
 4，中间搜索和确认
 5，底部集合视图或者表展上数据
 
 */
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
     
#pragma mark在这里调用和赋值就出来了
        [self CreateButtomScrollViewWithWidth:self.frame.size.width withHeight:self.frame.size.height];
        
    }
    return self;
}
#pragma mark 滚动视图还不知道大小，应该很大，要不要预留参数？不需要先，目前就是先创建.暂时先创建10向下的大小
-(void)CreateButtomScrollViewWithWidth:(CGFloat)width withHeight:(CGFloat)height
{
  
    _buttomScrollView=[[UIScrollView alloc]initWithFrame:self.frame];
    _buttomScrollView.backgroundColor=[UIColor redColor];
    _buttomScrollView.contentSize=CGSizeMake(width, height*10);
    
    
    _buttomScrollView.contentOffset=CGPointMake(0,0);
    _buttomScrollView.bounces=YES;
    _buttomScrollView.showsHorizontalScrollIndicator=NO;
    [self addSubview:_buttomScrollView];
    
    
    
    //return _buttomScrollView;
}



@end
