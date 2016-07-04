//
//  NewGoodsList.m
//
//  Created by   on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewGoodsList.h"
#import "NewGroup.h"


NSString *const kNewGoodsListIsApp = @"is_app";
NSString *const kNewGoodsListGoodsId = @"goods_id";
NSString *const kNewGoodsListTime = @"time";
NSString *const kNewGoodsListHdThumbUrl = @"hd_thumb_url";
NSString *const kNewGoodsListEventType = @"event_type";
NSString *const kNewGoodsListImageUrl = @"image_url";
NSString *const kNewGoodsListThumbUrl = @"thumb_url";
NSString *const kNewGoodsListGroup = @"group";
NSString *const kNewGoodsListGoodsName = @"goods_name";
NSString *const kNewGoodsListNormalPrice = @"normal_price";


@interface NewGoodsList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewGoodsList

@synthesize isApp = _isApp;
@synthesize goodsId = _goodsId;
@synthesize time = _time;
@synthesize hdThumbUrl = _hdThumbUrl;
@synthesize eventType = _eventType;
@synthesize imageUrl = _imageUrl;
@synthesize thumbUrl = _thumbUrl;
@synthesize group = _group;
@synthesize goodsName = _goodsName;
@synthesize normalPrice = _normalPrice;


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
            self.isApp = [[self objectOrNilForKey:kNewGoodsListIsApp fromDictionary:dict] doubleValue];
            self.goodsId = [[self objectOrNilForKey:kNewGoodsListGoodsId fromDictionary:dict] doubleValue];
            self.time = [[self objectOrNilForKey:kNewGoodsListTime fromDictionary:dict] doubleValue];
            self.hdThumbUrl = [self objectOrNilForKey:kNewGoodsListHdThumbUrl fromDictionary:dict];
            self.eventType = [[self objectOrNilForKey:kNewGoodsListEventType fromDictionary:dict] doubleValue];
            self.imageUrl = [self objectOrNilForKey:kNewGoodsListImageUrl fromDictionary:dict];
            self.thumbUrl = [self objectOrNilForKey:kNewGoodsListThumbUrl fromDictionary:dict];
            self.group = [NewGroup modelObjectWithDictionary:[dict objectForKey:kNewGoodsListGroup]];
            self.goodsName = [self objectOrNilForKey:kNewGoodsListGoodsName fromDictionary:dict];
            self.normalPrice = [[self objectOrNilForKey:kNewGoodsListNormalPrice fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isApp] forKey:kNewGoodsListIsApp];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsId] forKey:kNewGoodsListGoodsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.time] forKey:kNewGoodsListTime];
    [mutableDict setValue:self.hdThumbUrl forKey:kNewGoodsListHdThumbUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.eventType] forKey:kNewGoodsListEventType];
    [mutableDict setValue:self.imageUrl forKey:kNewGoodsListImageUrl];
    [mutableDict setValue:self.thumbUrl forKey:kNewGoodsListThumbUrl];
    [mutableDict setValue:[self.group dictionaryRepresentation] forKey:kNewGoodsListGroup];
    [mutableDict setValue:self.goodsName forKey:kNewGoodsListGoodsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.normalPrice] forKey:kNewGoodsListNormalPrice];

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

    self.isApp = [aDecoder decodeDoubleForKey:kNewGoodsListIsApp];
    self.goodsId = [aDecoder decodeDoubleForKey:kNewGoodsListGoodsId];
    self.time = [aDecoder decodeDoubleForKey:kNewGoodsListTime];
    self.hdThumbUrl = [aDecoder decodeObjectForKey:kNewGoodsListHdThumbUrl];
    self.eventType = [aDecoder decodeDoubleForKey:kNewGoodsListEventType];
    self.imageUrl = [aDecoder decodeObjectForKey:kNewGoodsListImageUrl];
    self.thumbUrl = [aDecoder decodeObjectForKey:kNewGoodsListThumbUrl];
    self.group = [aDecoder decodeObjectForKey:kNewGoodsListGroup];
    self.goodsName = [aDecoder decodeObjectForKey:kNewGoodsListGoodsName];
    self.normalPrice = [aDecoder decodeDoubleForKey:kNewGoodsListNormalPrice];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_isApp forKey:kNewGoodsListIsApp];
    [aCoder encodeDouble:_goodsId forKey:kNewGoodsListGoodsId];
    [aCoder encodeDouble:_time forKey:kNewGoodsListTime];
    [aCoder encodeObject:_hdThumbUrl forKey:kNewGoodsListHdThumbUrl];
    [aCoder encodeDouble:_eventType forKey:kNewGoodsListEventType];
    [aCoder encodeObject:_imageUrl forKey:kNewGoodsListImageUrl];
    [aCoder encodeObject:_thumbUrl forKey:kNewGoodsListThumbUrl];
    [aCoder encodeObject:_group forKey:kNewGoodsListGroup];
    [aCoder encodeObject:_goodsName forKey:kNewGoodsListGoodsName];
    [aCoder encodeDouble:_normalPrice forKey:kNewGoodsListNormalPrice];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewGoodsList *copy = [[NewGoodsList alloc] init];
    
    if (copy) {

        copy.isApp = self.isApp;
        copy.goodsId = self.goodsId;
        copy.time = self.time;
        copy.hdThumbUrl = [self.hdThumbUrl copyWithZone:zone];
        copy.eventType = self.eventType;
        copy.imageUrl = [self.imageUrl copyWithZone:zone];
        copy.thumbUrl = [self.thumbUrl copyWithZone:zone];
        copy.group = [self.group copyWithZone:zone];
        copy.goodsName = [self.goodsName copyWithZone:zone];
        copy.normalPrice = self.normalPrice;
    }
    
    return copy;
}


@end
