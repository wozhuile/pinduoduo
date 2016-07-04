//
//  RankGroup.m
//
//  Created by   on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RankGroup.h"


NSString *const kRankGroupPrice = @"price";
NSString *const kRankGroupCustomerNum = @"customer_num";


@interface RankGroup ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RankGroup

@synthesize price = _price;
@synthesize customerNum = _customerNum;


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
            self.price = [[self objectOrNilForKey:kRankGroupPrice fromDictionary:dict] doubleValue];
            self.customerNum = [[self objectOrNilForKey:kRankGroupCustomerNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kRankGroupPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerNum] forKey:kRankGroupCustomerNum];

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

    self.price = [aDecoder decodeDoubleForKey:kRankGroupPrice];
    self.customerNum = [aDecoder decodeDoubleForKey:kRankGroupCustomerNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_price forKey:kRankGroupPrice];
    [aCoder encodeDouble:_customerNum forKey:kRankGroupCustomerNum];
}

- (id)copyWithZone:(NSZone *)zone
{
    RankGroup *copy = [[RankGroup alloc] init];
    
    if (copy) {

        copy.price = self.price;
        copy.customerNum = self.customerNum;
    }
    
    return copy;
}


@end
