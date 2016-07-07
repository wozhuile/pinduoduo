//
//  HomeGroup.m
//
//  Created by   on 16/7/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HomeGroup.h"


NSString *const kHomeGroupEndTime = @"end_time";
NSString *const kHomeGroupCustomerNum = @"customer_num";
NSString *const kHomeGroupBuyLimit = @"buy_limit";
NSString *const kHomeGroupId = @"id";
NSString *const kHomeGroupPrice = @"price";
NSString *const kHomeGroupStartTime = @"start_time";
NSString *const kHomeGroupGroupId = @"group_id";
NSString *const kHomeGroupDuration = @"duration";
NSString *const kHomeGroupOrderLimit = @"order_limit";
NSString *const kHomeGroupIsOpen = @"is_open";
NSString *const kHomeGroupGoodsId = @"goods_id";


@interface HomeGroup ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeGroup

@synthesize endTime = _endTime;
@synthesize customerNum = _customerNum;
@synthesize buyLimit = _buyLimit;
@synthesize groupIdentifier = _groupIdentifier;
@synthesize price = _price;
@synthesize startTime = _startTime;
@synthesize groupId = _groupId;
@synthesize duration = _duration;
@synthesize orderLimit = _orderLimit;
@synthesize isOpen = _isOpen;
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
            self.endTime = [[self objectOrNilForKey:kHomeGroupEndTime fromDictionary:dict] doubleValue];
            self.customerNum = [[self objectOrNilForKey:kHomeGroupCustomerNum fromDictionary:dict] doubleValue];
            self.buyLimit = [[self objectOrNilForKey:kHomeGroupBuyLimit fromDictionary:dict] doubleValue];
            self.groupIdentifier = [[self objectOrNilForKey:kHomeGroupId fromDictionary:dict] doubleValue];
            self.price = [[self objectOrNilForKey:kHomeGroupPrice fromDictionary:dict] doubleValue];
            self.startTime = [[self objectOrNilForKey:kHomeGroupStartTime fromDictionary:dict] doubleValue];
            self.groupId = [[self objectOrNilForKey:kHomeGroupGroupId fromDictionary:dict] doubleValue];
            self.duration = [[self objectOrNilForKey:kHomeGroupDuration fromDictionary:dict] doubleValue];
            self.orderLimit = [[self objectOrNilForKey:kHomeGroupOrderLimit fromDictionary:dict] doubleValue];
            self.isOpen = [[self objectOrNilForKey:kHomeGroupIsOpen fromDictionary:dict] doubleValue];
            self.goodsId = [[self objectOrNilForKey:kHomeGroupGoodsId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endTime] forKey:kHomeGroupEndTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerNum] forKey:kHomeGroupCustomerNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.buyLimit] forKey:kHomeGroupBuyLimit];
    [mutableDict setValue:[NSNumber numberWithDouble:self.groupIdentifier] forKey:kHomeGroupId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kHomeGroupPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.startTime] forKey:kHomeGroupStartTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.groupId] forKey:kHomeGroupGroupId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.duration] forKey:kHomeGroupDuration];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderLimit] forKey:kHomeGroupOrderLimit];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isOpen] forKey:kHomeGroupIsOpen];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsId] forKey:kHomeGroupGoodsId];

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

    self.endTime = [aDecoder decodeDoubleForKey:kHomeGroupEndTime];
    self.customerNum = [aDecoder decodeDoubleForKey:kHomeGroupCustomerNum];
    self.buyLimit = [aDecoder decodeDoubleForKey:kHomeGroupBuyLimit];
    self.groupIdentifier = [aDecoder decodeDoubleForKey:kHomeGroupId];
    self.price = [aDecoder decodeDoubleForKey:kHomeGroupPrice];
    self.startTime = [aDecoder decodeDoubleForKey:kHomeGroupStartTime];
    self.groupId = [aDecoder decodeDoubleForKey:kHomeGroupGroupId];
    self.duration = [aDecoder decodeDoubleForKey:kHomeGroupDuration];
    self.orderLimit = [aDecoder decodeDoubleForKey:kHomeGroupOrderLimit];
    self.isOpen = [aDecoder decodeDoubleForKey:kHomeGroupIsOpen];
    self.goodsId = [aDecoder decodeDoubleForKey:kHomeGroupGoodsId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_endTime forKey:kHomeGroupEndTime];
    [aCoder encodeDouble:_customerNum forKey:kHomeGroupCustomerNum];
    [aCoder encodeDouble:_buyLimit forKey:kHomeGroupBuyLimit];
    [aCoder encodeDouble:_groupIdentifier forKey:kHomeGroupId];
    [aCoder encodeDouble:_price forKey:kHomeGroupPrice];
    [aCoder encodeDouble:_startTime forKey:kHomeGroupStartTime];
    [aCoder encodeDouble:_groupId forKey:kHomeGroupGroupId];
    [aCoder encodeDouble:_duration forKey:kHomeGroupDuration];
    [aCoder encodeDouble:_orderLimit forKey:kHomeGroupOrderLimit];
    [aCoder encodeDouble:_isOpen forKey:kHomeGroupIsOpen];
    [aCoder encodeDouble:_goodsId forKey:kHomeGroupGoodsId];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeGroup *copy = [[HomeGroup alloc] init];
    
    if (copy) {

        copy.endTime = self.endTime;
        copy.customerNum = self.customerNum;
        copy.buyLimit = self.buyLimit;
        copy.groupIdentifier = self.groupIdentifier;
        copy.price = self.price;
        copy.startTime = self.startTime;
        copy.groupId = self.groupId;
        copy.duration = self.duration;
        copy.orderLimit = self.orderLimit;
        copy.isOpen = self.isOpen;
        copy.goodsId = self.goodsId;
    }
    
    return copy;
}


@end
