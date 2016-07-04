//
//  PDDTopSctollView.m
//
//  Created by   on 16/6/27
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PDDTopSctollView.h"


NSString *const kPDDTopSctollViewHomeBannerWidth = @"home_banner_width";
NSString *const kPDDTopSctollViewPosition = @"position";
NSString *const kPDDTopSctollViewHomeBannerHeight = @"home_banner_height";
NSString *const kPDDTopSctollViewSecondName = @"second_name";
NSString *const kPDDTopSctollViewSubject = @"subject";
NSString *const kPDDTopSctollViewSubjectId = @"subject_id";
NSString *const kPDDTopSctollViewType = @"type";
NSString *const kPDDTopSctollViewHomeBanner = @"home_banner";
NSString *const kPDDTopSctollViewDesc = @"desc";
NSString *const kPDDTopSctollViewShareImage = @"share_image";


@interface PDDTopSctollView ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PDDTopSctollView

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
            self.homeBannerWidth = [[self objectOrNilForKey:kPDDTopSctollViewHomeBannerWidth fromDictionary:dict] doubleValue];
            self.position = [[self objectOrNilForKey:kPDDTopSctollViewPosition fromDictionary:dict] doubleValue];
            self.homeBannerHeight = [[self objectOrNilForKey:kPDDTopSctollViewHomeBannerHeight fromDictionary:dict] doubleValue];
            self.secondName = [self objectOrNilForKey:kPDDTopSctollViewSecondName fromDictionary:dict];
            self.subject = [self objectOrNilForKey:kPDDTopSctollViewSubject fromDictionary:dict];
            self.subjectId = [[self objectOrNilForKey:kPDDTopSctollViewSubjectId fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kPDDTopSctollViewType fromDictionary:dict];
            self.homeBanner = [self objectOrNilForKey:kPDDTopSctollViewHomeBanner fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kPDDTopSctollViewDesc fromDictionary:dict];
            self.shareImage = [self objectOrNilForKey:kPDDTopSctollViewShareImage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.homeBannerWidth] forKey:kPDDTopSctollViewHomeBannerWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.position] forKey:kPDDTopSctollViewPosition];
    [mutableDict setValue:[NSNumber numberWithDouble:self.homeBannerHeight] forKey:kPDDTopSctollViewHomeBannerHeight];
    [mutableDict setValue:self.secondName forKey:kPDDTopSctollViewSecondName];
    [mutableDict setValue:self.subject forKey:kPDDTopSctollViewSubject];
    [mutableDict setValue:[NSNumber numberWithDouble:self.subjectId] forKey:kPDDTopSctollViewSubjectId];
    [mutableDict setValue:self.type forKey:kPDDTopSctollViewType];
    [mutableDict setValue:self.homeBanner forKey:kPDDTopSctollViewHomeBanner];
    [mutableDict setValue:self.desc forKey:kPDDTopSctollViewDesc];
    [mutableDict setValue:self.shareImage forKey:kPDDTopSctollViewShareImage];

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

    self.homeBannerWidth = [aDecoder decodeDoubleForKey:kPDDTopSctollViewHomeBannerWidth];
    self.position = [aDecoder decodeDoubleForKey:kPDDTopSctollViewPosition];
    self.homeBannerHeight = [aDecoder decodeDoubleForKey:kPDDTopSctollViewHomeBannerHeight];
    self.secondName = [aDecoder decodeObjectForKey:kPDDTopSctollViewSecondName];
    self.subject = [aDecoder decodeObjectForKey:kPDDTopSctollViewSubject];
    self.subjectId = [aDecoder decodeDoubleForKey:kPDDTopSctollViewSubjectId];
    self.type = [aDecoder decodeObjectForKey:kPDDTopSctollViewType];
    self.homeBanner = [aDecoder decodeObjectForKey:kPDDTopSctollViewHomeBanner];
    self.desc = [aDecoder decodeObjectForKey:kPDDTopSctollViewDesc];
    self.shareImage = [aDecoder decodeObjectForKey:kPDDTopSctollViewShareImage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_homeBannerWidth forKey:kPDDTopSctollViewHomeBannerWidth];
    [aCoder encodeDouble:_position forKey:kPDDTopSctollViewPosition];
    [aCoder encodeDouble:_homeBannerHeight forKey:kPDDTopSctollViewHomeBannerHeight];
    [aCoder encodeObject:_secondName forKey:kPDDTopSctollViewSecondName];
    [aCoder encodeObject:_subject forKey:kPDDTopSctollViewSubject];
    [aCoder encodeDouble:_subjectId forKey:kPDDTopSctollViewSubjectId];
    [aCoder encodeObject:_type forKey:kPDDTopSctollViewType];
    [aCoder encodeObject:_homeBanner forKey:kPDDTopSctollViewHomeBanner];
    [aCoder encodeObject:_desc forKey:kPDDTopSctollViewDesc];
    [aCoder encodeObject:_shareImage forKey:kPDDTopSctollViewShareImage];
}

- (id)copyWithZone:(NSZone *)zone
{
    PDDTopSctollView *copy = [[PDDTopSctollView alloc] init];
    
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
