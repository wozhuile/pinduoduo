//
//  goods_listTableViewCell.h
//  PinDuoDuoTest
//
//  Created by mac on 16/6/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface goods_listTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *good_listImageView;

@property (weak, nonatomic) IBOutlet UILabel *goods_name;

@property (weak, nonatomic) IBOutlet UIImageView *peopleIcon;

@property (weak, nonatomic) IBOutlet UILabel *customer_num;

@property (weak, nonatomic) IBOutlet UILabel *price;

@property (weak, nonatomic) IBOutlet UIButton *openTuan;


@end
