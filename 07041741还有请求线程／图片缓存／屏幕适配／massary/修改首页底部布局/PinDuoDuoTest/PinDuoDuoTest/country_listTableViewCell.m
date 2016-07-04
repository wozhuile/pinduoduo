//
//  country_listTableViewCell.m
//  PinDuoDuoTest
//
//  Created by mac on 16/7/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "country_listTableViewCell.h"

@implementation country_listTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark 第一个区滚动
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, 414, 140)];
        //_scrollView.backgroundColor=[UIColor purpleColor];
        _scrollView.pagingEnabled=YES;
        _scrollView.contentSize=CGSizeMake(700, 140);
        _scrollView.showsVerticalScrollIndicator=NO;
        _scrollView.showsHorizontalScrollIndicator=NO;
        [self.contentView addSubview:_scrollView];
        
        
        CGFloat gap=20;
        CGFloat width=(700-6*gap)/5;
        
        for (int i=0; i<5; i++) {
            UIButton*button=[[UIButton alloc]initWithFrame:CGRectMake(gap+(gap+width)*i, 10, width, width)];
            //button.backgroundColor=[UIColor redColor ];
            [button addTarget:self action:@selector(buttonAntion:) forControlEvents:UIControlEventTouchUpInside];
            
            
            button.tag=i+100;
            
            
            
            //button.contentEdgeInsets=UIEdgeInsetsMake(10, 0, -15, 0);//慢慢调节下
            //button.titleEdgeInsets=UIEdgeInsetsMake(80, 0, 10, 0);
            
#pragma mark 设置下文字大小;
           // button.titleLabel.font=[UIFont systemFontOfSize:12];//12左右就差不多
            //不设置字体颜色就是白色的
            //[button setTitleColor:[UIColor blackColor] forState:0];
            [_scrollView addSubview:button];
            
        }
        
        
        
        
    }
    
    
    
    return self;
    
}
#pragma mark 按钮点击事件,可以代理传出去控制器哪里操作，，跳转需要导航，，这个类里边没有的
-(void)buttonAntion:(UIButton*)sender
{
    
    NSLog(@"%ld",(long)sender.tag);
}


@end
