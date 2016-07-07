//
//  HomeDetailsModle.m
//
//  Created by   on 16/7/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HomeDetailsModle.h"
#import "HomeSku.h"
#import "HomeGroup.h"
#import "HomeGallery.h"


NSString *const kHomeDetailsModleMallId = @"mall_id";
NSString *const kHomeDetailsModleSku = @"sku";
NSString *const kHomeDetailsModleEventType = @"event_type";
NSString *const kHomeDetailsModleWarehouse = @"warehouse";
NSString *const kHomeDetailsModleSkipGoods = @"skip_goods";
NSString *const kHomeDetailsModleIsRefundable = @"is_refundable";
NSString *const kHomeDetailsModleIsApp = @"is_app";
NSString *const kHomeDetailsModleIsOnsale = @"is_onsale";
NSString *const kHomeDetailsModleGoodsName = @"goods_name";
NSString *const kHomeDetailsModleGoodsType = @"goods_type";
NSString *const kHomeDetailsModleCatId = @"cat_id";
NSString *const kHomeDetailsModleAllowedRegion = @"allowed_region";
NSString *const kHomeDetailsModleMarketPrice = @"market_price";
NSString *const kHomeDetailsModleShareDesc = @"share_desc";
NSString *const kHomeDetailsModleShipmentLimitSecond = @"shipment_limit_second";
NSString *const kHomeDetailsModleGroup = @"group";
NSString *const kHomeDetailsModleCountry = @"country";
NSString *const kHomeDetailsModleGoodsDesc = @"goods_desc";
NSString *const kHomeDetailsModlePreSaleTime = @"pre_sale_time";
NSString *const kHomeDetailsModleThumbUrl = @"thumb_url";
NSString *const kHomeDetailsModleCatId1 = @"cat_id_1";
NSString *const kHomeDetailsModleCatId2 = @"cat_id_2";
NSString *const kHomeDetailsModleLocalGroup = @"local_group";
NSString *const kHomeDetailsModleGpv = @"gpv";
NSString *const kHomeDetailsModleServerTime = @"server_time";
NSString *const kHomeDetailsModleSales = @"sales";
NSString *const kHomeDetailsModleCatId3 = @"cat_id_3";
NSString *const kHomeDetailsModleGoodsId = @"goods_id";
NSString *const kHomeDetailsModleIsPreSale = @"is_pre_sale";
NSString *const kHomeDetailsModleGallery = @"gallery";
NSString *const kHomeDetailsModleImageUrl = @"image_url";


@interface HomeDetailsModle ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeDetailsModle

