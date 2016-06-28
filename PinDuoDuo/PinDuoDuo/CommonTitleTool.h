//
//  CommonTitleTool.h
//  PinDuoDuo
//
//  Created by mac on 16/6/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonTitleTool : UIView

#pragma mark 中间显示的，用label来做，给加个属性
@property(nonatomic,retain)UILabel*titleLabel;


+(void)initWithEachViewTitle:(NSString*)title;

@end
