//
//  home_super_brandTableViewCell.m
//  PinDuoDuoTest
//
//  Created by mac on 16/6/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "home_super_brandTableViewCell.h"

@implementation home_super_brandTableViewCell

//-(instancetype)init
//{
//    self=[super init];
//    if (self) {
//        
//        
//        for (int i=0; i<3; i++) {
//            UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(32+(32+100)*i, 80, 80, 16)];
//            label.backgroundColor=[UIColor redColor];
//            label.tag=10;
//            [self.contentView addSubview:label];
//        }
//        
//
//        
//    }
//    
//    
//    return self;
//}

-(instancetype)initWithFrame:(CGRect)frame


{
   self=[super initWithFrame:frame];
    if (self) {
        
        
        
            
        for (int i=0; i<3; i++) {
            
            UILabel*superLabel=[[UILabel alloc]initWithFrame:CGRectMake(180, 10, 100, 20)];
            superLabel.text=@"超值大牌";
            superLabel.font=[UIFont systemFontOfSize:20];
            [self.contentView addSubview:superLabel];
            
            UILabel*qiangGoulable=[[UILabel alloc]initWithFrame:CGRectMake(80, 40, 100, 20)];
            
            qiangGoulable.text=@"距抢购结束:";
            qiangGoulable.font=[UIFont systemFontOfSize:14];
            [self.contentView addSubview:qiangGoulable];
            
            
            
            
            
            UIImageView*imageView=[[UIImageView alloc]initWithFrame:CGRectMake(20+(30+100)*i, 60, 140, 120)];
            imageView.tag=100+i;
            [self.contentView addSubview:imageView];
            
            UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(32+(32+115)*i, 210, 80, 16)];
            //label.backgroundColor=[UIColor redColor];
            label.tag=i+10;
            //label.textAlignment=NSTextAlignmentCenter;
            [self.contentView addSubview:label];
            
            
            UILabel*lookMore=[[UILabel alloc]initWithFrame:CGRectMake(180, 240, 80, 20)];
            lookMore.text=@"查看更多";
            lookMore.font=[UIFont systemFontOfSize:14];
            [self.contentView addSubview:lookMore];
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
