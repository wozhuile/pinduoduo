//
//  NetWorkRequestModel.h
//  PinDuoDuoTest
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PDDHomeData.h"
@class NetWorkRequestModel;
@protocol NetWorkRequestModelDelegate <NSObject>


#pragma mark 把第一个顶部滚动的图片URL传出去
-(void)sucessToGetImageURL:(NetWorkRequestModel*)netWorkRequestModel url:(NSMutableArray*)urlArray;
-(void)failToGetImageURL:(NetWorkRequestModel*)etWorkRequestModel error:(NSError*)error;


#pragma mark 把首页底部数据传出去，直接传模型对象麼？
-(void)sucessToGetData:(NetWorkRequestModel*)netWorkRequestModel modelData:(PDDHomeData*)modelData;
-(void)failToGetData:(NetWorkRequestModel*)etWorkRequestModel error:(NSError*)error;

//
////秒杀
//-(void)successToGetPurChaseData:(NetWorkRequestModel*)netWorkRequestModel array:(NSMutableArray*)array;
//
//-(void)failToGetPurChaseData:(NetWorkRequestModel*)netWorkRequestModel error:(NSError*)error;
//
@end


@interface NetWorkRequestModel : NSObject
#pragma mark 顶部滚动图片请求
-(void)topScrollViewImage:(NSString*)urlStr;


@property(nonatomic,weak)id<NetWorkRequestModelDelegate>delegate;

#pragma mark 底部数据请求
-(void)buttomDataRequest:(NSString*)urlStr;



@end
