//
//  PURCHARSGoods.m
//
//  Created by   on 16/7/5
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PURCHARSGoods.h"


NSString *const kPURCHARSGoodsQuantity = @"quantity";
NSString *const kPURCHARSGoodsPrice = @"price";
NSString *const kPURCHARSGoodsMarketPrice = @"market_price";
NSString *const kPURCHARSGoodsIsOnsale = @"is_onsale";
NSString *const kPURCHARSGoodsListDesc = @"list_desc";
NSString *const kPURCHARSGoodsStartTime = @"start_time";
NSString *const kPURCHARSGoodsThumbUrl = @"thumb_url";
NSString *const kPURCHARSGoodsGoodsName = @"goods_name";
NSString *const kPURCHARSGoodsSoldQuantity = @"sold_quantity";
NSString *const kPURCHARSGoodsGoodsId = @"goods_id";


@interface PURCHARSGoods ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PURCHARSGoods

@synthesize quantity = _quantity;
@synthesize price = _price;
@synthesize marketPrice = _marketPrice;
@synthesize isOnsale = _isOnsale;
@synthesize listDesc = _listDesc;
@synthesize startTime = _startTime;
@synthesize thumbUrl = _thumbUrl;
@synthesize goodsName = _goodsName;
@synthesize soldQuantity = _soldQuantity;
@synthesize goodsId = _goodsId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.quantity = [[self objectOrNilForKey:kPURCHARSGoodsQuantity fromDictionary:dict] doubleValue];
            self.price = [[self objectOrNilForKey:kPURCHARSGoodsPrice fromDictionary:dict] doubleValue];
            self.marketPrice = [[self objectOrNilForKey:kPURCHARSGoodsMarketPrice fromDictionary:dict] doubleValue];
            self.isOnsale = [[self objectOrNilForKey:kPURCHARSGoodsIsOnsale fromDictionary:dict] doubleValue];
            self.listDesc = [self objectOrNilForKey:kPURCHARSGoodsListDesc fromDictionary:dict];
            self.startTime = [[self objectOrNilForKey:kPURCHARSGoodsStartTime fromDictionary:dict] doubleValue];
            self.thumbUrl = [self objectOrNilForKey:kPURCHARSGoodsThumbUrl fromDictionary:dict];
            self.goodsName = [self objectOrNilForKey:kPURCHARSGoodsGoodsName fromDictionary:dict];
            self.soldQuantity = [[self objectOrNilForKey:kPURCHARSGoodsSoldQuantity fromDictionary:dict] doubleValue];
            self.goodsId = [[self objectOrNilForKey:kPURCHARSGoodsGoodsId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.quantity] forKey:kPURCHARSGoodsQuantity];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kPURCHARSGoodsPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.marketPrice] forKey:kPURCHARSGoodsMarketPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isOnsale] forKey:kPURCHARSGoodsIsOnsale];
    [mutableDict setValue:self.listDesc forKey:kPURCHARSGoodsListDesc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.startTime] forKey:kPURCHARSGoodsStartTime];
    [mutableDict setValue:self.thumbUrl forKey:kPURCHARSGoodsThumbUrl];
    [mutableDict setValue:self.goodsName forKey:kPURCHARSGoodsGoodsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.soldQuantity] forKey:kPURCHARSGoodsSoldQuantity];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsId] forKey:kPURCHARSGoodsGoodsId];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.quantity = [aDecoder decodeDoubleForKey:kPURCHARSGoodsQuantity];
    self.price = [aDecoder decodeDoubleForKey:kPURCHARSGoodsPrice];
    self.marketPrice = [aDecoder decodeDoubleForKey:kPURCHARSGoodsMarketPrice];
    self.isOnsale = [aDecoder decodeDoubleForKey:kPURCHARSGoodsIsOnsale];
    self.listDesc = [aDecoder decodeObjectForKey:kPURCHARSGoodsListDesc];
    self.startTime = [aDecoder decodeDoubleForKey:kPURCHARSGoodsStartTime];
    self.thumbUrl = [aDecoder decodeObjectForKey:kPURCHARSGoodsThumbUrl];
    self.goodsName = [aDecoder decodeObjectForKey:kPURCHARSGoodsGoodsName];
    self.soldQuantity = [aDecoder decodeDoubleForKey:kPURCHARSGoodsSoldQuantity];
    self.goodsId = [aDecoder decodeDoubleForKey:kPURCHARSGoodsGoodsId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_quantity forKey:kPURCHARSGoodsQuantity];
    [aCoder encodeDouble:_price forKey:kPURCHARSGoodsPrice];
    [aCoder encodeDouble:_marketPrice forKey:kPURCHARSGoodsMarketPrice];
    [aCoder encodeDouble:_isOnsale forKey:kPURCHARSGoodsIsOnsale];
    [aCoder encodeObject:_listDesc forKey:kPURCHARSGoodsListDesc];
    [aCoder encodeDouble:_startTime forKey:kPURCHARSGoodsStartTime];
    [aCoder encodeObject:_thumbUrl forKey:kPURCHARSGoodsThumbUrl];
    [aCoder encodeObject:_goodsName forKey:kPURCHARSGoodsGoodsName];
    [aCoder encodeDouble:_soldQuantity forKey:kPURCHARSGoodsSoldQuantity];
    [aCoder encodeDouble:_goodsId forKey:kPURCHARSGoodsGoodsId];
}

- (id)copyWithZone:(NSZone *)zone
{
    PURCHARSGoods *copy = [[PURCHARSGoods alloc] init];
    
    if (copy) {

        copy.quantity = self.quantity;
        copy.price = self.price;
        copy.marketPrice = self.marketPrice;
        copy.isOnsale = self.isOnsale;
        copy.listDesc = [self.listDesc copyWithZone:zone];
        copy.startTime = self.startTime;
        copy.thumbUrl = [self.thumbUrl copyWithZone:zone];
        copy.goodsName = [self.goodsName copyWithZone:zone];
        copy.soldQuantity = self.soldQuantity;
        copy.goodsId = self.goodsId;
    }
    
    return copy;
}


@end
