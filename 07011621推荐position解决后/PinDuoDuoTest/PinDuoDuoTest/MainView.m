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
           _speed=1;
        
        [self CreateMiddleArray];
        
         [self  CreateMiddleScrollView];
        
        [self CreateMiddleTextField];
    }
    return self;
}
#pragma mark 懒加载
-(NSMutableArray*)CreateMiddleArray
{
    if (_middleTitleArray==nil) {
        _middleTitleArray=[[NSMutableArray alloc]initWithObjects:@"秒杀",@"超值大牌",@"9块9特卖",@"抽奖",@"食品",@"服饰箱包",@"家居生活",@"母婴",@"美妆护肤",@"海淘", nil];
    }
    return _middleTitleArray;
}
#pragma mark 滚动视图还不知道大小，应该很大，要不要预留参数？不需要先，目前就是先创建.暂时先创建10向下的大小
-(void)CreateButtomScrollViewWithWidth:(CGFloat)width withHeight:(CGFloat)height
{
     _buttomScrollView=[[UIScrollView alloc]initWithFrame:self.frame];
    _buttomScrollView.contentSize=CGSizeMake(width, height*15);
    _buttomScrollView.contentOffset=CGPointMake(0,0);
    _buttomScrollView.bounces=NO;
    _buttomScrollView.showsHorizontalScrollIndicator=NO;
    [self addSubview:_buttomScrollView];
    
  }
#pragma mark 创建顶部滚动视图，外加页面控制器
-(void)CreateTopScrollViewWithUrl:(NSMutableArray*)urlArray
{
    _topScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 200)];
    _topScrollView.contentSize=CGSizeMake(self.frame.size.width*5, 200);
    _topScrollView.bounces=NO;
    _topScrollView.showsVerticalScrollIndicator=NO;
    _topScrollView.showsHorizontalScrollIndicator=NO;
    _topScrollView.pagingEnabled=YES;
    [_buttomScrollView addSubview:_topScrollView];
    
#pragma mark 创建图片,滚动的图片
    for (int i=0; i<5; i++) {
        UIImageView*imageView=[[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width*i, 0, self.frame.size.width, 200)];
        imageView.backgroundColor=[UIColor orangeColor];
       NSURL*url= [urlArray objectAtIndex:i];
        [imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];//设置好info哪里的https安全需求后，成功获取图片
        [_topScrollView addSubview:imageView];
    }
    [self CreatePageControl];
}
#pragma mark 添加pagecontroller和定时器！注意定时器的runloop处理！！！  还有就是应该放到最大的view上，注意调整好位置，不要向左右滑动就跟着滑动了
-(void)CreatePageControl
{
    
    _pageControl = [[UIPageControl alloc]init];
    _pageControl.center = CGPointMake(self.frame.size.width/2, 190);//
    _pageControl.bounds = CGRectMake(0, 0, self.frame.size.width/2, 60);
    _pageControl.numberOfPages = 5;
    _pageControl.pageIndicatorTintColor = [UIColor greenColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    [_pageControl addTarget:self action:@selector(changeImage:) forControlEvents:UIControlEventValueChanged];
  
    [_buttomScrollView addSubview:_pageControl];
 
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
#pragma mark 中间滚动加按钮点击！
-(void)CreateMiddleScrollView
{
    NSInteger tap=22;//22还可以，。，26和30都不太好
    NSInteger btnWidth=(self.frame.size.width*2-11*9)/10+8;//加大一些，不会感觉空空的
    _MiddleScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 200, self.frame.size.width, 100)];
    _MiddleScrollView.contentSize=CGSizeMake(self.frame.size.width*2+btnWidth*2+50, 100);
    _MiddleScrollView.bounces=NO;
    _MiddleScrollView.showsVerticalScrollIndicator=NO;
    _MiddleScrollView.showsHorizontalScrollIndicator=NO;

    [_buttomScrollView addSubview:_MiddleScrollView];

    for (int i=0 ; i<10; i++) {
        
        UIButton*button=[[UIButton alloc]initWithFrame:CGRectMake(tap+(tap+btnWidth)*i, 5, btnWidth, btnWidth)];
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"spike_%d",i+1]] forState:UIControlStateNormal];
        button.tag=i+10;
        [button addTarget:self action:@selector(ShowBtn:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:[_middleTitleArray objectAtIndex:i] forState:UIControlStateNormal];
        button.contentEdgeInsets=UIEdgeInsetsMake(10, 0, -15, 0);//慢慢调节下
        button.titleEdgeInsets=UIEdgeInsetsMake(80, 0, 10, 0);
        
#pragma mark 设置下文字大小;
        button.titleLabel.font=[UIFont systemFontOfSize:12];//12左右就差不多
        //不设置字体颜色就是白色的
        [button setTitleColor:[UIColor blackColor] forState:0];
        
        [_MiddleScrollView addSubview:button];
    }
}
#pragma mark  按钮点击事件应该不应该传出去到控制器里边处理？？
-(void)ShowBtn:(UIButton*)sender
{
    NSLog(@"sender===%ld",(long)sender.tag);//输出按钮对象对应的tag。
}
#pragma mark 中间专属码输入框！
-(void)CreateMiddleTextField
{
    
    _middleView=[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_MiddleScrollView.frame), self.frame.size.width, 60)];
    [_buttomScrollView addSubview:_middleView];
    _fruitImage=[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(_middleView.frame)+10, 5, 45, 45)];
    _fruitImage.image=[UIImage imageNamed:@"Snip20160628_10"];
    [_middleView addSubview:_fruitImage];
    
    _middleTF=[[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_fruitImage.frame), 25, CGRectGetMaxX(_middleView.frame)-140, 30)];
    _middleTF.placeholder=@"请输入'参团专享码'";
    _middleTF.borderStyle=UITextBorderStyleLine;
    
