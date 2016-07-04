//
//  EveryOneGroup.m
//
//  Created by   on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "EveryOneGroup.h"


NSString *const kEveryOneGroupPrice = @"price";
NSString *const kEveryOneGroupCustomerNum = @"customer_num";


@interface EveryOneGroup ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation EveryOneGroup

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
            self.price = [[self objectOrNilForKey:kEveryOneGroupPrice fromDictionary:dict] doubleValue];
            self.customerNum = [[self objectOrNilForKey:kEveryOneGroupCustomerNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kEveryOneGroupPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerNum] forKey:kEveryOneGroupCustomerNum];

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

    self.price = [aDecoder decodeDoubleForKey:kEveryOneGroupPrice];
    self.customerNum = [aDecoder decodeDoubleForKey:kEveryOneGroupCustomerNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_price forKey:kEveryOneGroupPrice];
    [aCoder encodeDouble:_customerNum forKey:kEveryOneGroupCustomerNum];
}

- (id)copyWithZone:(NSZone *)zone
{
    EveryOneGroup *copy = [[EveryOneGroup alloc] init];
    
    if (copy) {

        copy.price = self.price;
        copy.customerNum = self.customerNum;
    }
    
    return copy;
}


@end
