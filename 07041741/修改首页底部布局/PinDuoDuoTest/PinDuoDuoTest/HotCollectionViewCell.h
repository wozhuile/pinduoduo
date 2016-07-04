//
//  HotCollectionViewCell.h
//  PinDuoDuoTest
//
//  Created by mac on 16/6/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotCollectionViewCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UILabel *indexSum;

@property (weak, nonatomic) IBOutlet UIImageView *showDataImage;

@property (weak, nonatomic) IBOutlet UILabel *goods_Name;

@property (weak, nonatomic) IBOutlet UILabel *orderTuan;
@property (weak, nonatomic) IBOutlet UILabel *orderCnt;

@property (weak, nonatomic) IBOutlet UILabel *piece;

@property (weak, nonatomic) IBOutlet UILabel *peopleTuan;

@property (weak, nonatomic) IBOutlet UILabel *pricelabel;

@property (weak, nonatomic) IBOutlet UILabel *goForTuan;



@end