#pragma mark 点击键盘return，，就键盘下去
    [ _middleTF addTarget:self action:@selector(middleTextField) forControlEvents:UIControlEventEditingDidEndOnExit];
    UIColor *color = [UIColor blackColor];
      _middleTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入'参团专享码'" attributes:@{NSForegroundColorAttributeName: color}]; //,@{NSFontAttributeName:fondtt}];
    
    _middleTF.layer.borderColor=[UIColor redColor].CGColor;
    _middleTF.layer.borderWidth=1.0f;
    [_middleView addSubview:_middleTF];
    
    _alertBtn=[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_fruitImage.frame), 5, CGRectGetMaxX(_middleView.frame)-100, 20)];
    [_alertBtn setImage:[UIImage imageNamed:@"question_mark"] forState:0];
    [_alertBtn setTitle:@"0.1元一个猫山王榴莲APP专享团进行中" forState:0];
    
    _alertBtn.contentEdgeInsets=UIEdgeInsetsMake(0, 0, 0, 0);//慢慢调节下
    _alertBtn.titleEdgeInsets=UIEdgeInsetsMake(0, -50, 0, 0);
    _alertBtn.imageEdgeInsets=UIEdgeInsetsMake(0, -90, 0, 0);
#pragma mark 设置下文字大小;
    _alertBtn.titleLabel.font=[UIFont systemFontOfSize:12];//12左右就差不多
    //不设置字体颜色就是白色的
    [_alertBtn setTitleColor:[UIColor blackColor] forState:0];
    
#pragma mark 点击弹出来对话框
    [_alertBtn addTarget:self action:@selector(alertButton) forControlEvents:UIControlEventTouchUpInside];
    [_middleView addSubview:_alertBtn];
    
#pragma mark 确认按钮
    _comfirmBtn=[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_middleTF.frame)+20, 25, 50, CGRectGetHeight(_middleTF.frame))];
    [_comfirmBtn setTitle:@"确认" forState:0];
    [_comfirmBtn setTitleColor:[UIColor whiteColor] forState:0];
    [_comfirmBtn  addTarget:self action:@selector(comfirmButton) forControlEvents:UIControlEventTouchUpInside];
    _comfirmBtn.backgroundColor=[UIColor redColor];
    [_middleView addSubview:_comfirmBtn];
}

-(void)middleTextField
{
    //键盘下去
}
-(void)alertButton
{
    //暂时先这样，文字大小等需要自定义的
    _alertView=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"APP专享码需要好友分享才可以获得" delegate:self cancelButtonTitle:@"立即开团" otherButtonTitles: nil];
    [_alertView show];
}
-(void)comfirmButton
{
    //点击确认还没有处理
}

@end
