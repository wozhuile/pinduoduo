//
//  EveryOneGoodsList.m
//
//  Created by   on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "EveryOneGoodsList.h"
#import "EveryOneGroup.h"


NSString *const kEveryOneGoodsListIsApp = @"is_app";
NSString *const kEveryOneGoodsListGoodsId = @"goods_id";
NSString *const kEveryOneGoodsListEventType = @"event_type";
NSString *const kEveryOneGoodsListImageUrl = @"image_url";
NSString *const kEveryOneGoodsListHdThumbUrl = @"hd_thumb_url";
NSString *const kEveryOneGoodsListThumbUrl = @"thumb_url";
NSString *const kEveryOneGoodsListCnt = @"cnt";
NSString *const kEveryOneGoodsListGroup = @"group";
NSString *const kEveryOneGoodsListGoodsName = @"goods_name";
NSString *const kEveryOneGoodsListNormalPrice = @"normal_price";


@interface EveryOneGoodsList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation EveryOneGoodsList

@synthesize isApp = _isApp;
@synthesize goodsId = _goodsId;
@synthesize eventType = _eventType;
@synthesize imageUrl = _imageUrl;
@synthesize hdThumbUrl = _hdThumbUrl;
@synthesize thumbUrl = _thumbUrl;
@synthesize cnt = _cnt;
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
            self.isApp = [[self objectOrNilForKey:kEveryOneGoodsListIsApp fromDictionary:dict] doubleValue];
            self.goodsId = [[self objectOrNilForKey:kEveryOneGoodsListGoodsId fromDictionary:dict] doubleValue];
            self.eventType = [[self objectOrNilForKey:kEveryOneGoodsListEventType fromDictionary:dict] doubleValue];
            self.imageUrl = [self objectOrNilForKey:kEveryOneGoodsListImageUrl fromDictionary:dict];
            self.hdThumbUrl = [self objectOrNilForKey:kEveryOneGoodsListHdThumbUrl fromDictionary:dict];
            self.thumbUrl = [self objectOrNilForKey:kEveryOneGoodsListThumbUrl fromDictionary:dict];
            self.cnt = [[self objectOrNilForKey:kEveryOneGoodsListCnt fromDictionary:dict] doubleValue];
            self.group = [EveryOneGroup modelObjectWithDictionary:[dict objectForKey:kEveryOneGoodsListGroup]];
            self.goodsName = [self objectOrNilForKey:kEveryOneGoodsListGoodsName fromDictionary:dict];
            self.normalPrice = [[self objectOrNilForKey:kEveryOneGoodsListNormalPrice fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isApp] forKey:kEveryOneGoodsListIsApp];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsId] forKey:kEveryOneGoodsListGoodsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.eventType] forKey:kEveryOneGoodsListEventType];
    [mutableDict setValue:self.imageUrl forKey:kEveryOneGoodsListImageUrl];
    [mutableDict setValue:self.hdThumbUrl forKey:kEveryOneGoodsListHdThumbUrl];
    [mutableDict setValue:self.thumbUrl forKey:kEveryOneGoodsListThumbUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cnt] forKey:kEveryOneGoodsListCnt];
    [mutableDict setValue:[self.group dictionaryRepresentation] forKey:kEveryOneGoodsListGroup];
    [mutableDict setValue:self.goodsName forKey:kEveryOneGoodsListGoodsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.normalPrice] forKey:kEveryOneGoodsListNormalPrice];

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

    self.isApp = [aDecoder decodeDoubleForKey:kEveryOneGoodsListIsApp];
    self.goodsId = [aDecoder decodeDoubleForKey:kEveryOneGoodsListGoodsId];
    self.eventType = [aDecoder decodeDoubleForKey:kEveryOneGoodsListEventType];
    self.imageUrl = [aDecoder decodeObjectForKey:kEveryOneGoodsListImageUrl];
    self.hdThumbUrl = [aDecoder decodeObjectForKey:kEveryOneGoodsListHdThumbUrl];
    self.thumbUrl = [aDecoder decodeObjectForKey:kEveryOneGoodsListThumbUrl];
    self.cnt = [aDecoder decodeDoubleForKey:kEveryOneGoodsListCnt];
    self.group = [aDecoder decodeObjectForKey:kEveryOneGoodsListGroup];
    self.goodsName = [aDecoder decodeObjectForKey:kEveryOneGoodsListGoodsName];
    self.normalPrice = [aDecoder decodeDoubleForKey:kEveryOneGoodsListNormalPrice];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_isApp forKey:kEveryOneGoodsListIsApp];
    [aCoder encodeDouble:_goodsId forKey:kEveryOneGoodsListGoodsId];
    [aCoder encodeDouble:_eventType forKey:kEveryOneGoodsListEventType];
    [aCoder encodeObject:_imageUrl forKey:kEveryOneGoodsListImageUrl];
    [aCoder encodeObject:_hdThumbUrl forKey:kEveryOneGoodsListHdThumbUrl];
    [aCoder encodeObject:_thumbUrl forKey:kEveryOneGoodsListThumbUrl];
    [aCoder encodeDouble:_cnt forKey:kEveryOneGoodsListCnt];
    [aCoder encodeObject:_group forKey:kEveryOneGoodsListGroup];
    [aCoder encodeObject:_goodsName forKey:kEveryOneGoodsListGoodsName];
    [aCoder encodeDouble:_normalPrice forKey:kEveryOneGoodsListNormalPrice];
}

- (id)copyWithZone:(NSZone *)zone
{
    EveryOneGoodsList *copy = [[EveryOneGoodsList alloc] init];
    
    if (copy) {

        copy.isApp = self.isApp;
        copy.goodsId = self.goodsId;
        copy.eventType = self.eventType;
        copy.imageUrl = [self.imageUrl copyWithZone:zone];
        copy.hdThumbUrl = [self.hdThumbUrl copyWithZone:zone];
        copy.thumbUrl = [self.thumbUrl copyWithZone:zone];
        copy.cnt = self.cnt;
        copy.group = [self.group copyWithZone:zone];
        copy.goodsName = [self.goodsName copyWithZone:zone];
        copy.normalPrice = self.normalPrice;
    }
    
    return copy;
}


@end
