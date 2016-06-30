//
//  home_recommend_subjectsTableViewCell.m
//  PinDuoDuoTest
//
//  Created by mac on 16/6/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "home_recommend_subjectsTableViewCell.h"

@implementation home_recommend_subjectsTableViewCell



#pragma mark 先创建滚动然后布置成功再说吧
-(instancetype)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    if (self) {
        
        
        //UIScrollView*scroll=[[UIScrollView alloc]initWithFrame:CGRectMake(5, 10, self.frame.size.width, 150)];
      
        NSInteger tap=22;//22还可以，。，26和30都不太好
        NSInteger btnWidth=(self.frame.size.width*2-11*9)/10+8;//加大一些，不会感觉空空的
        
        UIScrollView*_MiddleScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(5, 25, self.frame.size.width, 150)];
        // _MiddleScrollView.backgroundColor=[UIColor greenColor];
        _MiddleScrollView.contentSize=CGSizeMake(self.frame.size.width*2+btnWidth*2+50, 100);
        _MiddleScrollView.bounces=NO;
        _MiddleScrollView.showsVerticalScrollIndicator=NO;
        
#pragma mark 暂时先留着
        _MiddleScrollView.showsHorizontalScrollIndicator=NO;
        
        
#pragma mark 不需要分页，否则一滑动就到边界了都
        //_MiddleScrollView.pagingEnabled=YES;
        [self addSubview:_MiddleScrollView];
        
#pragma mark  考虑！效果里边虽然可以底部创建了滚动，然后再滚动上创建按钮点击也是可以了，但是每个图片按钮点击，都不仅仅这样，有些上边有new或者hot上边，有些么有，我们如果就做个死效果可以判断着做！，但是如果下次不同了呢？服务器给不同上边了呢？那我们在回来改代码？最好不是这样，服务器应该给我们返回参数，那些是标记new或者hot的，那些没有，这样我们可以根据这些服务器给的参数来进行显示不显示，应该都创建了标记，就看显示不显示！  还有要注意封装的，比如上边的顶部滚动有5个图片，要是下次有6个呢？所以我们这个类药高度封装，那些赋值尽可能在最外边就可以了，，这里也是，，new的可能是🆕添加的，就可能下次还需要添加，那要按钮还是集合视图（不用表，表一般上下还好，。左右的就麻烦）
        
        // NSInteger tap=22;//22还可以，。，26和30都不太好
        // NSInteger btnWidth=(self.frame.size.width*2-11*9)/10+8;//加大一些，不会感觉空空的
#pragma mark 先做个效果先吧，后边有时间完善！
        for (int i=0 ; i<10; i++) {
            
            UIImageView*imag=[[UIImageView alloc]initWithFrame:CGRectMake(tap+(tap+btnWidth)*i, 5, btnWidth, btnWidth)];
            //[button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"spike_%d",i+1]] forState:UIControlStateNormal];
            
            
            imag.tag=i+60;
            
            
            
            //[button addTarget:self action:@selector(ShowBtn:) forControlEvents:UIControlEventTouchUpInside];
            imag.backgroundColor=[UIColor redColor];
            
            
#pragma mark 处理按钮下边文字，用内间距：http://www.jianshu.com/p/0facdc527d8d
            //[button setTitle:[_middleTitleArray objectAtIndex:i] forState:UIControlStateNormal];
            
            // button.imageView.backgroundColor=[UIColor redColor];
            // button.titleLabel.backgroundColor=[UIColor orangeColor];
            
            //button.contentEdgeInsets=UIEdgeInsetsMake(10, 0, -15, 0);//慢慢调节下
            //button.titleEdgeInsets=UIEdgeInsetsMake(80, 0, 10, 0);
            
#pragma mark 设置下文字大小;
            //imag.titleLabel.font=[UIFont systemFontOfSize:12];//12左右就差不多
            //不设置字体颜色就是白色的
            //[button setTitleColor:[UIColor blackColor] forState:0];
            
            [_MiddleScrollView addSubview:imag];
            
            
            UILabel*labe=[[UILabel alloc]initWithFrame:CGRectMake(tap+(tap+btnWidth)*i, 5+btnWidth, btnWidth, btnWidth)];
            
            labe.backgroundColor=[UIColor greenColor];
            labe.tag=i+60;
            labe.numberOfLines=0;
            labe.font=[UIFont systemFontOfSize:13];
            labe.textColor=[UIColor blackColor];
            [_MiddleScrollView addSubview:labe];
        }

    }
    
    return self;
    
    
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
