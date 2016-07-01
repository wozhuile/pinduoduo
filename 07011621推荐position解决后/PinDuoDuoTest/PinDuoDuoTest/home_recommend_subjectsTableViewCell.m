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
        
        NSInteger tap=22;//22还可以，。，26和30都不太好
        NSInteger btnWidth=(self.frame.size.width*2-11*9)/10+8;//加大一些，不会感觉空空的
        
        UIScrollView*_MiddleScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(5, 25, self.frame.size.width, 150)];
        // _MiddleScrollView.backgroundColor=[UIColor greenColor];
        _MiddleScrollView.contentSize=CGSizeMake(self.frame.size.width*2+btnWidth*2+50, 100);
        _MiddleScrollView.bounces=NO;
        _MiddleScrollView.showsVerticalScrollIndicator=NO;
        
        _MiddleScrollView.showsHorizontalScrollIndicator=NO;
        

        [self.contentView addSubview:_MiddleScrollView];
  
        for (int i=0 ; i<10; i++) {
            
            UIImageView*imag=[[UIImageView alloc]initWithFrame:CGRectMake(tap+(tap+btnWidth)*i, 5, btnWidth, btnWidth)];
            imag.tag=i+60;
            imag.backgroundColor=[UIColor redColor];
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
