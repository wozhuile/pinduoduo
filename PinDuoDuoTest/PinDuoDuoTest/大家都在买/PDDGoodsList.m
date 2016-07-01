//
//  PDDGoodsList.m
//
//  Created by   on 16/6/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PDDGoodsList.h"
#import "PDDGroup.h"


NSString *const kPDDGoodsListIsApp = @"is_app";
NSString *const kPDDGoodsListGoodsId = @"goods_id";
NSString *const kPDDGoodsListEventType = @"event_type";
NSString *const kPDDGoodsListImageUrl = @"image_url";
NSString *const kPDDGoodsListHdThumbUrl = @"hd_thumb_url";
NSString *const kPDDGoodsListThumbUrl = @"thumb_url";
NSString *const kPDDGoodsListCnt = @"cnt";
NSString *const kPDDGoodsListGroup = @"group";
NSString *const kPDDGoodsListGoodsName = @"goods_name";
NSString *const kPDDGoodsListNormalPrice = @"normal_price";


@interface PDDGoodsList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PDDGoodsList

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
            self.isApp = [[self objectOrNilForKey:kPDDGoodsListIsApp fromDictionary:dict] doubleValue];
            self.goodsId = [[self objectOrNilForKey:kPDDGoodsListGoodsId fromDictionary:dict] doubleValue];
            self.eventType = [[self objectOrNilForKey:kPDDGoodsListEventType fromDictionary:dict] doubleValue];
            self.imageUrl = [self objectOrNilForKey:kPDDGoodsListImageUrl fromDictionary:dict];
            self.hdThumbUrl = [self objectOrNilForKey:kPDDGoodsListHdThumbUrl fromDictionary:dict];
            self.thumbUrl = [self objectOrNilForKey:kPDDGoodsListThumbUrl fromDictionary:dict];
            self.cnt = [[self objectOrNilForKey:kPDDGoodsListCnt fromDictionary:dict] doubleValue];
            self.group = [PDDGroup modelObjectWithDictionary:[dict objectForKey:kPDDGoodsListGroup]];
            self.goodsName = [self objectOrNilForKey:kPDDGoodsListGoodsName fromDictionary:dict];
            self.normalPrice = [[self objectOrNilForKey:kPDDGoodsListNormalPrice fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isApp] forKey:kPDDGoodsListIsApp];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsId] forKey:kPDDGoodsListGoodsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.eventType] forKey:kPDDGoodsListEventType];
    [mutableDict setValue:self.imageUrl forKey:kPDDGoodsListImageUrl];
    [mutableDict setValue:self.hdThumbUrl forKey:kPDDGoodsListHdThumbUrl];
    [mutableDict setValue:self.thumbUrl forKey:kPDDGoodsListThumbUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cnt] forKey:kPDDGoodsListCnt];
    [mutableDict setValue:[self.group dictionaryRepresentation] forKey:kPDDGoodsListGroup];
    [mutableDict setValue:self.goodsName forKey:kPDDGoodsListGoodsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.normalPrice] forKey:kPDDGoodsListNormalPrice];

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

    self.isApp = [aDecoder decodeDoubleForKey:kPDDGoodsListIsApp];
    self.goodsId = [aDecoder decodeDoubleForKey:kPDDGoodsListGoodsId];
    self.eventType = [aDecoder decodeDoubleForKey:kPDDGoodsListEventType];
    self.imageUrl = [aDecoder decodeObjectForKey:kPDDGoodsListImageUrl];
    self.hdThumbUrl = [aDecoder decodeObjectForKey:kPDDGoodsListHdThumbUrl];
    self.thumbUrl = [aDecoder decodeObjectForKey:kPDDGoodsListThumbUrl];
    self.cnt = [aDecoder decodeDoubleForKey:kPDDGoodsListCnt];
    self.group = [aDecoder decodeObjectForKey:kPDDGoodsListGroup];
    self.goodsName = [aDecoder decodeObjectForKey:kPDDGoodsListGoodsName];
    self.normalPrice = [aDecoder decodeDoubleForKey:kPDDGoodsListNormalPrice];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_isApp forKey:kPDDGoodsListIsApp];
    [aCoder encodeDouble:_goodsId forKey:kPDDGoodsListGoodsId];
    [aCoder encodeDouble:_eventType forKey:kPDDGoodsListEventType];
    [aCoder encodeObject:_imageUrl forKey:kPDDGoodsListImageUrl];
    [aCoder encodeObject:_hdThumbUrl forKey:kPDDGoodsListHdThumbUrl];
    [aCoder encodeObject:_thumbUrl forKey:kPDDGoodsListThumbUrl];
    [aCoder encodeDouble:_cnt forKey:kPDDGoodsListCnt];
    [aCoder encodeObject:_group forKey:kPDDGoodsListGroup];
    [aCoder encodeObject:_goodsName forKey:kPDDGoodsListGoodsName];
    [aCoder encodeDouble:_normalPrice forKey:kPDDGoodsListNormalPrice];
}

- (id)copyWithZone:(NSZone *)zone
{
    PDDGoodsList *copy = [[PDDGoodsList alloc] init];
    
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
