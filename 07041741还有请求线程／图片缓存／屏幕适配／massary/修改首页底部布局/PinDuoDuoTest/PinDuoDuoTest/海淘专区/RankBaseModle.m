//
//  RankBaseModle.m
//
//  Created by   on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RankBaseModle.h"
#import "RankCountryList.h"
#import "RankPromotionList.h"
#import "RankGoodsList.h"


NSString *const kRankBaseModleFavoriteUpdateTime = @"favorite_update_time";
NSString *const kRankBaseModleHomeRecommendSubjects = @"home_recommend_subjects";
NSString *const kRankBaseModleCountryList = @"country_list";
NSString *const kRankBaseModlePromotionList = @"promotion_list";
NSString *const kRankBaseModleGoodsList = @"goods_list";
NSString *const kRankBaseModleServerTime = @"server_time";


@interface RankBaseModle ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RankBaseModle

@synthesize favoriteUpdateTime = _favoriteUpdateTime;
@synthesize homeRecommendSubjects = _homeRecommendSubjects;
@synthesize countryList = _countryList;
@synthesize promotionList = _promotionList;
@synthesize goodsList = _goodsList;
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
            self.favoriteUpdateTime = [[self objectOrNilForKey:kRankBaseModleFavoriteUpdateTime fromDictionary:dict] doubleValue];
            self.homeRecommendSubjects = [self objectOrNilForKey:kRankBaseModleHomeRecommendSubjects fromDictionary:dict];
    NSObject *receivedRankCountryList = [dict objectForKey:kRankBaseModleCountryList];
    NSMutableArray *parsedRankCountryList = [NSMutableArray array];
    if ([receivedRankCountryList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRankCountryList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRankCountryList addObject:[RankCountryList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRankCountryList isKindOfClass:[NSDictionary class]]) {
       [parsedRankCountryList addObject:[RankCountryList modelObjectWithDictionary:(NSDictionary *)receivedRankCountryList]];
    }

    self.countryList = [NSArray arrayWithArray:parsedRankCountryList];
    NSObject *receivedRankPromotionList = [dict objectForKey:kRankBaseModlePromotionList];
    NSMutableArray *parsedRankPromotionList = [NSMutableArray array];
    if ([receivedRankPromotionList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRankPromotionList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRankPromotionList addObject:[RankPromotionList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRankPromotionList isKindOfClass:[NSDictionary class]]) {
       [parsedRankPromotionList addObject:[RankPromotionList modelObjectWithDictionary:(NSDictionary *)receivedRankPromotionList]];
    }

    self.promotionList = [NSArray arrayWithArray:parsedRankPromotionList];
    NSObject *receivedRankGoodsList = [dict objectForKey:kRankBaseModleGoodsList];
    NSMutableArray *parsedRankGoodsList = [NSMutableArray array];
    if ([receivedRankGoodsList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRankGoodsList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRankGoodsList addObject:[RankGoodsList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRankGoodsList isKindOfClass:[NSDictionary class]]) {
       [parsedRankGoodsList addObject:[RankGoodsList modelObjectWithDictionary:(NSDictionary *)receivedRankGoodsList]];
    }

    self.goodsList = [NSArray arrayWithArray:parsedRankGoodsList];
            self.serverTime = [[self objectOrNilForKey:kRankBaseModleServerTime fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.favoriteUpdateTime] forKey:kRankBaseModleFavoriteUpdateTime];
    NSMutableArray *tempArrayForHomeRecommendSubjects = [NSMutableArray array];
    for (NSObject *subArrayObject in self.homeRecommendSubjects) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHomeRecommendSubjects addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHomeRecommendSubjects addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHomeRecommendSubjects] forKey:kRankBaseModleHomeRecommendSubjects];
    NSMutableArray *tempArrayForCountryList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.countryList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCountryList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCountryList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCountryList] forKey:kRankBaseModleCountryList];
    NSMutableArray *tempArrayForPromotionList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.promotionList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPromotionList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPromotionList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPromotionList] forKey:kRankBaseModlePromotionList];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGoodsList] forKey:kRankBaseModleGoodsList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serverTime] forKey:kRankBaseModleServerTime];

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

    self.favoriteUpdateTime = [aDecoder decodeDoubleForKey:kRankBaseModleFavoriteUpdateTime];
    self.homeRecommendSubjects = [aDecoder decodeObjectForKey:kRankBaseModleHomeRecommendSubjects];
    self.countryList = [aDecoder decodeObjectForKey:kRankBaseModleCountryList];
    self.promotionList = [aDecoder decodeObjectForKey:kRankBaseModlePromotionList];
    self.goodsList = [aDecoder decodeObjectForKey:kRankBaseModleGoodsList];
    self.serverTime = [aDecoder decodeDoubleForKey:kRankBaseModleServerTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_favoriteUpdateTime forKey:kRankBaseModleFavoriteUpdateTime];
    [aCoder encodeObject:_homeRecommendSubjects forKey:kRankBaseModleHomeRecommendSubjects];
    [aCoder encodeObject:_countryList forKey:kRankBaseModleCountryList];
    [aCoder encodeObject:_promotionList forKey:kRankBaseModlePromotionList];
    [aCoder encodeObject:_goodsList forKey:kRankBaseModleGoodsList];
    [aCoder encodeDouble:_serverTime forKey:kRankBaseModleServerTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    RankBaseModle *copy = [[RankBaseModle alloc] init];
    
    if (copy) {

        copy.favoriteUpdateTime = self.favoriteUpdateTime;
        copy.homeRecommendSubjects = [self.homeRecommendSubjects copyWithZone:zone];
        copy.countryList = [self.countryList copyWithZone:zone];
        copy.promotionList = [self.promotionList copyWithZone:zone];
        copy.goodsList = [self.goodsList copyWithZone:zone];
        copy.serverTime = self.serverTime;
    }
    
    return copy;
}


@end
