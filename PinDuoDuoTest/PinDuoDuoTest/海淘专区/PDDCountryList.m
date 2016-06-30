//
//  PDDCountryList.m
//
//  Created by   on 16/6/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PDDCountryList.h"


NSString *const kPDDCountryListHomeBannerWidth = @"home_banner_width";
NSString *const kPDDCountryListPosition = @"position";
NSString *const kPDDCountryListHomeBannerHeight = @"home_banner_height";
NSString *const kPDDCountryListSecondName = @"second_name";
NSString *const kPDDCountryListSubject = @"subject";
NSString *const kPDDCountryListSubjectId = @"subject_id";
NSString *const kPDDCountryListType = @"type";
NSString *const kPDDCountryListHomeBanner = @"home_banner";
NSString *const kPDDCountryListDesc = @"desc";
NSString *const kPDDCountryListShareImage = @"share_image";


@interface PDDCountryList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PDDCountryList

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
            self.homeBannerWidth = [[self objectOrNilForKey:kPDDCountryListHomeBannerWidth fromDictionary:dict] doubleValue];
            self.position = [[self objectOrNilForKey:kPDDCountryListPosition fromDictionary:dict] doubleValue];
            self.homeBannerHeight = [[self objectOrNilForKey:kPDDCountryListHomeBannerHeight fromDictionary:dict] doubleValue];
            self.secondName = [self objectOrNilForKey:kPDDCountryListSecondName fromDictionary:dict];
            self.subject = [self objectOrNilForKey:kPDDCountryListSubject fromDictionary:dict];
            self.subjectId = [[self objectOrNilForKey:kPDDCountryListSubjectId fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kPDDCountryListType fromDictionary:dict];
            self.homeBanner = [self objectOrNilForKey:kPDDCountryListHomeBanner fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kPDDCountryListDesc fromDictionary:dict];
            self.shareImage = [self objectOrNilForKey:kPDDCountryListShareImage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.homeBannerWidth] forKey:kPDDCountryListHomeBannerWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.position] forKey:kPDDCountryListPosition];
    [mutableDict setValue:[NSNumber numberWithDouble:self.homeBannerHeight] forKey:kPDDCountryListHomeBannerHeight];
    [mutableDict setValue:self.secondName forKey:kPDDCountryListSecondName];
    [mutableDict setValue:self.subject forKey:kPDDCountryListSubject];
    [mutableDict setValue:[NSNumber numberWithDouble:self.subjectId] forKey:kPDDCountryListSubjectId];
    [mutableDict setValue:self.type forKey:kPDDCountryListType];
    [mutableDict setValue:self.homeBanner forKey:kPDDCountryListHomeBanner];
    [mutableDict setValue:self.desc forKey:kPDDCountryListDesc];
    [mutableDict setValue:self.shareImage forKey:kPDDCountryListShareImage];

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

    self.homeBannerWidth = [aDecoder decodeDoubleForKey:kPDDCountryListHomeBannerWidth];
    self.position = [aDecoder decodeDoubleForKey:kPDDCountryListPosition];
    self.homeBannerHeight = [aDecoder decodeDoubleForKey:kPDDCountryListHomeBannerHeight];
    self.secondName = [aDecoder decodeObjectForKey:kPDDCountryListSecondName];
    self.subject = [aDecoder decodeObjectForKey:kPDDCountryListSubject];
    self.subjectId = [aDecoder decodeDoubleForKey:kPDDCountryListSubjectId];
    self.type = [aDecoder decodeObjectForKey:kPDDCountryListType];
    self.homeBanner = [aDecoder decodeObjectForKey:kPDDCountryListHomeBanner];
    self.desc = [aDecoder decodeObjectForKey:kPDDCountryListDesc];
    self.shareImage = [aDecoder decodeObjectForKey:kPDDCountryListShareImage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_homeBannerWidth forKey:kPDDCountryListHomeBannerWidth];
    [aCoder encodeDouble:_position forKey:kPDDCountryListPosition];
    [aCoder encodeDouble:_homeBannerHeight forKey:kPDDCountryListHomeBannerHeight];
    [aCoder encodeObject:_secondName forKey:kPDDCountryListSecondName];
    [aCoder encodeObject:_subject forKey:kPDDCountryListSubject];
    [aCoder encodeDouble:_subjectId forKey:kPDDCountryListSubjectId];
    [aCoder encodeObject:_type forKey:kPDDCountryListType];
    [aCoder encodeObject:_homeBanner forKey:kPDDCountryListHomeBanner];
    [aCoder encodeObject:_desc forKey:kPDDCountryListDesc];
    [aCoder encodeObject:_shareImage forKey:kPDDCountryListShareImage];
}

- (id)copyWithZone:(NSZone *)zone
{
    PDDCountryList *copy = [[PDDCountryList alloc] init];
    
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
