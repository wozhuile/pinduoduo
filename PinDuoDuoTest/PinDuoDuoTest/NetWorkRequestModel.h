//
//  NetWorkRequestModel.h
//  PinDuoDuoTest
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NetWorkRequestModel;
@protocol NetWorkRequestModelDelegate <NSObject>


#pragma mark 把第一个顶部滚动的图片URL传出去
-(void)sucessToGetImageURL:(NetWorkRequestModel*)netWorkRequestModel url:(NSMutableArray*)urlArray;
-(void)failToGetImageURL:(NetWorkRequestModel*)etWorkRequestModel error:(NSError*)error;

@end


@interface NetWorkRequestModel : NSObject
-(void)topScrollViewImage;


@property(nonatomic,assign)id<NetWorkRequestModelDelegate>delegate;


@end
