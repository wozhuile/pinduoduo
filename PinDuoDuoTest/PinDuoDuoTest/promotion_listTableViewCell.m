//
//  promotion_listTableViewCell.m
//  PinDuoDuoTest
//
//  Created by mac on 16/7/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "promotion_listTableViewCell.h"

@implementation promotion_listTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark 第0个区滚动
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        _speed=1;
        
        _topScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 414, 268)];
        //_topScrollView.backgroundColor=[UIColor redColor];
        _topScrollView.contentSize=CGSizeMake(414*5, 268);
        _topScrollView.bounces=NO;
        _topScrollView.showsVerticalScrollIndicator=NO;
#pragma mark 暂时先留着看看有没有分页什么的
        //_topScrollView.showsHorizontalScrollIndicator=NO;
        _topScrollView.tag=8888;
        _topScrollView.pagingEnabled=YES;
        
        
#pragma mark  原来图片不出来是这里
        //[self addSubview:_topScrollView];
        [self.contentView addSubview:_topScrollView];
        
#pragma mark 输出cell坐标和滚动坐标
        //NSLog(@"cell==%f====_topScrollView=%f",self.frame.size.width,CGRectGetWidth(_topScrollView.frame));//控制器的是414，，这里self.contentView 和self都是320
        
        
        
#pragma mark 创建图片,滚动的图片
        for (int i=0; i<5; i++) {
            UIImageView*imageView=[[UIImageView alloc]initWithFrame:CGRectMake(414*i, 0, 414, 268)];
            imageView.backgroundColor=[UIColor orangeColor];
            
#pragma mark 第一次图片没出来，是https哪里没有设置   还有占位图片是随便先放上来的
            //NSLog(@"url+===%@",urlArray);
            
#pragma mark 把之前传单个URL改成传进来数组URL。在这里在进行遍历，然后就不会导致重复创建和遍历。
            //NSURL*url= [urlArray objectAtIndex:i];
#pragma mark 现在不在这里赋值图片了。。在cell里边在赋值，通过tag来找到
            imageView.tag=200+i;
            
            
            //[imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];//设置好info哪里的https安全需求后，成功获取图片
            
#pragma mark 注意了。现在 图片放在的是滚动视图上，一会在cell。contentview上是找不到的，，所以不奇怪没出来图片
            [_topScrollView addSubview:imageView];
            
        }
        
#pragma mark 在这里直接调用吧，否则在外边调用，直接放到底部滚动上看不见，放到view上又不滚动。。  处理好了！！！
        [self CreatePageControl];
        

        
    }
    
    
    
    return self;
    
}
#pragma mark 添加pagecontroller和定时器！注意定时器的runloop处理！！！  还有就是应该放到最大的view上，注意调整好位置，不要向左右滑动就跟着滑动了
-(void)CreatePageControl
{
    
    _pageControl = [[UIPageControl alloc]init];
    _pageControl.center = CGPointMake(340/2, 250);//
    _pageControl.bounds = CGRectMake(0, 0, 414/2, 60);
    _pageControl.numberOfPages = 5;
    _pageControl.pageIndicatorTintColor = [UIColor greenColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    [_pageControl addTarget:self action:@selector(changeImage:) forControlEvents:UIControlEventValueChanged];
    
    
#pragma mark 因为点太小，所以可以重写方法：http://blog.csdn.net/chenyong05314/article/details/18627991
    
    
#pragma mark 直接这样放到底部滚动上都看不见了，
    [self addSubview:_pageControl];
    
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
