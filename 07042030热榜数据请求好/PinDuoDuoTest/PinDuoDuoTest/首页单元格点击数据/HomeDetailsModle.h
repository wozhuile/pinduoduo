//
//  HomeDetailsModle.h
//
//  Created by   on 16/7/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HomeDetailsModle : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double mallId;
@property (nonatomic, strong) NSArray *sku;
@property (nonatomic, assign) double eventType;
@property (nonatomic, strong) NSString *warehouse;
@property (nonatomic, strong) NSString *skipGoods;
@property (nonatomic, assign) double isRefundable;
@property (nonatomic, assign) double isApp;
@property (nonatomic, assign) double isOnsale;
@property (nonatomic, strong) NSString *goodsName;
@property (nonatomic, assign) double goodsType;
@property (nonatomic, assign) double catId;
@property (nonatomic, strong) NSString *allowedRegion;
@property (nonatomic, assign) double marketPrice;
@property (nonatomic, strong) NSString *shareDesc;
@property (nonatomic, assign) double shipmentLimitSecond;
@property (nonatomic, strong) NSArray *group;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *goodsDesc;
@property (nonatomic, assign) double preSaleTime;
@property (nonatomic, strong) NSString *thumbUrl;
@property (nonatomic, assign) double catId1;
@property (nonatomic, assign) double catId2;
@property (nonatomic, strong) NSArray *localGroup;
@property (nonatomic, assign) double gpv;
@property (nonatomic, assign) double serverTime;
@property (nonatomic, assign) double sales;
@property (nonatomic, assign) double catId3;
@property (nonatomic, assign) double goodsId;
@property (nonatomic, assign) double isPreSale;
@property (nonatomic, strong) NSArray *gallery;
@property (nonatomic, strong) NSString *imageUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
