//
//  HotTool.h
//  PinDuoDuoTest
//
//  Created by mac on 16/7/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark 代理传值把数据传出去
@class HotTool;
@protocol HotToolDelegate <NSObject>

#pragma mark 大家都在买的delegate
-(void)SendEveryOneBuy:(HotTool*)hotTool dataArray:(NSMutableArray*)dataArray withCount:(NSInteger)count;
-(void)failTogetEveryOnebuy:(HotTool*)hotTool error:(NSError*)error;

#pragma mark 最新delegate
-(void)sendNewBuy:(HotTool*)hotTool dataArray:(NSMutableArray*)dataArray;
-(void)failTogetNewbuy:(HotTool*)hotTool error:(NSError*)error;


@end




@interface HotTool : NSObject


-(void)CreateEveryOneBuyRequest:(NSString*)urlString;

-(void)CreateNewBuyRequest:(NSString*)urlString;

@property(nonatomic,weak)id<HotToolDelegate>delegate;


//传个数字过去，，给返回行哪里做条件

@property(nonatomic,assign)NSInteger requestCount;



@end
