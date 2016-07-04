//
//  PDDHomeData.m
//
//  Created by   on 16/6/27
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PDDHomeData.h"
#import "PDDHomeRecommendSubjects.h"
#import "PDDHomeSuperBrand.h"
#import "PDDGoodsList.h"
#import "PDDMobileAppGroups.h"


NSString *const kPDDHomeDataFavoriteUpdateTime = @"favorite_update_time";
NSString *const kPDDHomeDataHomeRecommendSubjects = @"home_recommend_subjects";
NSString *const kPDDHomeDataHomeSuperBrand = @"home_super_brand";
NSString *const kPDDHomeDataGoodsList = @"goods_list";
NSString *const kPDDHomeDataMobileAppGroups = @"mobile_app_groups";
NSString *const kPDDHomeDataServerTime = @"server_time";


@interface PDDHomeData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PDDHomeData

@synthesize favoriteUpdateTime = _favoriteUpdateTime;
@synthesize homeRecommendSubjects = _homeRecommendSubjects;
@synthesize homeSuperBrand = _homeSuperBrand;
@synthesize goodsList = _goodsList;
@synthesize mobileAppGroups = _mobileAppGroups;
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
            self.favoriteUpdateTime = [[self objectOrNilForKey:kPDDHomeDataFavoriteUpdateTime fromDictionary:dict] doubleValue];
    NSObject *receivedPDDHomeRecommendSubjects = [dict objectForKey:kPDDHomeDataHomeRecommendSubjects];
    NSMutableArray *parsedPDDHomeRecommendSubjects = [NSMutableArray array];
    if ([receivedPDDHomeRecommendSubjects isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedPDDHomeRecommendSubjects) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPDDHomeRecommendSubjects addObject:[PDDHomeRecommendSubjects modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedPDDHomeRecommendSubjects isKindOfClass:[NSDictionary class]]) {
       [parsedPDDHomeRecommendSubjects addObject:[PDDHomeRecommendSubjects modelObjectWithDictionary:(NSDictionary *)receivedPDDHomeRecommendSubjects]];
    }

    self.homeRecommendSubjects = [NSArray arrayWithArray:parsedPDDHomeRecommendSubjects];
            self.homeSuperBrand = [PDDHomeSuperBrand modelObjectWithDictionary:[dict objectForKey:kPDDHomeDataHomeSuperBrand]];
    NSObject *receivedPDDGoodsList = [dict objectForKey:kPDDHomeDataGoodsList];
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
    NSObject *receivedPDDMobileAppGroups = [dict objectForKey:kPDDHomeDataMobileAppGroups];
    NSMutableArray *parsedPDDMobileAppGroups = [NSMutableArray array];
    if ([receivedPDDMobileAppGroups isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedPDDMobileAppGroups) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPDDMobileAppGroups addObject:[PDDMobileAppGroups modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedPDDMobileAppGroups isKindOfClass:[NSDictionary class]]) {
       [parsedPDDMobileAppGroups addObject:[PDDMobileAppGroups modelObjectWithDictionary:(NSDictionary *)receivedPDDMobileAppGroups]];
    }

    self.mobileAppGroups = [NSArray arrayWithArray:parsedPDDMobileAppGroups];
            self.serverTime = [[self objectOrNilForKey:kPDDHomeDataServerTime fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.favoriteUpdateTime] forKey:kPDDHomeDataFavoriteUpdateTime];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHomeRecommendSubjects] forKey:kPDDHomeDataHomeRecommendSubjects];
    [mutableDict setValue:[self.homeSuperBrand dictionaryRepresentation] forKey:kPDDHomeDataHomeSuperBrand];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGoodsList] forKey:kPDDHomeDataGoodsList];
    NSMutableArray *tempArrayForMobileAppGroups = [NSMutableArray array];
    for (NSObject *subArrayObject in self.mobileAppGroups) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMobileAppGroups addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMobileAppGroups addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMobileAppGroups] forKey:kPDDHomeDataMobileAppGroups];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serverTime] forKey:kPDDHomeDataServerTime];

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

    self.favoriteUpdateTime = [aDecoder decodeDoubleForKey:kPDDHomeDataFavoriteUpdateTime];
    self.homeRecommendSubjects = [aDecoder decodeObjectForKey:kPDDHomeDataHomeRecommendSubjects];
    self.homeSuperBrand = [aDecoder decodeObjectForKey:kPDDHomeDataHomeSuperBrand];
    self.goodsList = [aDecoder decodeObjectForKey:kPDDHomeDataGoodsList];
    self.mobileAppGroups = [aDecoder decodeObjectForKey:kPDDHomeDataMobileAppGroups];
    self.serverTime = [aDecoder decodeDoubleForKey:kPDDHomeDataServerTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_favoriteUpdateTime forKey:kPDDHomeDataFavoriteUpdateTime];
    [aCoder encodeObject:_homeRecommendSubjects forKey:kPDDHomeDataHomeRecommendSubjects];
    [aCoder encodeObject:_homeSuperBrand forKey:kPDDHomeDataHomeSuperBrand];
    [aCoder encodeObject:_goodsList forKey:kPDDHomeDataGoodsList];
    [aCoder encodeObject:_mobileAppGroups forKey:kPDDHomeDataMobileAppGroups];
    [aCoder encodeDouble:_serverTime forKey:kPDDHomeDataServerTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    PDDHomeData *copy = [[PDDHomeData alloc] init];
    
    if (copy) {

        copy.favoriteUpdateTime = self.favoriteUpdateTime;
        copy.homeRecommendSubjects = [self.homeRecommendSubjects copyWithZone:zone];
        copy.homeSuperBrand = [self.homeSuperBrand copyWithZone:zone];
        copy.goodsList = [self.goodsList copyWithZone:zone];
        copy.mobileAppGroups = [self.mobileAppGroups copyWithZone:zone];
        copy.serverTime = self.serverTime;
    }
    
    return copy;
}


@end
