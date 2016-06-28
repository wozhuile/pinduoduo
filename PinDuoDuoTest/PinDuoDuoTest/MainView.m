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
#import <UIImageView+WebCache.h>

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
        //[self CreateTopScrollView];
        
    }
    return self;
}
#pragma mark 滚动视图还不知道大小，应该很大，要不要预留参数？不需要先，目前就是先创建.暂时先创建10向下的大小
-(void)CreateButtomScrollViewWithWidth:(CGFloat)width withHeight:(CGFloat)height
{
  
    _buttomScrollView=[[UIScrollView alloc]initWithFrame:self.frame];
    _buttomScrollView.backgroundColor=[UIColor blueColor];
    _buttomScrollView.contentSize=CGSizeMake(width, height*15);
    
    
    _buttomScrollView.contentOffset=CGPointMake(0,0);
    _buttomScrollView.bounces=NO;
    _buttomScrollView.showsHorizontalScrollIndicator=NO;
    [self addSubview:_buttomScrollView];
    
    
    
    //return _buttomScrollView;
}

#pragma mark 创建顶部滚动视图，外加页面控制器
-(void)CreateTopScrollViewWithUrl:(NSURL*)url
{
    _topScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 200)];
    _topScrollView.backgroundColor=[UIColor greenColor];
    _topScrollView.contentSize=CGSizeMake(self.frame.size.width*5, 200);
    _topScrollView.bounces=NO;
    _topScrollView.showsVerticalScrollIndicator=NO;
#pragma mark 暂时先留着看看有没有分页什么的
    //_topScrollView.showsHorizontalScrollIndicator=NO;
    
    _topScrollView.pagingEnabled=YES;
    [_buttomScrollView addSubview:_topScrollView];
    
    
#pragma mark 创建图片,滚动的图片
    for (int i=0; i<5; i++) {
        UIImageView*imageView=[[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width*i, 0, self.frame.size.width, 200)];
        imageView.backgroundColor=[UIColor orangeColor];
        
#pragma mark 第一次图片没出来，是https哪里没有设置   还有占位图片是随便先放上来的
       // NSLog(@"url+===%@",url);
        [imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];//设置好info哪里的https安全需求后，成功获取图片
        [_topScrollView addSubview:imageView];
        
    }
    

    
}



@end
