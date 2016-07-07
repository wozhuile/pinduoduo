//
//  detailModel.m
//  PinDuoDuoTest
//
//  Created by mac on 16/7/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "detailModel.h"
#import "AFNetworking.h"
@implementation detailModel



-(void)detailRequestData:(NSString*)urlStr
{
    
    
    AFHTTPSessionManager*manager=[AFHTTPSessionManager manager];
    
    
    
    [manager GET:urlStr parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
#pragma mark 试试看得到数据不一会
        NSLog(@"detailData===%@",responseObject);
        
        
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
    
    
}

@end
