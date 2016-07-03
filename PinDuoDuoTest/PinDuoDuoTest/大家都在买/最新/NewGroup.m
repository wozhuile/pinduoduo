//
//  NewGroup.m
//
//  Created by   on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewGroup.h"


NSString *const kNewGroupPrice = @"price";
NSString *const kNewGroupCustomerNum = @"customer_num";


@interface NewGroup ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewGroup

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
            self.price = [[self objectOrNilForKey:kNewGroupPrice fromDictionary:dict] doubleValue];
            self.customerNum = [[self objectOrNilForKey:kNewGroupCustomerNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kNewGroupPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerNum] forKey:kNewGroupCustomerNum];

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

    self.price = [aDecoder decodeDoubleForKey:kNewGroupPrice];
    self.customerNum = [aDecoder decodeDoubleForKey:kNewGroupCustomerNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_price forKey:kNewGroupPrice];
    [aCoder encodeDouble:_customerNum forKey:kNewGroupCustomerNum];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewGroup *copy = [[NewGroup alloc] init];
    
    if (copy) {

        copy.price = self.price;
        copy.customerNum = self.customerNum;
    }
    
    return copy;
}


@end
