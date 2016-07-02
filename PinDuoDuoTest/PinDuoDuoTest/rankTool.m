//
//  rankTool.m
//  PinDuoDuoTest
//
//  Created by mac on 16/7/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "rankTool.h"
#import "AFNetworking.h"



@implementation rankTool

#pragma mark 请求／获取数据／代理传出去
-(void)sendRequestForGetData:(NSString*)uilString
{
    AFHTTPSessionManager*manager=[AFHTTPSessionManager manager];

    [manager GET:uilString parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        
        
    }];
}
@end
