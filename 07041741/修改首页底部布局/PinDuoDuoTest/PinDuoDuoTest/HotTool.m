//
//  HotTool.m
//  PinDuoDuoTest
//
//  Created by mac on 16/7/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "HotTool.h"
#import "AFNetworking.h"

#import "EveryOneBuyModle.h"
#import "EveryOneGoodsList.h"
#import "EveryOneGroup.h"


#import "NewBuyMessageModle.h"
#import "NewGoodsList.h"
#import "NewGroup.h"

@implementation HotTool

#pragma mark 大家都在买请求
-(void)CreateEveryOneBuyRequest:(NSString*)urlString
{
    _requestCount=88;
    
    
    AFHTTPSessionManager*manager=[AFHTTPSessionManager manager];
    [manager GET:urlString parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        
        EveryOneBuyModle*everyModle=[EveryOneBuyModle modelObjectWithDictionary:responseObject];
        
        if ([_delegate respondsToSelector:@selector(SendEveryOneBuy:dataArray:withCount:)]) {
            
           
            NSLog(@"everyModle.goodsList.count111111=%lu",(unsigned long)everyModle.goodsList.count);
            //[_delegate SendEveryOneBuy:self dataArray:(NSMutableArray*)everyModle.goodsList] ;
            
            [_delegate SendEveryOneBuy:self dataArray:(NSMutableArray*)everyModle.goodsList withCount:_requestCount];
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        
        if ([_delegate respondsToSelector:@selector(failTogetEveryOnebuy:error:)]) {
            [_delegate failTogetEveryOnebuy:self error:error];
        }
        
        
        
        
        
    }];

}

#pragma mark 最新请求
-(void)CreateNewBuyRequest:(NSString*)urlString
{
    AFHTTPSessionManager*manager=[AFHTTPSessionManager manager];
    [manager GET:urlString parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NewBuyMessageModle*newModle=[NewBuyMessageModle modelObjectWithDictionary:responseObject];
        
        
        if ([_delegate respondsToSelector:@selector(sendNewBuy:dataArray:)]) {
            
              NSLog(@"newModle.goodsList.count22222=%lu",(unsigned long)newModle.goodsList.count);
            
            [_delegate sendNewBuy:self dataArray:(NSMutableArray*)newModle.goodsList];
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        if ([_delegate respondsToSelector:@selector(failTogetNewbuy:error:)]) {
            [_delegate failTogetNewbuy:self error:error];
        }
        
    }];
}
@end
