//
//  CommonTitleTool.m
//  PinDuoDuo
//
//  Created by mac on 16/6/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CommonTitleTool.h"


#define WIDTH  self.frame.size.width

#define HEIGHT self.frame.size.height


@implementation CommonTitleTool

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //self.frame.size.height
    }
    return self;
}

#pragma mark 创建方法借口，带个参数，title，外边调用就赋值

+(void)initWithEachViewTitle:(NSString*)title
{
    
}


@end
