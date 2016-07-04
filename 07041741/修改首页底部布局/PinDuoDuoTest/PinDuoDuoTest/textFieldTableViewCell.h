//
//  textFieldTableViewCell.h
//  PinDuoDuoTest
//
//  Created by mac on 16/7/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface textFieldTableViewCell : UITableViewCell
@property(nonatomic,retain)UIView*middleView;
@property(nonatomic,retain)UITextField*middleTF;
@property(nonatomic,retain)UIButton*comfirmBtn;
@property(nonatomic,retain)UIButton*alertBtn;
@property(nonatomic,retain)UIAlertView*alertView;
@property(nonatomic,retain)UIImageView*fruitImage;

@end
