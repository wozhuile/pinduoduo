//
//  HomeSku.h
//
//  Created by   on 16/7/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HomeSku : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double limitQuantity;
@property (nonatomic, assign) double quantity;
@property (nonatomic, assign) double skuId;
@property (nonatomic, assign) double initQuantity;
@property (nonatomic, strong) NSArray *specs;
@property (nonatomic, assign) double soldQuantity;
@property (nonatomic, strong) NSString *thumbUrl;
@property (nonatomic, assign) double isOnsale;
@property (nonatomic, strong) NSString *spec;
@property (nonatomic, assign) double goodsId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
