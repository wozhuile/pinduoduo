//
//  RankPromotionList.m
//
//  Created by   on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RankPromotionList.h"


NSString *const kRankPromotionListHomeBannerWidth = @"home_banner_width";
NSString *const kRankPromotionListPosition = @"position";
NSString *const kRankPromotionListHomeBannerHeight = @"home_banner_height";
NSString *const kRankPromotionListSecondName = @"second_name";
NSString *const kRankPromotionListSubject = @"subject";
NSString *const kRankPromotionListSubjectId = @"subject_id";
NSString *const kRankPromotionListType = @"type";
NSString *const kRankPromotionListHomeBanner = @"home_banner";
NSString *const kRankPromotionListDesc = @"desc";
NSString *const kRankPromotionListShareImage = @"share_image";


@interface RankPromotionList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RankPromotionList

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
            self.homeBannerWidth = [[self objectOrNilForKey:kRankPromotionListHomeBannerWidth fromDictionary:dict] doubleValue];
            self.position = [[self objectOrNilForKey:kRankPromotionListPosition fromDictionary:dict] doubleValue];
            self.homeBannerHeight = [[self objectOrNilForKey:kRankPromotionListHomeBannerHeight fromDictionary:dict] doubleValue];
            self.secondName = [self objectOrNilForKey:kRankPromotionListSecondName fromDictionary:dict];
            self.subject = [self objectOrNilForKey:kRankPromotionListSubject fromDictionary:dict];
            self.subjectId = [[self objectOrNilForKey:kRankPromotionListSubjectId fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kRankPromotionListType fromDictionary:dict];
            self.homeBanner = [self objectOrNilForKey:kRankPromotionListHomeBanner fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kRankPromotionListDesc fromDictionary:dict];
            self.shareImage = [self objectOrNilForKey:kRankPromotionListShareImage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.homeBannerWidth] forKey:kRankPromotionListHomeBannerWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.position] forKey:kRankPromotionListPosition];
    [mutableDict setValue:[NSNumber numberWithDouble:self.homeBannerHeight] forKey:kRankPromotionListHomeBannerHeight];
    [mutableDict setValue:self.secondName forKey:kRankPromotionListSecondName];
    [mutableDict setValue:self.subject forKey:kRankPromotionListSubject];
    [mutableDict setValue:[NSNumber numberWithDouble:self.subjectId] forKey:kRankPromotionListSubjectId];
    [mutableDict setValue:self.type forKey:kRankPromotionListType];
    [mutableDict setValue:self.homeBanner forKey:kRankPromotionListHomeBanner];
    [mutableDict setValue:self.desc forKey:kRankPromotionListDesc];
    [mutableDict setValue:self.shareImage forKey:kRankPromotionListShareImage];

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

    self.homeBannerWidth = [aDecoder decodeDoubleForKey:kRankPromotionListHomeBannerWidth];
    self.position = [aDecoder decodeDoubleForKey:kRankPromotionListPosition];
    self.homeBannerHeight = [aDecoder decodeDoubleForKey:kRankPromotionListHomeBannerHeight];
    self.secondName = [aDecoder decodeObjectForKey:kRankPromotionListSecondName];
    self.subject = [aDecoder decodeObjectForKey:kRankPromotionListSubject];
    self.subjectId = [aDecoder decodeDoubleForKey:kRankPromotionListSubjectId];
    self.type = [aDecoder decodeObjectForKey:kRankPromotionListType];
    self.homeBanner = [aDecoder decodeObjectForKey:kRankPromotionListHomeBanner];
    self.desc = [aDecoder decodeObjectForKey:kRankPromotionListDesc];
    self.shareImage = [aDecoder decodeObjectForKey:kRankPromotionListShareImage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_homeBannerWidth forKey:kRankPromotionListHomeBannerWidth];
    [aCoder encodeDouble:_position forKey:kRankPromotionListPosition];
    [aCoder encodeDouble:_homeBannerHeight forKey:kRankPromotionListHomeBannerHeight];
    [aCoder encodeObject:_secondName forKey:kRankPromotionListSecondName];
    [aCoder encodeObject:_subject forKey:kRankPromotionListSubject];
    [aCoder encodeDouble:_subjectId forKey:kRankPromotionListSubjectId];
    [aCoder encodeObject:_type forKey:kRankPromotionListType];
    [aCoder encodeObject:_homeBanner forKey:kRankPromotionListHomeBanner];
    [aCoder encodeObject:_desc forKey:kRankPromotionListDesc];
    [aCoder encodeObject:_shareImage forKey:kRankPromotionListShareImage];
}

- (id)copyWithZone:(NSZone *)zone
{
    RankPromotionList *copy = [[RankPromotionList alloc] init];
    
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
