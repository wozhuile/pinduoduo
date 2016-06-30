//
//  PDDGroup.m
//
//  Created by   on 16/6/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PDDGroup.h"


NSString *const kPDDGroupPrice = @"price";
NSString *const kPDDGroupCustomerNum = @"customer_num";


@interface PDDGroup ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PDDGroup

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
            self.price = [[self objectOrNilForKey:kPDDGroupPrice fromDictionary:dict] doubleValue];
            self.customerNum = [[self objectOrNilForKey:kPDDGroupCustomerNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kPDDGroupPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerNum] forKey:kPDDGroupCustomerNum];

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

    self.price = [aDecoder decodeDoubleForKey:kPDDGroupPrice];
    self.customerNum = [aDecoder decodeDoubleForKey:kPDDGroupCustomerNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_price forKey:kPDDGroupPrice];
    [aCoder encodeDouble:_customerNum forKey:kPDDGroupCustomerNum];
}

- (id)copyWithZone:(NSZone *)zone
{
    PDDGroup *copy = [[PDDGroup alloc] init];
    
    if (copy) {

        copy.price = self.price;
        copy.customerNum = self.customerNum;
    }
    
    return copy;
}


@end
