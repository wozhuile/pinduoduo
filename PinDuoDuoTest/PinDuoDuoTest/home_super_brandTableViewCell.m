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
            UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(32+(32+100)*i, 80, 80, 16)];
            label.backgroundColor=[UIColor redColor];
            label.tag=i+10;
            [self.contentView addSubview:label];
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
