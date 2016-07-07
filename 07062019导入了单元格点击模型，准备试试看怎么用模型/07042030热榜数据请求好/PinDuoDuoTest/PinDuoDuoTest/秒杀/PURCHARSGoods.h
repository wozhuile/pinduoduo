//
//  PURCHARSGoods.h
//
//  Created by   on 16/7/5
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PURCHARSGoods : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double quantity;
@property (nonatomic, assign) double price;
@property (nonatomic, assign) double marketPrice;
@property (nonatomic, assign) double isOnsale;
@property (nonatomic, strong) NSString *listDesc;
@property (nonatomic, assign) double startTime;
@property (nonatomic, strong) NSString *thumbUrl;
@property (nonatomic, strong) NSString *goodsName;
@property (nonatomic, assign) double soldQuantity;
@property (nonatomic, assign) double goodsId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
