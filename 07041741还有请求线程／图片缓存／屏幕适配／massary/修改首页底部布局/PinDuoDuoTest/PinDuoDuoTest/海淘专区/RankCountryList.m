//
//  RankCountryList.m
//
//  Created by   on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RankCountryList.h"


NSString *const kRankCountryListHomeBannerWidth = @"home_banner_width";
NSString *const kRankCountryListPosition = @"position";
NSString *const kRankCountryListHomeBannerHeight = @"home_banner_height";
NSString *const kRankCountryListSecondName = @"second_name";
NSString *const kRankCountryListSubject = @"subject";
NSString *const kRankCountryListSubjectId = @"subject_id";
NSString *const kRankCountryListType = @"type";
NSString *const kRankCountryListHomeBanner = @"home_banner";
NSString *const kRankCountryListDesc = @"desc";
NSString *const kRankCountryListShareImage = @"share_image";


@interface RankCountryList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RankCountryList

@synthesize homeBannerWidth = _homeBannerWidth;
@synthesize position = _position;
@synthesize homeBannerHeight = _homeBannerHeight;
@synthesize secondName = _secondName;
@synthesize subject = _subject;
@synthesize subjectId = _subjectId;
@synthesize type = _type;
@synthesize homeBanner = _homeBanner;
@synthesize desc = _desc;
@synthesize shareImage = _shareImage;


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
            self.homeBannerWidth = [[self objectOrNilForKey:kRankCountryListHomeBannerWidth fromDictionary:dict] doubleValue];
            self.position = [[self objectOrNilForKey:kRankCountryListPosition fromDictionary:dict] doubleValue];
            self.homeBannerHeight = [[self objectOrNilForKey:kRankCountryListHomeBannerHeight fromDictionary:dict] doubleValue];
            self.secondName = [self objectOrNilForKey:kRankCountryListSecondName fromDictionary:dict];
            self.subject = [self objectOrNilForKey:kRankCountryListSubject fromDictionary:dict];
            self.subjectId = [[self objectOrNilForKey:kRankCountryListSubjectId fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kRankCountryListType fromDictionary:dict];
            self.homeBanner = [self objectOrNilForKey:kRankCountryListHomeBanner fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kRankCountryListDesc fromDictionary:dict];
            self.shareImage = [self objectOrNilForKey:kRankCountryListShareImage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.homeBannerWidth] forKey:kRankCountryListHomeBannerWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.position] forKey:kRankCountryListPosition];
    [mutableDict setValue:[NSNumber numberWithDouble:self.homeBannerHeight] forKey:kRankCountryListHomeBannerHeight];
    [mutableDict setValue:self.secondName forKey:kRankCountryListSecondName];
    [mutableDict setValue:self.subject forKey:kRankCountryListSubject];
    [mutableDict setValue:[NSNumber numberWithDouble:self.subjectId] forKey:kRankCountryListSubjectId];
    [mutableDict setValue:self.type forKey:kRankCountryListType];
    [mutableDict setValue:self.homeBanner forKey:kRankCountryListHomeBanner];
    [mutableDict setValue:self.desc forKey:kRankCountryListDesc];
    [mutableDict setValue:self.shareImage forKey:kRankCountryListShareImage];

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

    self.homeBannerWidth = [aDecoder decodeDoubleForKey:kRankCountryListHomeBannerWidth];
    self.position = [aDecoder decodeDoubleForKey:kRankCountryListPosition];
    self.homeBannerHeight = [aDecoder decodeDoubleForKey:kRankCountryListHomeBannerHeight];
    self.secondName = [aDecoder decodeObjectForKey:kRankCountryListSecondName];
    self.subject = [aDecoder decodeObjectForKey:kRankCountryListSubject];
    self.subjectId = [aDecoder decodeDoubleForKey:kRankCountryListSubjectId];
    self.type = [aDecoder decodeObjectForKey:kRankCountryListType];
    self.homeBanner = [aDecoder decodeObjectForKey:kRankCountryListHomeBanner];
    self.desc = [aDecoder decodeObjectForKey:kRankCountryListDesc];
    self.shareImage = [aDecoder decodeObjectForKey:kRankCountryListShareImage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_homeBannerWidth forKey:kRankCountryListHomeBannerWidth];
    [aCoder encodeDouble:_position forKey:kRankCountryListPosition];
    [aCoder encodeDouble:_homeBannerHeight forKey:kRankCountryListHomeBannerHeight];
    [aCoder encodeObject:_secondName forKey:kRankCountryListSecondName];
    [aCoder encodeObject:_subject forKey:kRankCountryListSubject];
    [aCoder encodeDouble:_subjectId forKey:kRankCountryListSubjectId];
    [aCoder encodeObject:_type forKey:kRankCountryListType];
    [aCoder encodeObject:_homeBanner forKey:kRankCountryListHomeBanner];
    [aCoder encodeObject:_desc forKey:kRankCountryListDesc];
    [aCoder encodeObject:_shareImage forKey:kRankCountryListShareImage];
}

- (id)copyWithZone:(NSZone *)zone
{
    RankCountryList *copy = [[RankCountryList alloc] init];
    
    if (copy) {

        copy.homeBannerWidth = self.homeBannerWidth;
        copy.position = self.position;
        copy.homeBannerHeight = self.homeBannerHeight;
        copy.secondName = [self.secondName copyWithZone:zone];
        copy.subject = [self.subject copyWithZone:zone];
        copy.subjectId = self.subjectId;
        copy.type = [self.type copyWithZone:zone];
        copy.homeBanner = [self.homeBanner copyWithZone:zone];
        copy.desc = [self.desc copyWithZone:zone];
        copy.shareImage = [self.shareImage copyWithZone:zone];
    }
    
    return copy;
}


@end
