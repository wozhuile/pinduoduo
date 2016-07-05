//
//  PURCHARSDataModle.m
//
//  Created by   on 16/7/5
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PURCHARSDataModle.h"
#import "PURCHARSGoods.h"


NSString *const kPURCHARSDataModleGoods = @"goods";
NSString *const kPURCHARSDataModleServerTime = @"server_time";


@interface PURCHARSDataModle ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PURCHARSDataModle

@synthesize goods = _goods;
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
    NSObject *receivedPURCHARSGoods = [dict objectForKey:kPURCHARSDataModleGoods];
    NSMutableArray *parsedPURCHARSGoods = [NSMutableArray array];
    if ([receivedPURCHARSGoods isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedPURCHARSGoods) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPURCHARSGoods addObject:[PURCHARSGoods modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedPURCHARSGoods isKindOfClass:[NSDictionary class]]) {
       [parsedPURCHARSGoods addObject:[PURCHARSGoods modelObjectWithDictionary:(NSDictionary *)receivedPURCHARSGoods]];
    }

    self.goods = [NSArray arrayWithArray:parsedPURCHARSGoods];
            self.serverTime = [[self objectOrNilForKey:kPURCHARSDataModleServerTime fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForGoods = [NSMutableArray array];
    for (NSObject *subArrayObject in self.goods) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForGoods addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForGoods addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGoods] forKey:kPURCHARSDataModleGoods];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serverTime] forKey:kPURCHARSDataModleServerTime];

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

    self.goods = [aDecoder decodeObjectForKey:kPURCHARSDataModleGoods];
    self.serverTime = [aDecoder decodeDoubleForKey:kPURCHARSDataModleServerTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_goods forKey:kPURCHARSDataModleGoods];
    [aCoder encodeDouble:_serverTime forKey:kPURCHARSDataModleServerTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    PURCHARSDataModle *copy = [[PURCHARSDataModle alloc] init];
    
    if (copy) {

        copy.goods = [self.goods copyWithZone:zone];
        copy.serverTime = self.serverTime;
    }
    
    return copy;
}


@end
