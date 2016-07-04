//
//  PDDGoodsList.m
//
//  Created by   on 16/6/27
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PDDGoodsList.h"
#import "PDDGroup.h"


NSString *const kPDDGoodsListGoodsName = @"goods_name";
NSString *const kPDDGoodsListHdThumbUrl = @"hd_thumb_url";
NSString *const kPDDGoodsListEventType = @"event_type";
NSString *const kPDDGoodsListImageUrl = @"image_url";
NSString *const kPDDGoodsListCustomerNum = @"customer_num";
NSString *const kPDDGoodsListNormalPrice = @"normal_price";
NSString *const kPDDGoodsListIsApp = @"is_app";
NSString *const kPDDGoodsListIsOnsale = @"is_onsale";
NSString *const kPDDGoodsListPrice = @"price";
NSString *const kPDDGoodsListMarketPrice = @"market_price";
NSString *const kPDDGoodsListLogo = @"logo";
NSString *const kPDDGoodsListPromotionGoods = @"promotion_goods";
NSString *const kPDDGoodsListGroup = @"group";
NSString *const kPDDGoodsListGoodsId = @"goods_id";
NSString *const kPDDGoodsListSales = @"sales";
NSString *const kPDDGoodsListThumbUrl = @"thumb_url";


@interface PDDGoodsList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PDDGoodsList

