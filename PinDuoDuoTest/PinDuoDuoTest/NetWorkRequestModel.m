//
//  NetWorkRequestModel.m
//  PinDuoDuoTest
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "NetWorkRequestModel.h"
#import "AFNetworking.h"
#import "PDDTopSctollView.h"

@implementation NetWorkRequestModel

#pragma mark 第一个顶部滚动的图片进行网络请求  返回URL，，，好像也不需要了，工具生成模型就够了

-(void)topScrollViewImage
{
    AFHTTPSessionManager*manager=[AFHTTPSessionManager manager];
    [manager GET:@"http://apiv2.yangkeduo.com/subjects" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSLog(@"====%@",responseObject);
        
      
        
        
        PDDTopSctollView*model=[PDDTopSctollView modelObjectWithDictionary:responseObject];
        
        NSLog(@"---%@===",model.homeBanner);
        NSLog(@"11=%@",model);
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
    
    
}



@end
