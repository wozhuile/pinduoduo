//
//  rankTool.h
//  PinDuoDuoTest
//
//  Created by mac on 16/7/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>


#pragma mark 代理传值出去
@class rankTool;
@protocol rankToolDelegate <NSObject>

#pragma mark 要带什么参数麼？现在有3个数组，要不就在这里先获取数组，在传过去就好
-(void)sendData:(rankTool*)rankTool country_listArray:(NSMutableArray*)country_listArray promotion_listArray:(NSMutableArray*)promotion_listArray goods_listArray:(NSMutableArray*)goods_listArray;

-(void)failToGetData:(rankTool*)rankTool error:(NSError*)error;


@end



@interface rankTool : NSObject

#pragma mark delegate
@property(nonatomic,weak)id<rankToolDelegate>delegate;

-(void)sendRequestForGetData:(NSString*)uilString;
@end
