//
//  rankTool.m
//  PinDuoDuoTest
//
//  Created by mac on 16/7/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "rankTool.h"
#import "AFNetworking.h"
#import "RankBaseModle.h"
#import "RankCountryList.h"
#import "RankGoodsList.h"
#import "RankGroup.h"
#import "RankPromotionList.h"



@implementation rankTool

#pragma mark 请求／获取数据／代理传出去
-(void)sendRequestForGetData:(NSString*)uilString
{
    
    
    AFHTTPSessionManager*manager=[AFHTTPSessionManager manager];

    [manager GET:uilString parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        //NSLog(@"responseObject==%@",responseObject);
      
        
        RankBaseModle*baseModel=[RankBaseModle modelObjectWithDictionary:responseObject];
        
#pragma mark 把数据传出去
        if ([_delegate respondsToSelector:@selector(sendData:country_listArray:promotion_listArray:goods_listArray:)]) {
            [_delegate sendData:self country_listArray:(NSMutableArray*)baseModel.countryList promotion_listArray:(NSMutableArray*)baseModel.promotionList goods_listArray:(NSMutableArray*)baseModel.goodsList];//不知道在这里强转会不会有问题
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        if ([_delegate respondsToSelector:@selector(failToGetData:error:)]) {
            [_delegate failToGetData:self error:error];
        }
        
    }];
}
@end
