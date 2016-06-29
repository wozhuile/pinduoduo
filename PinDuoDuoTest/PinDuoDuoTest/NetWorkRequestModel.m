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
#import "DataModels.h"
@implementation NetWorkRequestModel

#pragma mark 第一个顶部滚动的图片进行网络请求  返回URL，，，好像也不需要了，工具生成模型就够了

-(void)topScrollViewImage
{
    AFHTTPSessionManager*manager=[AFHTTPSessionManager manager];
    [manager GET:@"http://apiv2.yangkeduo.com/subjects" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        //NSLog(@"====%@",responseObject);
        
      
        
        
       // PDDTopSctollView*model=[PDDTopSctollView modelObjectWithDictionary:responseObject];
        
      //
        //NSLog(@"---%@===",model.homeBanner);
        
          // NSLog(@"---%f===",model.homeBannerHeight);
        
        //NSLog(@"11=%@",model);
#pragma mark 用字典转模型取不出来。。。但是直接kvc就可以了。。醉了。。！！！！
        //[responseObject valueForKey:@"home_banner"];
#pragma mark 注意了，这里虽然麻烦点，但是如果真没办法了，，valueforkey也是可以得到字典的值的，就是需要写得很多的时候特别麻烦！！！
        NSMutableArray*array=[responseObject valueForKey:@"home_banner"];
        
        if ([_delegate respondsToSelector:@selector(sucessToGetImageURL:url:)]) {
            [_delegate sucessToGetImageURL:self url:array];
        }
        
        //NSLog(@"%@", array);
        //那就传值出去吧。。
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if ([_delegate respondsToSelector:@selector(failToGetImageURL:error:)]) {
            [_delegate failToGetImageURL:self error:error];
        }
        
    }];
    
    
}

#pragma mark  首页下边数据请求
-(void)buttomDataRequest
{
    AFHTTPSessionManager*manager=[AFHTTPSessionManager manager];
    
    
    [manager GET:@"http://apiv2.yangkeduo.com/v2/goods?page=1&size=50   " parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSLog(@"底部==%@",responseObject);
        
        
#pragma mark  模型，打算直接传出去，一会看看有没有数据，可以在控制器里边的viewwillappear里边处理试试，其实最好传数组过去，这里就把需要的都得到出来在存储到数组，传过去在取出来也可以
        PDDHomeData*modelData=[PDDHomeData modelObjectWithDictionary:responseObject];
        
        if ([_delegate respondsToSelector:@selector(sucessToGetData:modelData:)]) {
            [_delegate sucessToGetData:self modelData:modelData];
        }
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        if ([_delegate respondsToSelector:@selector(failToGetData:error:)]) {
            [_delegate failToGetData:self error:error];
        }
        
        
    }];
    
    
    
    
    
    
}



@end
