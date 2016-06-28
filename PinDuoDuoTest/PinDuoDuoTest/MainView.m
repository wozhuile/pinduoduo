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
        
        _speed=1;
        
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
-(void)CreateTopScrollViewWithUrl:(NSMutableArray*)urlArray
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
        NSLog(@"url+===%@",urlArray);
        
#pragma mark 把之前传单个URL改成传进来数组URL。在这里在进行遍历，然后就不会导致重复创建和遍历。
       NSURL*url= [urlArray objectAtIndex:i];
        
        [imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];//设置好info哪里的https安全需求后，成功获取图片
        [_topScrollView addSubview:imageView];
        
    }
    
#pragma mark 在这里直接调用吧，否则在外边调用，直接放到底部滚动上看不见，放到view上又不滚动。。  处理好了！！！
    [self CreatePageControl];
    
    

    
}
#pragma mark 添加pagecontroller和定时器！注意定时器的runloop处理！！！  还有就是应该放到最大的view上，注意调整好位置，不要向左右滑动就跟着滑动了
-(void)CreatePageControl
{
    
    _pageControl = [[UIPageControl alloc]init];
    _pageControl.center = CGPointMake(self.frame.size.width/2, 190);//
    _pageControl.bounds = CGRectMake(0, 0, self.frame.size.width/2, 60);
    _pageControl.numberOfPages = 5;
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    [_pageControl addTarget:self action:@selector(changeImage:) forControlEvents:UIControlEventValueChanged];
    
    
#pragma mark 直接这样放到底部滚动上都看不见了，
    [_buttomScrollView addSubview:_pageControl];
    
     //[self addSubview:_pageControl];
    
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    
#pragma mark timer 的runloop
    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
    
    
}
//定时器方法
- (void)onTimer
{
    if (_pageControl.currentPage == 0)
    {
        _speed = 1;
    }
    if (_pageControl.currentPage == 4)
    {
        _speed = -1;
    }
    _pageControl.currentPage = _pageControl.currentPage + _speed;
    [_topScrollView setContentOffset:CGPointMake(_pageControl.currentPage * self.frame.size.width, 0) animated:YES];
}
//scrollView的协议方法
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (_timer != nil)
    {
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageControl.currentPage = scrollView.contentOffset.x/self.frame.size.width;
    if (_pageControl.currentPage == 0)
    {
        _speed = 1;
    }
    if (_pageControl.currentPage == 4)
    {
        _speed = -1;
    }
    
    if (_timer == nil)
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
        
#pragma mark timer 的runloop
        [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

//pageControl的点击事件
- (void)changeImage:(UIPageControl *)pageC
{
    [_topScrollView setContentOffset:CGPointMake(pageC.currentPage * self.frame.size.width, 0) animated:YES];
}


@end
