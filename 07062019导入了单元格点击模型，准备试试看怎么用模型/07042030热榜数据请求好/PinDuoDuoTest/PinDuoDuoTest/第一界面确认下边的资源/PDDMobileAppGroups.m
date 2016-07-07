//
//  PDDMobileAppGroups.m
//
//  Created by   on 16/6/27
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PDDMobileAppGroups.h"


NSString *const kPDDMobileAppGroupsEndTime = @"end_time";
NSString *const kPDDMobileAppGroupsBanner = @"banner";
NSString *const kPDDMobileAppGroupsGroupId = @"group_id";
NSString *const kPDDMobileAppGroupsStartTime = @"start_time";
NSString *const kPDDMobileAppGroupsThumbUrl = @"thumb_url";
NSString *const kPDDMobileAppGroupsGoodsName = @"goods_name";
NSString *const kPDDMobileAppGroupsDesc = @"desc";
NSString *const kPDDMobileAppGroupsGoodsId = @"goods_id";


@interface PDDMobileAppGroups ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PDDMobileAppGroups

@synthesize endTime = _endTime;
@synthesize banner = _banner;
@synthesize groupId = _groupId;
@synthesize startTime = _startTime;
@synthesize thumbUrl = _thumbUrl;
@synthesize goodsName = _goodsName;
@synthesize desc = _desc;
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
            self.endTime = [[self objectOrNilForKey:kPDDMobileAppGroupsEndTime fromDictionary:dict] doubleValue];
            self.banner = [self objectOrNilForKey:kPDDMobileAppGroupsBanner fromDictionary:dict];
            self.groupId = [[self objectOrNilForKey:kPDDMobileAppGroupsGroupId fromDictionary:dict] doubleValue];
            self.startTime = [[self objectOrNilForKey:kPDDMobileAppGroupsStartTime fromDictionary:dict] doubleValue];
            self.thumbUrl = [self objectOrNilForKey:kPDDMobileAppGroupsThumbUrl fromDictionary:dict];
            self.goodsName = [self objectOrNilForKey:kPDDMobileAppGroupsGoodsName fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kPDDMobileAppGroupsDesc fromDictionary:dict];
            self.goodsId = [[self objectOrNilForKey:kPDDMobileAppGroupsGoodsId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endTime] forKey:kPDDMobileAppGroupsEndTime];
    [mutableDict setValue:self.banner forKey:kPDDMobileAppGroupsBanner];
    [mutableDict setValue:[NSNumber numberWithDouble:self.groupId] forKey:kPDDMobileAppGroupsGroupId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.startTime] forKey:kPDDMobileAppGroupsStartTime];
    [mutableDict setValue:self.thumbUrl forKey:kPDDMobileAppGroupsThumbUrl];
    [mutableDict setValue:self.goodsName forKey:kPDDMobileAppGroupsGoodsName];
    [mutableDict setValue:self.desc forKey:kPDDMobileAppGroupsDesc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsId] forKey:kPDDMobileAppGroupsGoodsId];

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

    self.endTime = [aDecoder decodeDoubleForKey:kPDDMobileAppGroupsEndTime];
    self.banner = [aDecoder decodeObjectForKey:kPDDMobileAppGroupsBanner];
    self.groupId = [aDecoder decodeDoubleForKey:kPDDMobileAppGroupsGroupId];
    self.startTime = [aDecoder decodeDoubleForKey:kPDDMobileAppGroupsStartTime];
    self.thumbUrl = [aDecoder decodeObjectForKey:kPDDMobileAppGroupsThumbUrl];
    self.goodsName = [aDecoder decodeObjectForKey:kPDDMobileAppGroupsGoodsName];
    self.desc = [aDecoder decodeObjectForKey:kPDDMobileAppGroupsDesc];
    self.goodsId = [aDecoder decodeDoubleForKey:kPDDMobileAppGroupsGoodsId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_endTime forKey:kPDDMobileAppGroupsEndTime];
    [aCoder encodeObject:_banner forKey:kPDDMobileAppGroupsBanner];
    [aCoder encodeDouble:_groupId forKey:kPDDMobileAppGroupsGroupId];
    [aCoder encodeDouble:_startTime forKey:kPDDMobileAppGroupsStartTime];
    [aCoder encodeObject:_thumbUrl forKey:kPDDMobileAppGroupsThumbUrl];
    [aCoder encodeObject:_goodsName forKey:kPDDMobileAppGroupsGoodsName];
    [aCoder encodeObject:_desc forKey:kPDDMobileAppGroupsDesc];
    [aCoder encodeDouble:_goodsId forKey:kPDDMobileAppGroupsGoodsId];
}

- (id)copyWithZone:(NSZone *)zone
{
    PDDMobileAppGroups *copy = [[PDDMobileAppGroups alloc] init];
    
    if (copy) {

        copy.endTime = self.endTime;
        copy.banner = [self.banner copyWithZone:zone];
        copy.groupId = self.groupId;
        copy.startTime = self.startTime;
        copy.thumbUrl = [self.thumbUrl copyWithZone:zone];
        copy.goodsName = [self.goodsName copyWithZone:zone];
        copy.desc = [self.desc copyWithZone:zone];
        copy.goodsId = self.goodsId;
    }
    
    return copy;
}


@end
