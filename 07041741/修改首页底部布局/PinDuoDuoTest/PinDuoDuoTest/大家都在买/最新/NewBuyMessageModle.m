//
//  NewBuyMessageModle.m
//
//  Created by   on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewBuyMessageModle.h"
#import "NewGoodsList.h"


NSString *const kNewBuyMessageModleGoodsList = @"goods_list";
NSString *const kNewBuyMessageModleFavoriteUpdateTime = @"favorite_update_time";
NSString *const kNewBuyMessageModleServerTime = @"server_time";


@interface NewBuyMessageModle ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewBuyMessageModle

@synthesize goodsList = _goodsList;
@synthesize favoriteUpdateTime = _favoriteUpdateTime;
@synthesize serverTime = _serverTime;


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
    NSObject *receivedNewGoodsList = [dict objectForKey:kNewBuyMessageModleGoodsList];
    NSMutableArray *parsedNewGoodsList = [NSMutableArray array];
    if ([receivedNewGoodsList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNewGoodsList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNewGoodsList addObject:[NewGoodsList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNewGoodsList isKindOfClass:[NSDictionary class]]) {
       [parsedNewGoodsList addObject:[NewGoodsList modelObjectWithDictionary:(NSDictionary *)receivedNewGoodsList]];
    }

    self.goodsList = [NSArray arrayWithArray:parsedNewGoodsList];
            self.favoriteUpdateTime = [[self objectOrNilForKey:kNewBuyMessageModleFavoriteUpdateTime fromDictionary:dict] doubleValue];
            self.serverTime = [[self objectOrNilForKey:kNewBuyMessageModleServerTime fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForGoodsList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.goodsList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForGoodsList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForGoodsList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGoodsList] forKey:kNewBuyMessageModleGoodsList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.favoriteUpdateTime] forKey:kNewBuyMessageModleFavoriteUpdateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serverTime] forKey:kNewBuyMessageModleServerTime];

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

    self.goodsList = [aDecoder decodeObjectForKey:kNewBuyMessageModleGoodsList];
    self.favoriteUpdateTime = [aDecoder decodeDoubleForKey:kNewBuyMessageModleFavoriteUpdateTime];
    self.serverTime = [aDecoder decodeDoubleForKey:kNewBuyMessageModleServerTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_goodsList forKey:kNewBuyMessageModleGoodsList];
    [aCoder encodeDouble:_favoriteUpdateTime forKey:kNewBuyMessageModleFavoriteUpdateTime];
    [aCoder encodeDouble:_serverTime forKey:kNewBuyMessageModleServerTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewBuyMessageModle *copy = [[NewBuyMessageModle alloc] init];
    
    if (copy) {

        copy.goodsList = [self.goodsList copyWithZone:zone];
        copy.favoriteUpdateTime = self.favoriteUpdateTime;
        copy.serverTime = self.serverTime;
    }
    
    return copy;
}


@end