@synthesize goodsName = _goodsName;
@synthesize hdThumbUrl = _hdThumbUrl;
@synthesize eventType = _eventType;
@synthesize imageUrl = _imageUrl;
@synthesize customerNum = _customerNum;
@synthesize normalPrice = _normalPrice;
@synthesize isApp = _isApp;
@synthesize isOnsale = _isOnsale;
@synthesize price = _price;
@synthesize marketPrice = _marketPrice;
@synthesize logo = _logo;
@synthesize promotionGoods = _promotionGoods;
@synthesize group = _group;
@synthesize goodsId = _goodsId;
@synthesize sales = _sales;
@synthesize thumbUrl = _thumbUrl;


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
            self.goodsName = [self objectOrNilForKey:kPDDGoodsListGoodsName fromDictionary:dict];
            self.hdThumbUrl = [self objectOrNilForKey:kPDDGoodsListHdThumbUrl fromDictionary:dict];
            self.eventType = [[self objectOrNilForKey:kPDDGoodsListEventType fromDictionary:dict] doubleValue];
            self.imageUrl = [self objectOrNilForKey:kPDDGoodsListImageUrl fromDictionary:dict];
            self.customerNum = [[self objectOrNilForKey:kPDDGoodsListCustomerNum fromDictionary:dict] doubleValue];
            self.normalPrice = [[self objectOrNilForKey:kPDDGoodsListNormalPrice fromDictionary:dict] doubleValue];
            self.isApp = [[self objectOrNilForKey:kPDDGoodsListIsApp fromDictionary:dict] doubleValue];
            self.isOnsale = [[self objectOrNilForKey:kPDDGoodsListIsOnsale fromDictionary:dict] doubleValue];
            self.price = [[self objectOrNilForKey:kPDDGoodsListPrice fromDictionary:dict] doubleValue];
            self.marketPrice = [[self objectOrNilForKey:kPDDGoodsListMarketPrice fromDictionary:dict] doubleValue];
            self.logo = [self objectOrNilForKey:kPDDGoodsListLogo fromDictionary:dict];
            self.promotionGoods = [self objectOrNilForKey:kPDDGoodsListPromotionGoods fromDictionary:dict];
            self.group = [PDDGroup modelObjectWithDictionary:[dict objectForKey:kPDDGoodsListGroup]];
            self.goodsId = [[self objectOrNilForKey:kPDDGoodsListGoodsId fromDictionary:dict] doubleValue];
            self.sales = [[self objectOrNilForKey:kPDDGoodsListSales fromDictionary:dict] doubleValue];
            self.thumbUrl = [self objectOrNilForKey:kPDDGoodsListThumbUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.goodsName forKey:kPDDGoodsListGoodsName];
    [mutableDict setValue:self.hdThumbUrl forKey:kPDDGoodsListHdThumbUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.eventType] forKey:kPDDGoodsListEventType];
    [mutableDict setValue:self.imageUrl forKey:kPDDGoodsListImageUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerNum] forKey:kPDDGoodsListCustomerNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.normalPrice] forKey:kPDDGoodsListNormalPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isApp] forKey:kPDDGoodsListIsApp];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isOnsale] forKey:kPDDGoodsListIsOnsale];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kPDDGoodsListPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.marketPrice] forKey:kPDDGoodsListMarketPrice];
    [mutableDict setValue:self.logo forKey:kPDDGoodsListLogo];
    [mutableDict setValue:self.promotionGoods forKey:kPDDGoodsListPromotionGoods];
    [mutableDict setValue:[self.group dictionaryRepresentation] forKey:kPDDGoodsListGroup];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsId] forKey:kPDDGoodsListGoodsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sales] forKey:kPDDGoodsListSales];
    [mutableDict setValue:self.thumbUrl forKey:kPDDGoodsListThumbUrl];

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

    self.goodsName = [aDecoder decodeObjectForKey:kPDDGoodsListGoodsName];
    self.hdThumbUrl = [aDecoder decodeObjectForKey:kPDDGoodsListHdThumbUrl];
    self.eventType = [aDecoder decodeDoubleForKey:kPDDGoodsListEventType];
    self.imageUrl = [aDecoder decodeObjectForKey:kPDDGoodsListImageUrl];
    self.customerNum = [aDecoder decodeDoubleForKey:kPDDGoodsListCustomerNum];
    self.normalPrice = [aDecoder decodeDoubleForKey:kPDDGoodsListNormalPrice];
    self.isApp = [aDecoder decodeDoubleForKey:kPDDGoodsListIsApp];
    self.isOnsale = [aDecoder decodeDoubleForKey:kPDDGoodsListIsOnsale];
    self.price = [aDecoder decodeDoubleForKey:kPDDGoodsListPrice];
    self.marketPrice = [aDecoder decodeDoubleForKey:kPDDGoodsListMarketPrice];
    self.logo = [aDecoder decodeObjectForKey:kPDDGoodsListLogo];
    self.promotionGoods = [aDecoder decodeObjectForKey:kPDDGoodsListPromotionGoods];
    self.group = [aDecoder decodeObjectForKey:kPDDGoodsListGroup];
    self.goodsId = [aDecoder decodeDoubleForKey:kPDDGoodsListGoodsId];
    self.sales = [aDecoder decodeDoubleForKey:kPDDGoodsListSales];
    self.thumbUrl = [aDecoder decodeObjectForKey:kPDDGoodsListThumbUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_goodsName forKey:kPDDGoodsListGoodsName];
    [aCoder encodeObject:_hdThumbUrl forKey:kPDDGoodsListHdThumbUrl];
    [aCoder encodeDouble:_eventType forKey:kPDDGoodsListEventType];
    [aCoder encodeObject:_imageUrl forKey:kPDDGoodsListImageUrl];
    [aCoder encodeDouble:_customerNum forKey:kPDDGoodsListCustomerNum];
    [aCoder encodeDouble:_normalPrice forKey:kPDDGoodsListNormalPrice];
    [aCoder encodeDouble:_isApp forKey:kPDDGoodsListIsApp];
    [aCoder encodeDouble:_isOnsale forKey:kPDDGoodsListIsOnsale];
    [aCoder encodeDouble:_price forKey:kPDDGoodsListPrice];
    [aCoder encodeDouble:_marketPrice forKey:kPDDGoodsListMarketPrice];
    [aCoder encodeObject:_logo forKey:kPDDGoodsListLogo];
    [aCoder encodeObject:_promotionGoods forKey:kPDDGoodsListPromotionGoods];
    [aCoder encodeObject:_group forKey:kPDDGoodsListGroup];
    [aCoder encodeDouble:_goodsId forKey:kPDDGoodsListGoodsId];
    [aCoder encodeDouble:_sales forKey:kPDDGoodsListSales];
    [aCoder encodeObject:_thumbUrl forKey:kPDDGoodsListThumbUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    PDDGoodsList *copy = [[PDDGoodsList alloc] init];
    
    if (copy) {

        copy.goodsName = [self.goodsName copyWithZone:zone];
        copy.hdThumbUrl = [self.hdThumbUrl copyWithZone:zone];
        copy.eventType = self.eventType;
        copy.imageUrl = [self.imageUrl copyWithZone:zone];
        copy.customerNum = self.customerNum;
        copy.normalPrice = self.normalPrice;
        copy.isApp = self.isApp;
        copy.isOnsale = self.isOnsale;
        copy.price = self.price;
        copy.marketPrice = self.marketPrice;
        copy.logo = [self.logo copyWithZone:zone];
        copy.promotionGoods = [self.promotionGoods copyWithZone:zone];
        copy.group = [self.group copyWithZone:zone];
        copy.goodsId = self.goodsId;
        copy.sales = self.sales;
        copy.thumbUrl = [self.thumbUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
