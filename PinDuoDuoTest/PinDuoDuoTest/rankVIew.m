//
//  rankVIew.m
//  PinDuoDuoTest
//
//  Created by mac on 16/6/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "rankVIew.h"

@implementation rankVIew

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
       // self.backgroundColor=[UIColor whiteColor];
        [self topViewAndButton];
    }
    
    return self;
    
}
-(void)topViewAndButton
{
    _topVIew=[[UIView alloc]initWithFrame:CGRectMake(0, 64, self.frame.size.width, 40)];
    //_topVIew.backgroundColor=[UIColor greenColor];
    [self addSubview:_topVIew];
    
    NSArray*titlearray=[[NSArray alloc]initWithObjects:@"大家都在买",@"最新", nil];
    
    for (int i=0; i<2; i++) {
        CGFloat x=i==0?0:self.frame.size.width/2;
        
        UIButton*button=[[UIButton alloc]initWithFrame:CGRectMake(x, 0, self.frame.size.width/2, 39)];//留1出来一会做个小跟班view
        [button setTitle:[titlearray objectAtIndex:i] forState:0];
        [button addTarget:self action:@selector(scrollBtn:) forControlEvents:UIControlEventTouchUpInside];
        button.tag=110+i;
          [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
 
        
#pragma mark 注意修改xib的大小为6s plus 规格
        [_topVIew addSubview:button];
    }
    
    
    _slideView=[[UIView alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(_topVIew.frame)-1-1-64, self.frame.size.width*2/5, 1)];//需要减掉导航条的高度，，
    _slideView.backgroundColor=[UIColor redColor];
    [_topVIew addSubview:_slideView];
    
    
}

#pragma mark 按钮点击
-(void)scrollBtn:(UIButton*)sender
{
    
    

    NSLog(@"sender.tag==%ld",(long)sender.tag);
    #pragma mark 设置选中字体颜色为红色
    //[sender setTitleColor:[UIColor blackColor] forState:0];

    //[sender setValue:[UIColor redColor] forKey:@"sender.tag"];
    
    
#pragma mark 滑动slideview   系统效果是用的动画的应该，有慢效果，不是一点击就变化完全的
   // _slideView.center.x =sender.center.x;
    //_slideView.center=CGPointMake(sender.center.x, CGRectGetMinY(_slideView.frame));
    
#pragma mark  大概可以了
    [UIView animateWithDuration:0.5 animations:^{
         _slideView.center=CGPointMake(sender.center.x, CGRectGetMinY(_slideView.frame));
    }];
    
    
    
   
}







@end
