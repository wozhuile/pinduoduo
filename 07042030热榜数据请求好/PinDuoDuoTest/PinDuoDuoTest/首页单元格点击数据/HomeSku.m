//
//  HomeSku.m
//
//  Created by   on 16/7/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HomeSku.h"


NSString *const kHomeSkuLimitQuantity = @"limit_quantity";
NSString *const kHomeSkuQuantity = @"quantity";
NSString *const kHomeSkuSkuId = @"sku_id";
NSString *const kHomeSkuInitQuantity = @"init_quantity";
NSString *const kHomeSkuSpecs = @"specs";
NSString *const kHomeSkuSoldQuantity = @"sold_quantity";
NSString *const kHomeSkuThumbUrl = @"thumb_url";
NSString *const kHomeSkuIsOnsale = @"is_onsale";
NSString *const kHomeSkuSpec = @"spec";
NSString *const kHomeSkuGoodsId = @"goods_id";


@interface HomeSku ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeSku

@synthesize limitQuantity = _limitQuantity;
@synthesize quantity = _quantity;
@synthesize skuId = _skuId;
@synthesize initQuantity = _initQuantity;
@synthesize specs = _specs;
@synthesize soldQuantity = _soldQuantity;
@synthesize thumbUrl = _thumbUrl;
@synthesize isOnsale = _isOnsale;
@synthesize spec = _spec;
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
            self.limitQuantity = [[self objectOrNilForKey:kHomeSkuLimitQuantity fromDictionary:dict] doubleValue];
            self.quantity = [[self objectOrNilForKey:kHomeSkuQuantity fromDictionary:dict] doubleValue];
            self.skuId = [[self objectOrNilForKey:kHomeSkuSkuId fromDictionary:dict] doubleValue];
            self.initQuantity = [[self objectOrNilForKey:kHomeSkuInitQuantity fromDictionary:dict] doubleValue];
            self.specs = [self objectOrNilForKey:kHomeSkuSpecs fromDictionary:dict];
            self.soldQuantity = [[self objectOrNilForKey:kHomeSkuSoldQuantity fromDictionary:dict] doubleValue];
            self.thumbUrl = [self objectOrNilForKey:kHomeSkuThumbUrl fromDictionary:dict];
            self.isOnsale = [[self objectOrNilForKey:kHomeSkuIsOnsale fromDictionary:dict] doubleValue];
            self.spec = [self objectOrNilForKey:kHomeSkuSpec fromDictionary:dict];
            self.goodsId = [[self objectOrNilForKey:kHomeSkuGoodsId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.limitQuantity] forKey:kHomeSkuLimitQuantity];
    [mutableDict setValue:[NSNumber numberWithDouble:self.quantity] forKey:kHomeSkuQuantity];
    [mutableDict setValue:[NSNumber numberWithDouble:self.skuId] forKey:kHomeSkuSkuId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.initQuantity] forKey:kHomeSkuInitQuantity];
    NSMutableArray *tempArrayForSpecs = [NSMutableArray array];
    for (NSObject *subArrayObject in self.specs) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSpecs addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSpecs addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSpecs] forKey:kHomeSkuSpecs];
    [mutableDict setValue:[NSNumber numberWithDouble:self.soldQuantity] forKey:kHomeSkuSoldQuantity];
    [mutableDict setValue:self.thumbUrl forKey:kHomeSkuThumbUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isOnsale] forKey:kHomeSkuIsOnsale];
    [mutableDict setValue:self.spec forKey:kHomeSkuSpec];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsId] forKey:kHomeSkuGoodsId];

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

    self.limitQuantity = [aDecoder decodeDoubleForKey:kHomeSkuLimitQuantity];
    self.quantity = [aDecoder decodeDoubleForKey:kHomeSkuQuantity];
    self.skuId = [aDecoder decodeDoubleForKey:kHomeSkuSkuId];
    self.initQuantity = [aDecoder decodeDoubleForKey:kHomeSkuInitQuantity];
    self.specs = [aDecoder decodeObjectForKey:kHomeSkuSpecs];
    self.soldQuantity = [aDecoder decodeDoubleForKey:kHomeSkuSoldQuantity];
    self.thumbUrl = [aDecoder decodeObjectForKey:kHomeSkuThumbUrl];
    self.isOnsale = [aDecoder decodeDoubleForKey:kHomeSkuIsOnsale];
    self.spec = [aDecoder decodeObjectForKey:kHomeSkuSpec];
    self.goodsId = [aDecoder decodeDoubleForKey:kHomeSkuGoodsId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_limitQuantity forKey:kHomeSkuLimitQuantity];
    [aCoder encodeDouble:_quantity forKey:kHomeSkuQuantity];
    [aCoder encodeDouble:_skuId forKey:kHomeSkuSkuId];
    [aCoder encodeDouble:_initQuantity forKey:kHomeSkuInitQuantity];
    [aCoder encodeObject:_specs forKey:kHomeSkuSpecs];
    [aCoder encodeDouble:_soldQuantity forKey:kHomeSkuSoldQuantity];
    [aCoder encodeObject:_thumbUrl forKey:kHomeSkuThumbUrl];
    [aCoder encodeDouble:_isOnsale forKey:kHomeSkuIsOnsale];
    [aCoder encodeObject:_spec forKey:kHomeSkuSpec];
    [aCoder encodeDouble:_goodsId forKey:kHomeSkuGoodsId];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeSku *copy = [[HomeSku alloc] init];
    
    if (copy) {

        copy.limitQuantity = self.limitQuantity;
        copy.quantity = self.quantity;
        copy.skuId = self.skuId;
        copy.initQuantity = self.initQuantity;
        copy.specs = [self.specs copyWithZone:zone];
        copy.soldQuantity = self.soldQuantity;
        copy.thumbUrl = [self.thumbUrl copyWithZone:zone];
        copy.isOnsale = self.isOnsale;
        copy.spec = [self.spec copyWithZone:zone];
        copy.goodsId = self.goodsId;
    }
    
    return copy;
}


@end
