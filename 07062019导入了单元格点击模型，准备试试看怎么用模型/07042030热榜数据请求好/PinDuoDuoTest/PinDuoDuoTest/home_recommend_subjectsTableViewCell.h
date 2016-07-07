//
//  home_recommend_subjectsTableViewCell.h
//  PinDuoDuoTest
//
//  Created by mac on 16/6/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>


@class home_recommend_subjectsTableViewCell;

#pragma mark 把手势点击事情传值出去跳转,如果不点击跳转，连那个cell都点击不到，，怎么进行下一步到拼多多商场

@protocol home_recommend_subjectsTableViewCellDelegate <NSObject>

-(void)sendGesture:(home_recommend_subjectsTableViewCell*)home_recomment_subjects gesture:(UITapGestureRecognizer*)gesture;

@end


@interface home_recommend_subjectsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *subject;
@property (weak, nonatomic) IBOutlet UILabel *modeLook;

@property (weak, nonatomic) IBOutlet UIImageView *comonArrow;
//用weak修饰
@property(weak,nonatomic)id<home_recommend_subjectsTableViewCellDelegate>delegate;



@end
