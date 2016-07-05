//
//  MiddlescrollTableViewCell.m
//  PinDuoDuoTest
//
//  Created by mac on 16/7/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "MiddlescrollTableViewCell.h"

@implementation MiddlescrollTableViewCell

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
        
        [self CreateMiddleArray];
        [self createScrollView];
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

-(void)createScrollView
{
    NSInteger tap=22;//22还可以，。，26和30都不太好
    NSInteger btnWidth=(414*2-11*9)/10+8;//加大一些，不会感觉空空的
    
    _MiddleScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 414, 100)];
     //_MiddleScrollView.backgroundColor=[UIColor greenColor];
    _MiddleScrollView.contentSize=CGSizeMake(414*2+btnWidth*2+50, 100);
    _MiddleScrollView.bounces=NO;
    _MiddleScrollView.showsVerticalScrollIndicator=NO;
    
#pragma mark 暂时先留着
    _MiddleScrollView.showsHorizontalScrollIndicator=NO;
    
    
#pragma mark 不需要分页，否则一滑动就到边界了都
    //_MiddleScrollView.pagingEnabled=YES;
    [self.contentView addSubview:_MiddleScrollView];
    
    
    
    for (int i=0 ; i<10; i++) {
        
        UIButton*button=[[UIButton alloc]initWithFrame:CGRectMake(tap+(tap+btnWidth)*i, 5, btnWidth, btnWidth)];
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"spike_%d",i+1]] forState:UIControlStateNormal];
        button.tag=i+10;
        [button addTarget:self action:@selector(ShowBtn:) forControlEvents:UIControlEventTouchUpInside];
        //button.backgroundColor=[UIColor redColor];
        
        
#pragma mark 处理按钮下边文字，用内间距：http://www.jianshu.com/p/0facdc527d8d
        [button setTitle:[_middleTitleArray objectAtIndex:i] forState:UIControlStateNormal];
        
        // button.imageView.backgroundColor=[UIColor redColor];
        // button.titleLabel.backgroundColor=[UIColor orangeColor];
        
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
    
    //NSLog(@"%@",sender);//输出按钮对象
    NSLog(@"sender===%ld",(long)sender.tag);//输出按钮对象对应的tag。
    
    
#pragma mark 因为点击10个按钮会跳转到下一个界面，需要导航，所以这里要传值出去到控制器里边处理，现在用代理传值出去
    
    
    
}

@end
