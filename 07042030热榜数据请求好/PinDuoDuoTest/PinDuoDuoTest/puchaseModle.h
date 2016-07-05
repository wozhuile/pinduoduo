//
//  puchaseModle.h
//  PinDuoDuoTest
//
//  Created by mac on 16/7/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@class puchaseModle;

@protocol puchaseModleDelegate <NSObject>


////秒杀
-(void)successToGetPurChaseData:(puchaseModle*)netWorkRequestModel array:(NSMutableArray*)array;

-(void)failToGetPurChaseData:(puchaseModle*)netWorkRequestModel error:(NSError*)error;


@end




@interface puchaseModle : NSObject

@property(nonatomic,assign)id<puchaseModleDelegate>delegate;

-(void)purchaseDataRequest:(NSString*)urlStr;
@end
