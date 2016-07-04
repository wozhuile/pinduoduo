//
//  PDDHomeRecommendSubjects.m
//
//  Created by   on 16/6/27
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PDDHomeRecommendSubjects.h"
#import "PDDGoodsList.h"


NSString *const kPDDHomeRecommendSubjectsHomeBannerWidth = @"home_banner_width";
NSString *const kPDDHomeRecommendSubjectsPosition = @"position";
NSString *const kPDDHomeRecommendSubjectsHomeBannerHeight = @"home_banner_height";
NSString *const kPDDHomeRecommendSubjectsSecondName = @"second_name";
NSString *const kPDDHomeRecommendSubjectsGoodsList = @"goods_list";
NSString *const kPDDHomeRecommendSubjectsSubject = @"subject";
NSString *const kPDDHomeRecommendSubjectsShareImage = @"share_image";
NSString *const kPDDHomeRecommendSubjectsSubjectId = @"subject_id";
NSString *const kPDDHomeRecommendSubjectsType = @"type";
NSString *const kPDDHomeRecommendSubjectsDesc = @"desc";
NSString *const kPDDHomeRecommendSubjectsHomeBanner = @"home_banner";


@interface PDDHomeRecommendSubjects ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PDDHomeRecommendSubjects

@synthesize homeBannerWidth = _homeBannerWidth;
@synthesize position = _position;
@synthesize homeBannerHeight = _homeBannerHeight;
@synthesize secondName = _secondName;
@synthesize goodsList = _goodsList;
@synthesize subject = _subject;
@synthesize shareImage = _shareImage;
@synthesize subjectId = _subjectId;
@synthesize type = _type;
@synthesize desc = _desc;
@synthesize homeBanner = _homeBanner;


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
            self.homeBannerWidth = [[self objectOrNilForKey:kPDDHomeRecommendSubjectsHomeBannerWidth fromDictionary:dict] doubleValue];
            self.position = [[self objectOrNilForKey:kPDDHomeRecommendSubjectsPosition fromDictionary:dict] doubleValue];
            self.homeBannerHeight = [[self objectOrNilForKey:kPDDHomeRecommendSubjectsHomeBannerHeight fromDictionary:dict] doubleValue];
            self.secondName = [self objectOrNilForKey:kPDDHomeRecommendSubjectsSecondName fromDictionary:dict];
    NSObject *receivedPDDGoodsList = [dict objectForKey:kPDDHomeRecommendSubjectsGoodsList];
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
            self.subject = [self objectOrNilForKey:kPDDHomeRecommendSubjectsSubject fromDictionary:dict];
            self.shareImage = [self objectOrNilForKey:kPDDHomeRecommendSubjectsShareImage fromDictionary:dict];
            self.subjectId = [[self objectOrNilForKey:kPDDHomeRecommendSubjectsSubjectId fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kPDDHomeRecommendSubjectsType fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kPDDHomeRecommendSubjectsDesc fromDictionary:dict];
            self.homeBanner = [self objectOrNilForKey:kPDDHomeRecommendSubjectsHomeBanner fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.homeBannerWidth] forKey:kPDDHomeRecommendSubjectsHomeBannerWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.position] forKey:kPDDHomeRecommendSubjectsPosition];
    [mutableDict setValue:[NSNumber numberWithDouble:self.homeBannerHeight] forKey:kPDDHomeRecommendSubjectsHomeBannerHeight];
    [mutableDict setValue:self.secondName forKey:kPDDHomeRecommendSubjectsSecondName];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGoodsList] forKey:kPDDHomeRecommendSubjectsGoodsList];
    [mutableDict setValue:self.subject forKey:kPDDHomeRecommendSubjectsSubject];
    [mutableDict setValue:self.shareImage forKey:kPDDHomeRecommendSubjectsShareImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.subjectId] forKey:kPDDHomeRecommendSubjectsSubjectId];
    [mutableDict setValue:self.type forKey:kPDDHomeRecommendSubjectsType];
    [mutableDict setValue:self.desc forKey:kPDDHomeRecommendSubjectsDesc];
    [mutableDict setValue:self.homeBanner forKey:kPDDHomeRecommendSubjectsHomeBanner];

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

    self.homeBannerWidth = [aDecoder decodeDoubleForKey:kPDDHomeRecommendSubjectsHomeBannerWidth];
    self.position = [aDecoder decodeDoubleForKey:kPDDHomeRecommendSubjectsPosition];
    self.homeBannerHeight = [aDecoder decodeDoubleForKey:kPDDHomeRecommendSubjectsHomeBannerHeight];
    self.secondName = [aDecoder decodeObjectForKey:kPDDHomeRecommendSubjectsSecondName];
    self.goodsList = [aDecoder decodeObjectForKey:kPDDHomeRecommendSubjectsGoodsList];
    self.subject = [aDecoder decodeObjectForKey:kPDDHomeRecommendSubjectsSubject];
    self.shareImage = [aDecoder decodeObjectForKey:kPDDHomeRecommendSubjectsShareImage];
    self.subjectId = [aDecoder decodeDoubleForKey:kPDDHomeRecommendSubjectsSubjectId];
    self.type = [aDecoder decodeObjectForKey:kPDDHomeRecommendSubjectsType];
    self.desc = [aDecoder decodeObjectForKey:kPDDHomeRecommendSubjectsDesc];
    self.homeBanner = [aDecoder decodeObjectForKey:kPDDHomeRecommendSubjectsHomeBanner];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_homeBannerWidth forKey:kPDDHomeRecommendSubjectsHomeBannerWidth];
    [aCoder encodeDouble:_position forKey:kPDDHomeRecommendSubjectsPosition];
    [aCoder encodeDouble:_homeBannerHeight forKey:kPDDHomeRecommendSubjectsHomeBannerHeight];
    [aCoder encodeObject:_secondName forKey:kPDDHomeRecommendSubjectsSecondName];
    [aCoder encodeObject:_goodsList forKey:kPDDHomeRecommendSubjectsGoodsList];
    [aCoder encodeObject:_subject forKey:kPDDHomeRecommendSubjectsSubject];
    [aCoder encodeObject:_shareImage forKey:kPDDHomeRecommendSubjectsShareImage];
    [aCoder encodeDouble:_subjectId forKey:kPDDHomeRecommendSubjectsSubjectId];
    [aCoder encodeObject:_type forKey:kPDDHomeRecommendSubjectsType];
    [aCoder encodeObject:_desc forKey:kPDDHomeRecommendSubjectsDesc];
    [aCoder encodeObject:_homeBanner forKey:kPDDHomeRecommendSubjectsHomeBanner];
}

- (id)copyWithZone:(NSZone *)zone
{
    PDDHomeRecommendSubjects *copy = [[PDDHomeRecommendSubjects alloc] init];
    
    if (copy) {

        copy.homeBannerWidth = self.homeBannerWidth;
        copy.position = self.position;
        copy.homeBannerHeight = self.homeBannerHeight;
        copy.secondName = [self.secondName copyWithZone:zone];
        copy.goodsList = [self.goodsList copyWithZone:zone];
        copy.subject = [self.subject copyWithZone:zone];
        copy.shareImage = [self.shareImage copyWithZone:zone];
        copy.subjectId = self.subjectId;
        copy.type = [self.type copyWithZone:zone];
        copy.desc = [self.desc copyWithZone:zone];
        copy.homeBanner = [self.homeBanner copyWithZone:zone];
    }
    
    return copy;
}


@end
