//
//  RankGoodsList.m
//
//  Created by   on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RankGoodsList.h"
#import "RankGroup.h"


NSString *const kRankGoodsListNormalPrice = @"normal_price";
NSString *const kRankGoodsListIsApp = @"is_app";
NSString *const kRankGoodsListEventType = @"event_type";
NSString *const kRankGoodsListImageUrl = @"image_url";
NSString *const kRankGoodsListGroup = @"group";
NSString *const kRankGoodsListGoodsName = @"goods_name";
NSString *const kRankGoodsListGoodsId = @"goods_id";


@interface RankGoodsList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RankGoodsList

@synthesize normalPrice = _normalPrice;
@synthesize isApp = _isApp;
@synthesize eventType = _eventType;
@synthesize imageUrl = _imageUrl;
@synthesize group = _group;
@synthesize goodsName = _goodsName;
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
            self.normalPrice = [[self objectOrNilForKey:kRankGoodsListNormalPrice fromDictionary:dict] doubleValue];
            self.isApp = [[self objectOrNilForKey:kRankGoodsListIsApp fromDictionary:dict] doubleValue];
            self.eventType = [[self objectOrNilForKey:kRankGoodsListEventType fromDictionary:dict] doubleValue];
            self.imageUrl = [self objectOrNilForKey:kRankGoodsListImageUrl fromDictionary:dict];
            self.group = [RankGroup modelObjectWithDictionary:[dict objectForKey:kRankGoodsListGroup]];
            self.goodsName = [self objectOrNilForKey:kRankGoodsListGoodsName fromDictionary:dict];
            self.goodsId = [[self objectOrNilForKey:kRankGoodsListGoodsId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.normalPrice] forKey:kRankGoodsListNormalPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isApp] forKey:kRankGoodsListIsApp];
    [mutableDict setValue:[NSNumber numberWithDouble:self.eventType] forKey:kRankGoodsListEventType];
    [mutableDict setValue:self.imageUrl forKey:kRankGoodsListImageUrl];
    [mutableDict setValue:[self.group dictionaryRepresentation] forKey:kRankGoodsListGroup];
    [mutableDict setValue:self.goodsName forKey:kRankGoodsListGoodsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsId] forKey:kRankGoodsListGoodsId];

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

    self.normalPrice = [aDecoder decodeDoubleForKey:kRankGoodsListNormalPrice];
    self.isApp = [aDecoder decodeDoubleForKey:kRankGoodsListIsApp];
    self.eventType = [aDecoder decodeDoubleForKey:kRankGoodsListEventType];
    self.imageUrl = [aDecoder decodeObjectForKey:kRankGoodsListImageUrl];
    self.group = [aDecoder decodeObjectForKey:kRankGoodsListGroup];
    self.goodsName = [aDecoder decodeObjectForKey:kRankGoodsListGoodsName];
    self.goodsId = [aDecoder decodeDoubleForKey:kRankGoodsListGoodsId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_normalPrice forKey:kRankGoodsListNormalPrice];
    [aCoder encodeDouble:_isApp forKey:kRankGoodsListIsApp];
    [aCoder encodeDouble:_eventType forKey:kRankGoodsListEventType];
    [aCoder encodeObject:_imageUrl forKey:kRankGoodsListImageUrl];
    [aCoder encodeObject:_group forKey:kRankGoodsListGroup];
    [aCoder encodeObject:_goodsName forKey:kRankGoodsListGoodsName];
    [aCoder encodeDouble:_goodsId forKey:kRankGoodsListGoodsId];
}

- (id)copyWithZone:(NSZone *)zone
{
    RankGoodsList *copy = [[RankGoodsList alloc] init];
    
    if (copy) {

        copy.normalPrice = self.normalPrice;
        copy.isApp = self.isApp;
        copy.eventType = self.eventType;
        copy.imageUrl = [self.imageUrl copyWithZone:zone];
        copy.group = [self.group copyWithZone:zone];
        copy.goodsName = [self.goodsName copyWithZone:zone];
        copy.goodsId = self.goodsId;
    }
    
    return copy;
}


@end
