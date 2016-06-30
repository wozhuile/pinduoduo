//
//  PDDEveryBodyModel.m
//
//  Created by   on 16/6/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PDDEveryBodyModel.h"
#import "PDDGoodsList.h"


NSString *const kPDDEveryBodyModelGoodsList = @"goods_list";
NSString *const kPDDEveryBodyModelFavoriteUpdateTime = @"favorite_update_time";
NSString *const kPDDEveryBodyModelServerTime = @"server_time";


@interface PDDEveryBodyModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PDDEveryBodyModel

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
    NSObject *receivedPDDGoodsList = [dict objectForKey:kPDDEveryBodyModelGoodsList];
    NSMutableArray *parsedPDDGoodsList = [NSMutableArray array];
    if ([receivedPDDGoodsList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedPDDGoodsList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPDDGoodsList addObject:[PDDGoodsList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedPDDGoodsList isKindOfClass:[NSDictionary class]]) {
       [parsedPDDGoodsList addObject:[PDDGoodsList modelObjectWithDictionary:(NSDictionary *)receivedPDDGoodsList]];
    }

    self.goodsList = [NSArray arrayWithArray:parsedPDDGoodsList];
            self.favoriteUpdateTime = [[self objectOrNilForKey:kPDDEveryBodyModelFavoriteUpdateTime fromDictionary:dict] doubleValue];
            self.serverTime = [[self objectOrNilForKey:kPDDEveryBodyModelServerTime fromDictionary:dict] doubleValue];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGoodsList] forKey:kPDDEveryBodyModelGoodsList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.favoriteUpdateTime] forKey:kPDDEveryBodyModelFavoriteUpdateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serverTime] forKey:kPDDEveryBodyModelServerTime];

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

    self.goodsList = [aDecoder decodeObjectForKey:kPDDEveryBodyModelGoodsList];
    self.favoriteUpdateTime = [aDecoder decodeDoubleForKey:kPDDEveryBodyModelFavoriteUpdateTime];
    self.serverTime = [aDecoder decodeDoubleForKey:kPDDEveryBodyModelServerTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_goodsList forKey:kPDDEveryBodyModelGoodsList];
    [aCoder encodeDouble:_favoriteUpdateTime forKey:kPDDEveryBodyModelFavoriteUpdateTime];
    [aCoder encodeDouble:_serverTime forKey:kPDDEveryBodyModelServerTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    PDDEveryBodyModel *copy = [[PDDEveryBodyModel alloc] init];
    
    if (copy) {

        copy.goodsList = [self.goodsList copyWithZone:zone];
        copy.favoriteUpdateTime = self.favoriteUpdateTime;
        copy.serverTime = self.serverTime;
    }
    
    return copy;
}


@end