@synthesize mallId = _mallId;
@synthesize sku = _sku;
@synthesize eventType = _eventType;
@synthesize warehouse = _warehouse;
@synthesize skipGoods = _skipGoods;
@synthesize isRefundable = _isRefundable;
@synthesize isApp = _isApp;
@synthesize isOnsale = _isOnsale;
@synthesize goodsName = _goodsName;
@synthesize goodsType = _goodsType;
@synthesize catId = _catId;
@synthesize allowedRegion = _allowedRegion;
@synthesize marketPrice = _marketPrice;
@synthesize shareDesc = _shareDesc;
@synthesize shipmentLimitSecond = _shipmentLimitSecond;
@synthesize group = _group;
@synthesize country = _country;
@synthesize goodsDesc = _goodsDesc;
@synthesize preSaleTime = _preSaleTime;
@synthesize thumbUrl = _thumbUrl;
@synthesize catId1 = _catId1;
@synthesize catId2 = _catId2;
@synthesize localGroup = _localGroup;
@synthesize gpv = _gpv;
@synthesize serverTime = _serverTime;
@synthesize sales = _sales;
@synthesize catId3 = _catId3;
@synthesize goodsId = _goodsId;
@synthesize isPreSale = _isPreSale;
@synthesize gallery = _gallery;
@synthesize imageUrl = _imageUrl;


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
            self.mallId = [[self objectOrNilForKey:kHomeDetailsModleMallId fromDictionary:dict] doubleValue];
    NSObject *receivedHomeSku = [dict objectForKey:kHomeDetailsModleSku];
    NSMutableArray *parsedHomeSku = [NSMutableArray array];
    if ([receivedHomeSku isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHomeSku) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHomeSku addObject:[HomeSku modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHomeSku isKindOfClass:[NSDictionary class]]) {
       [parsedHomeSku addObject:[HomeSku modelObjectWithDictionary:(NSDictionary *)receivedHomeSku]];
    }

    self.sku = [NSArray arrayWithArray:parsedHomeSku];
            self.eventType = [[self objectOrNilForKey:kHomeDetailsModleEventType fromDictionary:dict] doubleValue];
            self.warehouse = [self objectOrNilForKey:kHomeDetailsModleWarehouse fromDictionary:dict];
            self.skipGoods = [self objectOrNilForKey:kHomeDetailsModleSkipGoods fromDictionary:dict];
            self.isRefundable = [[self objectOrNilForKey:kHomeDetailsModleIsRefundable fromDictionary:dict] doubleValue];
            self.isApp = [[self objectOrNilForKey:kHomeDetailsModleIsApp fromDictionary:dict] doubleValue];
            self.isOnsale = [[self objectOrNilForKey:kHomeDetailsModleIsOnsale fromDictionary:dict] doubleValue];
            self.goodsName = [self objectOrNilForKey:kHomeDetailsModleGoodsName fromDictionary:dict];
            self.goodsType = [[self objectOrNilForKey:kHomeDetailsModleGoodsType fromDictionary:dict] doubleValue];
            self.catId = [[self objectOrNilForKey:kHomeDetailsModleCatId fromDictionary:dict] doubleValue];
            self.allowedRegion = [self objectOrNilForKey:kHomeDetailsModleAllowedRegion fromDictionary:dict];
            self.marketPrice = [[self objectOrNilForKey:kHomeDetailsModleMarketPrice fromDictionary:dict] doubleValue];
            self.shareDesc = [self objectOrNilForKey:kHomeDetailsModleShareDesc fromDictionary:dict];
            self.shipmentLimitSecond = [[self objectOrNilForKey:kHomeDetailsModleShipmentLimitSecond fromDictionary:dict] doubleValue];
    NSObject *receivedHomeGroup = [dict objectForKey:kHomeDetailsModleGroup];
    NSMutableArray *parsedHomeGroup = [NSMutableArray array];
    if ([receivedHomeGroup isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHomeGroup) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHomeGroup addObject:[HomeGroup modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHomeGroup isKindOfClass:[NSDictionary class]]) {
       [parsedHomeGroup addObject:[HomeGroup modelObjectWithDictionary:(NSDictionary *)receivedHomeGroup]];
    }

    self.group = [NSArray arrayWithArray:parsedHomeGroup];
            self.country = [self objectOrNilForKey:kHomeDetailsModleCountry fromDictionary:dict];
            self.goodsDesc = [self objectOrNilForKey:kHomeDetailsModleGoodsDesc fromDictionary:dict];
            self.preSaleTime = [[self objectOrNilForKey:kHomeDetailsModlePreSaleTime fromDictionary:dict] doubleValue];
            self.thumbUrl = [self objectOrNilForKey:kHomeDetailsModleThumbUrl fromDictionary:dict];
            self.catId1 = [[self objectOrNilForKey:kHomeDetailsModleCatId1 fromDictionary:dict] doubleValue];
            self.catId2 = [[self objectOrNilForKey:kHomeDetailsModleCatId2 fromDictionary:dict] doubleValue];
            self.localGroup = [self objectOrNilForKey:kHomeDetailsModleLocalGroup fromDictionary:dict];
            self.gpv = [[self objectOrNilForKey:kHomeDetailsModleGpv fromDictionary:dict] doubleValue];
            self.serverTime = [[self objectOrNilForKey:kHomeDetailsModleServerTime fromDictionary:dict] doubleValue];
            self.sales = [[self objectOrNilForKey:kHomeDetailsModleSales fromDictionary:dict] doubleValue];
            self.catId3 = [[self objectOrNilForKey:kHomeDetailsModleCatId3 fromDictionary:dict] doubleValue];
            self.goodsId = [[self objectOrNilForKey:kHomeDetailsModleGoodsId fromDictionary:dict] doubleValue];
            self.isPreSale = [[self objectOrNilForKey:kHomeDetailsModleIsPreSale fromDictionary:dict] doubleValue];
    NSObject *receivedHomeGallery = [dict objectForKey:kHomeDetailsModleGallery];
    NSMutableArray *parsedHomeGallery = [NSMutableArray array];
    if ([receivedHomeGallery isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHomeGallery) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHomeGallery addObject:[HomeGallery modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHomeGallery isKindOfClass:[NSDictionary class]]) {
       [parsedHomeGallery addObject:[HomeGallery modelObjectWithDictionary:(NSDictionary *)receivedHomeGallery]];
    }

    self.gallery = [NSArray arrayWithArray:parsedHomeGallery];
            self.imageUrl = [self objectOrNilForKey:kHomeDetailsModleImageUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mallId] forKey:kHomeDetailsModleMallId];
    NSMutableArray *tempArrayForSku = [NSMutableArray array];
    for (NSObject *subArrayObject in self.sku) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSku addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSku addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSku] forKey:kHomeDetailsModleSku];
    [mutableDict setValue:[NSNumber numberWithDouble:self.eventType] forKey:kHomeDetailsModleEventType];
    [mutableDict setValue:self.warehouse forKey:kHomeDetailsModleWarehouse];
    [mutableDict setValue:self.skipGoods forKey:kHomeDetailsModleSkipGoods];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isRefundable] forKey:kHomeDetailsModleIsRefundable];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isApp] forKey:kHomeDetailsModleIsApp];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isOnsale] forKey:kHomeDetailsModleIsOnsale];
    [mutableDict setValue:self.goodsName forKey:kHomeDetailsModleGoodsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsType] forKey:kHomeDetailsModleGoodsType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.catId] forKey:kHomeDetailsModleCatId];
    [mutableDict setValue:self.allowedRegion forKey:kHomeDetailsModleAllowedRegion];
    [mutableDict setValue:[NSNumber numberWithDouble:self.marketPrice] forKey:kHomeDetailsModleMarketPrice];
    [mutableDict setValue:self.shareDesc forKey:kHomeDetailsModleShareDesc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shipmentLimitSecond] forKey:kHomeDetailsModleShipmentLimitSecond];
    NSMutableArray *tempArrayForGroup = [NSMutableArray array];
    for (NSObject *subArrayObject in self.group) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForGroup addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForGroup addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGroup] forKey:kHomeDetailsModleGroup];
    [mutableDict setValue:self.country forKey:kHomeDetailsModleCountry];
    [mutableDict setValue:self.goodsDesc forKey:kHomeDetailsModleGoodsDesc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.preSaleTime] forKey:kHomeDetailsModlePreSaleTime];
    [mutableDict setValue:self.thumbUrl forKey:kHomeDetailsModleThumbUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.catId1] forKey:kHomeDetailsModleCatId1];
    [mutableDict setValue:[NSNumber numberWithDouble:self.catId2] forKey:kHomeDetailsModleCatId2];
    NSMutableArray *tempArrayForLocalGroup = [NSMutableArray array];
    for (NSObject *subArrayObject in self.localGroup) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLocalGroup addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLocalGroup addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLocalGroup] forKey:kHomeDetailsModleLocalGroup];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gpv] forKey:kHomeDetailsModleGpv];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serverTime] forKey:kHomeDetailsModleServerTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sales] forKey:kHomeDetailsModleSales];
    [mutableDict setValue:[NSNumber numberWithDouble:self.catId3] forKey:kHomeDetailsModleCatId3];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsId] forKey:kHomeDetailsModleGoodsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isPreSale] forKey:kHomeDetailsModleIsPreSale];
    NSMutableArray *tempArrayForGallery = [NSMutableArray array];
    for (NSObject *subArrayObject in self.gallery) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForGallery addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForGallery addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGallery] forKey:kHomeDetailsModleGallery];
    [mutableDict setValue:self.imageUrl forKey:kHomeDetailsModleImageUrl];

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

    self.mallId = [aDecoder decodeDoubleForKey:kHomeDetailsModleMallId];
    self.sku = [aDecoder decodeObjectForKey:kHomeDetailsModleSku];
    self.eventType = [aDecoder decodeDoubleForKey:kHomeDetailsModleEventType];
    self.warehouse = [aDecoder decodeObjectForKey:kHomeDetailsModleWarehouse];
    self.skipGoods = [aDecoder decodeObjectForKey:kHomeDetailsModleSkipGoods];
    self.isRefundable = [aDecoder decodeDoubleForKey:kHomeDetailsModleIsRefundable];
    self.isApp = [aDecoder decodeDoubleForKey:kHomeDetailsModleIsApp];
    self.isOnsale = [aDecoder decodeDoubleForKey:kHomeDetailsModleIsOnsale];
    self.goodsName = [aDecoder decodeObjectForKey:kHomeDetailsModleGoodsName];
    self.goodsType = [aDecoder decodeDoubleForKey:kHomeDetailsModleGoodsType];
    self.catId = [aDecoder decodeDoubleForKey:kHomeDetailsModleCatId];
    self.allowedRegion = [aDecoder decodeObjectForKey:kHomeDetailsModleAllowedRegion];
    self.marketPrice = [aDecoder decodeDoubleForKey:kHomeDetailsModleMarketPrice];
    self.shareDesc = [aDecoder decodeObjectForKey:kHomeDetailsModleShareDesc];
    self.shipmentLimitSecond = [aDecoder decodeDoubleForKey:kHomeDetailsModleShipmentLimitSecond];
    self.group = [aDecoder decodeObjectForKey:kHomeDetailsModleGroup];
    self.country = [aDecoder decodeObjectForKey:kHomeDetailsModleCountry];
    self.goodsDesc = [aDecoder decodeObjectForKey:kHomeDetailsModleGoodsDesc];
    self.preSaleTime = [aDecoder decodeDoubleForKey:kHomeDetailsModlePreSaleTime];
    self.thumbUrl = [aDecoder decodeObjectForKey:kHomeDetailsModleThumbUrl];
    self.catId1 = [aDecoder decodeDoubleForKey:kHomeDetailsModleCatId1];
    self.catId2 = [aDecoder decodeDoubleForKey:kHomeDetailsModleCatId2];
    self.localGroup = [aDecoder decodeObjectForKey:kHomeDetailsModleLocalGroup];
    self.gpv = [aDecoder decodeDoubleForKey:kHomeDetailsModleGpv];
    self.serverTime = [aDecoder decodeDoubleForKey:kHomeDetailsModleServerTime];
    self.sales = [aDecoder decodeDoubleForKey:kHomeDetailsModleSales];
    self.catId3 = [aDecoder decodeDoubleForKey:kHomeDetailsModleCatId3];
    self.goodsId = [aDecoder decodeDoubleForKey:kHomeDetailsModleGoodsId];
    self.isPreSale = [aDecoder decodeDoubleForKey:kHomeDetailsModleIsPreSale];
    self.gallery = [aDecoder decodeObjectForKey:kHomeDetailsModleGallery];
    self.imageUrl = [aDecoder decodeObjectForKey:kHomeDetailsModleImageUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_mallId forKey:kHomeDetailsModleMallId];
    [aCoder encodeObject:_sku forKey:kHomeDetailsModleSku];
    [aCoder encodeDouble:_eventType forKey:kHomeDetailsModleEventType];
    [aCoder encodeObject:_warehouse forKey:kHomeDetailsModleWarehouse];
    [aCoder encodeObject:_skipGoods forKey:kHomeDetailsModleSkipGoods];
    [aCoder encodeDouble:_isRefundable forKey:kHomeDetailsModleIsRefundable];
    [aCoder encodeDouble:_isApp forKey:kHomeDetailsModleIsApp];
    [aCoder encodeDouble:_isOnsale forKey:kHomeDetailsModleIsOnsale];
    [aCoder encodeObject:_goodsName forKey:kHomeDetailsModleGoodsName];
    [aCoder encodeDouble:_goodsType forKey:kHomeDetailsModleGoodsType];
    [aCoder encodeDouble:_catId forKey:kHomeDetailsModleCatId];
    [aCoder encodeObject:_allowedRegion forKey:kHomeDetailsModleAllowedRegion];
    [aCoder encodeDouble:_marketPrice forKey:kHomeDetailsModleMarketPrice];
    [aCoder encodeObject:_shareDesc forKey:kHomeDetailsModleShareDesc];
    [aCoder encodeDouble:_shipmentLimitSecond forKey:kHomeDetailsModleShipmentLimitSecond];
    [aCoder encodeObject:_group forKey:kHomeDetailsModleGroup];
    [aCoder encodeObject:_country forKey:kHomeDetailsModleCountry];
    [aCoder encodeObject:_goodsDesc forKey:kHomeDetailsModleGoodsDesc];
    [aCoder encodeDouble:_preSaleTime forKey:kHomeDetailsModlePreSaleTime];
    [aCoder encodeObject:_thumbUrl forKey:kHomeDetailsModleThumbUrl];
    [aCoder encodeDouble:_catId1 forKey:kHomeDetailsModleCatId1];
    [aCoder encodeDouble:_catId2 forKey:kHomeDetailsModleCatId2];
    [aCoder encodeObject:_localGroup forKey:kHomeDetailsModleLocalGroup];
    [aCoder encodeDouble:_gpv forKey:kHomeDetailsModleGpv];
    [aCoder encodeDouble:_serverTime forKey:kHomeDetailsModleServerTime];
    [aCoder encodeDouble:_sales forKey:kHomeDetailsModleSales];
    [aCoder encodeDouble:_catId3 forKey:kHomeDetailsModleCatId3];
    [aCoder encodeDouble:_goodsId forKey:kHomeDetailsModleGoodsId];
    [aCoder encodeDouble:_isPreSale forKey:kHomeDetailsModleIsPreSale];
    [aCoder encodeObject:_gallery forKey:kHomeDetailsModleGallery];
    [aCoder encodeObject:_imageUrl forKey:kHomeDetailsModleImageUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeDetailsModle *copy = [[HomeDetailsModle alloc] init];
    
    if (copy) {

        copy.mallId = self.mallId;
        copy.sku = [self.sku copyWithZone:zone];
        copy.eventType = self.eventType;
        copy.warehouse = [self.warehouse copyWithZone:zone];
        copy.skipGoods = [self.skipGoods copyWithZone:zone];
        copy.isRefundable = self.isRefundable;
        copy.isApp = self.isApp;
        copy.isOnsale = self.isOnsale;
        copy.goodsName = [self.goodsName copyWithZone:zone];
        copy.goodsType = self.goodsType;
        copy.catId = self.catId;
        copy.allowedRegion = [self.allowedRegion copyWithZone:zone];
        copy.marketPrice = self.marketPrice;
        copy.shareDesc = [self.shareDesc copyWithZone:zone];
        copy.shipmentLimitSecond = self.shipmentLimitSecond;
        copy.group = [self.group copyWithZone:zone];
        copy.country = [self.country copyWithZone:zone];
        copy.goodsDesc = [self.goodsDesc copyWithZone:zone];
        copy.preSaleTime = self.preSaleTime;
        copy.thumbUrl = [self.thumbUrl copyWithZone:zone];
        copy.catId1 = self.catId1;
        copy.catId2 = self.catId2;
        copy.localGroup = [self.localGroup copyWithZone:zone];
        copy.gpv = self.gpv;
        copy.serverTime = self.serverTime;
        copy.sales = self.sales;
        copy.catId3 = self.catId3;
        copy.goodsId = self.goodsId;
        copy.isPreSale = self.isPreSale;
        copy.gallery = [self.gallery copyWithZone:zone];
        copy.imageUrl = [self.imageUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
