//
//  detailModel.h
//  PinDuoDuoTest
//
//  Created by mac on 16/7/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeDetailsModle.h"

@class detailModel;
@protocol detailModelDelegate <NSObject>
#pragma mark 因为在第一个大数组就有很多数据需要，就不能单单传过去之前习惯传的数组什么的。。需要把模型都传过去
-(void)suceessToSendDetailData:(detailModel*)detailModle homeDetail:(HomeDetailsModle*)homeDetail;
-(void)failToSendDatailData:(detailModel*)detailModel error:(NSError*)error;
@end


@interface detailModel : NSObject
-(void)detailRequestData:(NSString*)urlStr;

@property(weak,nonatomic)id<detailModelDelegate>delegate;


@end
