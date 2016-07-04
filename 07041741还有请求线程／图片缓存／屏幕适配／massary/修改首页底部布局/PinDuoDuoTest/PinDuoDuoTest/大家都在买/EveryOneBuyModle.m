//
//  EveryOneBuyModle.m
//
//  Created by   on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "EveryOneBuyModle.h"
#import "EveryOneGoodsList.h"


NSString *const kEveryOneBuyModleGoodsList = @"goods_list";
NSString *const kEveryOneBuyModleFavoriteUpdateTime = @"favorite_update_time";
NSString *const kEveryOneBuyModleServerTime = @"server_time";


@interface EveryOneBuyModle ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation EveryOneBuyModle

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
    NSObject *receivedEveryOneGoodsList = [dict objectForKey:kEveryOneBuyModleGoodsList];
    NSMutableArray *parsedEveryOneGoodsList = [NSMutableArray array];
    if ([receivedEveryOneGoodsList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedEveryOneGoodsList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedEveryOneGoodsList addObject:[EveryOneGoodsList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedEveryOneGoodsList isKindOfClass:[NSDictionary class]]) {
       [parsedEveryOneGoodsList addObject:[EveryOneGoodsList modelObjectWithDictionary:(NSDictionary *)receivedEveryOneGoodsList]];
    }

    self.goodsList = [NSArray arrayWithArray:parsedEveryOneGoodsList];
            self.favoriteUpdateTime = [[self objectOrNilForKey:kEveryOneBuyModleFavoriteUpdateTime fromDictionary:dict] doubleValue];
            self.serverTime = [[self objectOrNilForKey:kEveryOneBuyModleServerTime fromDictionary:dict] doubleValue];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGoodsList] forKey:kEveryOneBuyModleGoodsList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.favoriteUpdateTime] forKey:kEveryOneBuyModleFavoriteUpdateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serverTime] forKey:kEveryOneBuyModleServerTime];

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

    self.goodsList = [aDecoder decodeObjectForKey:kEveryOneBuyModleGoodsList];
    self.favoriteUpdateTime = [aDecoder decodeDoubleForKey:kEveryOneBuyModleFavoriteUpdateTime];
    self.serverTime = [aDecoder decodeDoubleForKey:kEveryOneBuyModleServerTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_goodsList forKey:kEveryOneBuyModleGoodsList];
    [aCoder encodeDouble:_favoriteUpdateTime forKey:kEveryOneBuyModleFavoriteUpdateTime];
    [aCoder encodeDouble:_serverTime forKey:kEveryOneBuyModleServerTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    EveryOneBuyModle *copy = [[EveryOneBuyModle alloc] init];
    
    if (copy) {

        copy.goodsList = [self.goodsList copyWithZone:zone];
        copy.favoriteUpdateTime = self.favoriteUpdateTime;
        copy.serverTime = self.serverTime;
    }
    
    return copy;
}


@end
