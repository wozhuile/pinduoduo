//
//  PDDRankDataModel.m
//
//  Created by   on 16/6/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PDDRankDataModel.h"
#import "PDDCountryList.h"
#import "PDDPromotionList.h"
#import "PDDGoodsList.h"


NSString *const kPDDRankDataModelFavoriteUpdateTime = @"favorite_update_time";
NSString *const kPDDRankDataModelServerTime = @"server_time";
NSString *const kPDDRankDataModelCountryList = @"country_list";
NSString *const kPDDRankDataModelPromotionList = @"promotion_list";
NSString *const kPDDRankDataModelGoodsList = @"goods_list";
NSString *const kPDDRankDataModelHomeRecommendSubjects = @"home_recommend_subjects";


@interface PDDRankDataModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PDDRankDataModel

@synthesize favoriteUpdateTime = _favoriteUpdateTime;
@synthesize serverTime = _serverTime;
@synthesize countryList = _countryList;
@synthesize promotionList = _promotionList;
@synthesize goodsList = _goodsList;
@synthesize homeRecommendSubjects = _homeRecommendSubjects;


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
            self.favoriteUpdateTime = [[self objectOrNilForKey:kPDDRankDataModelFavoriteUpdateTime fromDictionary:dict] doubleValue];
            self.serverTime = [[self objectOrNilForKey:kPDDRankDataModelServerTime fromDictionary:dict] doubleValue];
    NSObject *receivedPDDCountryList = [dict objectForKey:kPDDRankDataModelCountryList];
    NSMutableArray *parsedPDDCountryList = [NSMutableArray array];
    if ([receivedPDDCountryList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedPDDCountryList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPDDCountryList addObject:[PDDCountryList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedPDDCountryList isKindOfClass:[NSDictionary class]]) {
       [parsedPDDCountryList addObject:[PDDCountryList modelObjectWithDictionary:(NSDictionary *)receivedPDDCountryList]];
    }

    self.countryList = [NSArray arrayWithArray:parsedPDDCountryList];
    NSObject *receivedPDDPromotionList = [dict objectForKey:kPDDRankDataModelPromotionList];
    NSMutableArray *parsedPDDPromotionList = [NSMutableArray array];
    if ([receivedPDDPromotionList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedPDDPromotionList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPDDPromotionList addObject:[PDDPromotionList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedPDDPromotionList isKindOfClass:[NSDictionary class]]) {
       [parsedPDDPromotionList addObject:[PDDPromotionList modelObjectWithDictionary:(NSDictionary *)receivedPDDPromotionList]];
    }

    self.promotionList = [NSArray arrayWithArray:parsedPDDPromotionList];
    NSObject *receivedPDDGoodsList = [dict objectForKey:kPDDRankDataModelGoodsList];
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
            self.homeRecommendSubjects = [self objectOrNilForKey:kPDDRankDataModelHomeRecommendSubjects fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.favoriteUpdateTime] forKey:kPDDRankDataModelFavoriteUpdateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serverTime] forKey:kPDDRankDataModelServerTime];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCountryList] forKey:kPDDRankDataModelCountryList];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPromotionList] forKey:kPDDRankDataModelPromotionList];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGoodsList] forKey:kPDDRankDataModelGoodsList];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHomeRecommendSubjects] forKey:kPDDRankDataModelHomeRecommendSubjects];

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

    self.favoriteUpdateTime = [aDecoder decodeDoubleForKey:kPDDRankDataModelFavoriteUpdateTime];
    self.serverTime = [aDecoder decodeDoubleForKey:kPDDRankDataModelServerTime];
    self.countryList = [aDecoder decodeObjectForKey:kPDDRankDataModelCountryList];
    self.promotionList = [aDecoder decodeObjectForKey:kPDDRankDataModelPromotionList];
    self.goodsList = [aDecoder decodeObjectForKey:kPDDRankDataModelGoodsList];
    self.homeRecommendSubjects = [aDecoder decodeObjectForKey:kPDDRankDataModelHomeRecommendSubjects];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_favoriteUpdateTime forKey:kPDDRankDataModelFavoriteUpdateTime];
    [aCoder encodeDouble:_serverTime forKey:kPDDRankDataModelServerTime];
    [aCoder encodeObject:_countryList forKey:kPDDRankDataModelCountryList];
    [aCoder encodeObject:_promotionList forKey:kPDDRankDataModelPromotionList];
    [aCoder encodeObject:_goodsList forKey:kPDDRankDataModelGoodsList];
    [aCoder encodeObject:_homeRecommendSubjects forKey:kPDDRankDataModelHomeRecommendSubjects];
}

- (id)copyWithZone:(NSZone *)zone
{
    PDDRankDataModel *copy = [[PDDRankDataModel alloc] init];
    
    if (copy) {

        copy.favoriteUpdateTime = self.favoriteUpdateTime;
        copy.serverTime = self.serverTime;
        copy.countryList = [self.countryList copyWithZone:zone];
        copy.promotionList = [self.promotionList copyWithZone:zone];
        copy.goodsList = [self.goodsList copyWithZone:zone];
        copy.homeRecommendSubjects = [self.homeRecommendSubjects copyWithZone:zone];
    }
    
    return copy;
}


@end
