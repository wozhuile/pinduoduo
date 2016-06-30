//
//  PDDGoodsList.m
//
//  Created by   on 16/6/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PDDGoodsList.h"
#import "PDDGroup.h"


NSString *const kPDDGoodsListNormalPrice = @"normal_price";
NSString *const kPDDGoodsListIsApp = @"is_app";
NSString *const kPDDGoodsListEventType = @"event_type";
NSString *const kPDDGoodsListImageUrl = @"image_url";
NSString *const kPDDGoodsListGroup = @"group";
NSString *const kPDDGoodsListGoodsName = @"goods_name";
NSString *const kPDDGoodsListGoodsId = @"goods_id";


@interface PDDGoodsList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PDDGoodsList

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
            self.normalPrice = [[self objectOrNilForKey:kPDDGoodsListNormalPrice fromDictionary:dict] doubleValue];
            self.isApp = [[self objectOrNilForKey:kPDDGoodsListIsApp fromDictionary:dict] doubleValue];
            self.eventType = [[self objectOrNilForKey:kPDDGoodsListEventType fromDictionary:dict] doubleValue];
            self.imageUrl = [self objectOrNilForKey:kPDDGoodsListImageUrl fromDictionary:dict];
            self.group = [PDDGroup modelObjectWithDictionary:[dict objectForKey:kPDDGoodsListGroup]];
            self.goodsName = [self objectOrNilForKey:kPDDGoodsListGoodsName fromDictionary:dict];
            self.goodsId = [[self objectOrNilForKey:kPDDGoodsListGoodsId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.normalPrice] forKey:kPDDGoodsListNormalPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isApp] forKey:kPDDGoodsListIsApp];
    [mutableDict setValue:[NSNumber numberWithDouble:self.eventType] forKey:kPDDGoodsListEventType];
    [mutableDict setValue:self.imageUrl forKey:kPDDGoodsListImageUrl];
    [mutableDict setValue:[self.group dictionaryRepresentation] forKey:kPDDGoodsListGroup];
    [mutableDict setValue:self.goodsName forKey:kPDDGoodsListGoodsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsId] forKey:kPDDGoodsListGoodsId];

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

    self.normalPrice = [aDecoder decodeDoubleForKey:kPDDGoodsListNormalPrice];
    self.isApp = [aDecoder decodeDoubleForKey:kPDDGoodsListIsApp];
    self.eventType = [aDecoder decodeDoubleForKey:kPDDGoodsListEventType];
    self.imageUrl = [aDecoder decodeObjectForKey:kPDDGoodsListImageUrl];
    self.group = [aDecoder decodeObjectForKey:kPDDGoodsListGroup];
    self.goodsName = [aDecoder decodeObjectForKey:kPDDGoodsListGoodsName];
    self.goodsId = [aDecoder decodeDoubleForKey:kPDDGoodsListGoodsId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_normalPrice forKey:kPDDGoodsListNormalPrice];
    [aCoder encodeDouble:_isApp forKey:kPDDGoodsListIsApp];
    [aCoder encodeDouble:_eventType forKey:kPDDGoodsListEventType];
    [aCoder encodeObject:_imageUrl forKey:kPDDGoodsListImageUrl];
    [aCoder encodeObject:_group forKey:kPDDGoodsListGroup];
    [aCoder encodeObject:_goodsName forKey:kPDDGoodsListGoodsName];
    [aCoder encodeDouble:_goodsId forKey:kPDDGoodsListGoodsId];
}

- (id)copyWithZone:(NSZone *)zone
{
    PDDGoodsList *copy = [[PDDGoodsList alloc] init];
    
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
