//
//  PDDPromotionList.m
//
//  Created by   on 16/6/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PDDPromotionList.h"


NSString *const kPDDPromotionListHomeBannerWidth = @"home_banner_width";
NSString *const kPDDPromotionListPosition = @"position";
NSString *const kPDDPromotionListHomeBannerHeight = @"home_banner_height";
NSString *const kPDDPromotionListSecondName = @"second_name";
NSString *const kPDDPromotionListSubject = @"subject";
NSString *const kPDDPromotionListSubjectId = @"subject_id";
NSString *const kPDDPromotionListType = @"type";
NSString *const kPDDPromotionListHomeBanner = @"home_banner";
NSString *const kPDDPromotionListDesc = @"desc";
NSString *const kPDDPromotionListShareImage = @"share_image";


@interface PDDPromotionList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PDDPromotionList

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
            self.homeBannerWidth = [[self objectOrNilForKey:kPDDPromotionListHomeBannerWidth fromDictionary:dict] doubleValue];
            self.position = [[self objectOrNilForKey:kPDDPromotionListPosition fromDictionary:dict] doubleValue];
            self.homeBannerHeight = [[self objectOrNilForKey:kPDDPromotionListHomeBannerHeight fromDictionary:dict] doubleValue];
            self.secondName = [self objectOrNilForKey:kPDDPromotionListSecondName fromDictionary:dict];
            self.subject = [self objectOrNilForKey:kPDDPromotionListSubject fromDictionary:dict];
            self.subjectId = [[self objectOrNilForKey:kPDDPromotionListSubjectId fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kPDDPromotionListType fromDictionary:dict];
            self.homeBanner = [self objectOrNilForKey:kPDDPromotionListHomeBanner fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kPDDPromotionListDesc fromDictionary:dict];
            self.shareImage = [self objectOrNilForKey:kPDDPromotionListShareImage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.homeBannerWidth] forKey:kPDDPromotionListHomeBannerWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.position] forKey:kPDDPromotionListPosition];
    [mutableDict setValue:[NSNumber numberWithDouble:self.homeBannerHeight] forKey:kPDDPromotionListHomeBannerHeight];
    [mutableDict setValue:self.secondName forKey:kPDDPromotionListSecondName];
    [mutableDict setValue:self.subject forKey:kPDDPromotionListSubject];
    [mutableDict setValue:[NSNumber numberWithDouble:self.subjectId] forKey:kPDDPromotionListSubjectId];
    [mutableDict setValue:self.type forKey:kPDDPromotionListType];
    [mutableDict setValue:self.homeBanner forKey:kPDDPromotionListHomeBanner];
    [mutableDict setValue:self.desc forKey:kPDDPromotionListDesc];
    [mutableDict setValue:self.shareImage forKey:kPDDPromotionListShareImage];

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

    self.homeBannerWidth = [aDecoder decodeDoubleForKey:kPDDPromotionListHomeBannerWidth];
    self.position = [aDecoder decodeDoubleForKey:kPDDPromotionListPosition];
    self.homeBannerHeight = [aDecoder decodeDoubleForKey:kPDDPromotionListHomeBannerHeight];
    self.secondName = [aDecoder decodeObjectForKey:kPDDPromotionListSecondName];
    self.subject = [aDecoder decodeObjectForKey:kPDDPromotionListSubject];
    self.subjectId = [aDecoder decodeDoubleForKey:kPDDPromotionListSubjectId];
    self.type = [aDecoder decodeObjectForKey:kPDDPromotionListType];
    self.homeBanner = [aDecoder decodeObjectForKey:kPDDPromotionListHomeBanner];
    self.desc = [aDecoder decodeObjectForKey:kPDDPromotionListDesc];
    self.shareImage = [aDecoder decodeObjectForKey:kPDDPromotionListShareImage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_homeBannerWidth forKey:kPDDPromotionListHomeBannerWidth];
    [aCoder encodeDouble:_position forKey:kPDDPromotionListPosition];
    [aCoder encodeDouble:_homeBannerHeight forKey:kPDDPromotionListHomeBannerHeight];
    [aCoder encodeObject:_secondName forKey:kPDDPromotionListSecondName];
    [aCoder encodeObject:_subject forKey:kPDDPromotionListSubject];
    [aCoder encodeDouble:_subjectId forKey:kPDDPromotionListSubjectId];
    [aCoder encodeObject:_type forKey:kPDDPromotionListType];
    [aCoder encodeObject:_homeBanner forKey:kPDDPromotionListHomeBanner];
    [aCoder encodeObject:_desc forKey:kPDDPromotionListDesc];
    [aCoder encodeObject:_shareImage forKey:kPDDPromotionListShareImage];
}

- (id)copyWithZone:(NSZone *)zone
{
    PDDPromotionList *copy = [[PDDPromotionList alloc] init];
    
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
