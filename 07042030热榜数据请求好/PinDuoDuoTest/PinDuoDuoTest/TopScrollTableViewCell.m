//
//  TopScrollTableViewCell.m
//  PinDuoDuoTest
//
//  Created by mac on 16/7/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TopScrollTableViewCell.h"

@implementation TopScrollTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        _speed=1;
        
        
#pragma mark    414是还没有进行屏幕适配的
        
        _topScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 414, 200)];
        _topScrollView.backgroundColor=[UIColor greenColor];
        _topScrollView.contentSize=CGSizeMake(414*5, 200);
        _topScrollView.bounces=NO;
        _topScrollView.showsVerticalScrollIndicator=NO;
#pragma mark 暂时先留着看看有没有分页什么的
        _topScrollView.showsHorizontalScrollIndicator=NO;
        
        _topScrollView.pagingEnabled=YES;
        [self.contentView addSubview:_topScrollView];

        
    }
    
    for (int i=0; i<5; i++) {
        UIImageView*imageView=[[UIImageView alloc]initWithFrame:CGRectMake(414*i, 0, 414, 200)];
        imageView.backgroundColor=[UIColor orangeColor];
        
        
        imageView.tag=i+300;
        
        [_topScrollView addSubview:imageView];
        
    }

    [self CreatePageControl];
    

    
    
    
    
    return self;
}
#pragma mark 添加pagecontroller和定时器！注意定时器的runloop处理！！！  还有就是应该放到最大的view上，注意调整好位置，不要向左右滑动就跟着滑动了
-(void)CreatePageControl
{
    
    _pageControl = [[UIPageControl alloc]init];
    _pageControl.center = CGPointMake(414/2, 190);//
    _pageControl.bounds = CGRectMake(0, 0, 414/2, 60);
    _pageControl.numberOfPages = 5;
    _pageControl.pageIndicatorTintColor = [UIColor greenColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    [_pageControl addTarget:self action:@selector(changeImage:) forControlEvents:UIControlEventValueChanged];
    
    
#pragma mark 因为点太小，所以可以重写方法：http://blog.csdn.net/chenyong05314/article/details/18627991
    
    
#pragma mark 直接这样放到底部滚动上都看不见了，
    [self.contentView addSubview:_pageControl];
    
    //[self addSubview:_pageControl];
    
    
    
#pragma mark 定时器bug。。刷新加了后，，这里的定时器刷新就bug来，，不安时间来了。。
    
    
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
    _pageControl.currentPage = scrollView.contentOffset.x/414;
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
    [_topScrollView setContentOffset:CGPointMake(pageC.currentPage * 414, 0) animated:YES];
}



@end
