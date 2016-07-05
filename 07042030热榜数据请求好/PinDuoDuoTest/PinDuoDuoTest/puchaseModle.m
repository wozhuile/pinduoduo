//
//  puchaseModle.m
//  PinDuoDuoTest
//
//  Created by mac on 16/7/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "puchaseModle.h"
#import "AFNetworking.h"
#import "PURCHARSDataModle.h"

@implementation puchaseModle
//秒杀请求
-(void)purchaseDataRequest:(NSString*)urlStr
{
    AFHTTPSessionManager*manager=[AFHTTPSessionManager manager];
    
    
    [manager GET:urlStr parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        // NSLog(@"底部==%@",responseObject);
        
        
#pragma mark  模型，打算直接传出去，一会看看有没有数据，可以在控制器里边的viewwillappear里边处理试试，其实最好传数组过去，这里就把需要的都得到出来在存储到数组，传过去在取出来也可以
        PURCHARSDataModle*modelData=[PURCHARSDataModle modelObjectWithDictionary:responseObject];
        
#pragma mark 先试试数组可以取出来完整的麼   也是够了。。打的时候不提示！！！！！！要慢慢复制过来！！
        ;
        
        
        
        if ([_delegate respondsToSelector:@selector(successToGetPurChaseData:array:)]) {
            
            
            [_delegate successToGetPurChaseData:self array:(NSMutableArray*)modelData.goods];
        }
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        if ([_delegate respondsToSelector:@selector(failToGetPurChaseData:error:)]) {
            [_delegate failToGetPurChaseData:self error:error];
        }
        
        
    }];
    
    
    
    
    
    
}

@end
