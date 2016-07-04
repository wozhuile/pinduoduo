//
//  PDDGoodsList.h
//
//  Created by   on 16/6/27
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PDDGroup;

@interface PDDGoodsList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *goodsName;
@property (nonatomic, strong) NSString *hdThumbUrl;
@property (nonatomic, assign) double eventType;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, assign) double customerNum;
@property (nonatomic, assign) double normalPrice;
@property (nonatomic, assign) double isApp;
@property (nonatomic, assign) double isOnsale;
@property (nonatomic, assign) double price;
@property (nonatomic, assign) double marketPrice;
@property (nonatomic, strong) NSString *logo;
@property (nonatomic, strong) NSString *promotionGoods;
@property (nonatomic, strong) PDDGroup *group;
@property (nonatomic, assign) double goodsId;
@property (nonatomic, assign) double sales;
@property (nonatomic, strong) NSString *thumbUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
