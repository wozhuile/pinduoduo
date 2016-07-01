//
//  PDDHomeSuperBrand.m
//
//  Created by   on 16/6/27
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PDDHomeSuperBrand.h"
#import "PDDGoodsList.h"


NSString *const kPDDHomeSuperBrandSubject = @"subject";
NSString *const kPDDHomeSuperBrandGoodsList = @"goods_list";
NSString *const kPDDHomeSuperBrandHomeBannerHeight = @"home_banner_height";
NSString *const kPDDHomeSuperBrandPosition = @"position";
NSString *const kPDDHomeSuperBrandSecondName = @"second_name";
NSString *const kPDDHomeSuperBrandStartTime = @"start_time";
NSString *const kPDDHomeSuperBrandType = @"type";
NSString *const kPDDHomeSuperBrandDesc = @"desc";
NSString *const kPDDHomeSuperBrandSubjectId = @"subject_id";
NSString *const kPDDHomeSuperBrandHomeBannerWidth = @"home_banner_width";
NSString *const kPDDHomeSuperBrandShareImage = @"share_image";
NSString *const kPDDHomeSuperBrandEndTime = @"end_time";
NSString *const kPDDHomeSuperBrandHomeBanner = @"home_banner";


@interface PDDHomeSuperBrand ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PDDHomeSuperBrand

@synthesize subject = _subject;
@synthesize goodsList = _goodsList;
@synthesize homeBannerHeight = _homeBannerHeight;
@synthesize position = _position;
@synthesize secondName = _secondName;
@synthesize startTime = _startTime;
@synthesize type = _type;
@synthesize desc = _desc;
@synthesize subjectId = _subjectId;
@synthesize homeBannerWidth = _homeBannerWidth;
@synthesize shareImage = _shareImage;
@synthesize endTime = _endTime;
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
            self.subject = [self objectOrNilForKey:kPDDHomeSuperBrandSubject fromDictionary:dict];
    NSObject *receivedPDDGoodsList = [dict objectForKey:kPDDHomeSuperBrandGoodsList];
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
            self.homeBannerHeight = [[self objectOrNilForKey:kPDDHomeSuperBrandHomeBannerHeight fromDictionary:dict] doubleValue];
            self.position = [[self objectOrNilForKey:kPDDHomeSuperBrandPosition fromDictionary:dict] doubleValue];
            self.secondName = [self objectOrNilForKey:kPDDHomeSuperBrandSecondName fromDictionary:dict];
            self.startTime = [[self objectOrNilForKey:kPDDHomeSuperBrandStartTime fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kPDDHomeSuperBrandType fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kPDDHomeSuperBrandDesc fromDictionary:dict];
            self.subjectId = [[self objectOrNilForKey:kPDDHomeSuperBrandSubjectId fromDictionary:dict] doubleValue];
            self.homeBannerWidth = [[self objectOrNilForKey:kPDDHomeSuperBrandHomeBannerWidth fromDictionary:dict] doubleValue];
            self.shareImage = [self objectOrNilForKey:kPDDHomeSuperBrandShareImage fromDictionary:dict];
            self.endTime = [[self objectOrNilForKey:kPDDHomeSuperBrandEndTime fromDictionary:dict] doubleValue];
            self.homeBanner = [self objectOrNilForKey:kPDDHomeSuperBrandHomeBanner fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.subject forKey:kPDDHomeSuperBrandSubject];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGoodsList] forKey:kPDDHomeSuperBrandGoodsList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.homeBannerHeight] forKey:kPDDHomeSuperBrandHomeBannerHeight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.position] forKey:kPDDHomeSuperBrandPosition];
    [mutableDict setValue:self.secondName forKey:kPDDHomeSuperBrandSecondName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.startTime] forKey:kPDDHomeSuperBrandStartTime];
    [mutableDict setValue:self.type forKey:kPDDHomeSuperBrandType];
    [mutableDict setValue:self.desc forKey:kPDDHomeSuperBrandDesc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.subjectId] forKey:kPDDHomeSuperBrandSubjectId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.homeBannerWidth] forKey:kPDDHomeSuperBrandHomeBannerWidth];
    [mutableDict setValue:self.shareImage forKey:kPDDHomeSuperBrandShareImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endTime] forKey:kPDDHomeSuperBrandEndTime];
    [mutableDict setValue:self.homeBanner forKey:kPDDHomeSuperBrandHomeBanner];

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

    self.subject = [aDecoder decodeObjectForKey:kPDDHomeSuperBrandSubject];
    self.goodsList = [aDecoder decodeObjectForKey:kPDDHomeSuperBrandGoodsList];
    self.homeBannerHeight = [aDecoder decodeDoubleForKey:kPDDHomeSuperBrandHomeBannerHeight];
    self.position = [aDecoder decodeDoubleForKey:kPDDHomeSuperBrandPosition];
    self.secondName = [aDecoder decodeObjectForKey:kPDDHomeSuperBrandSecondName];
    self.startTime = [aDecoder decodeDoubleForKey:kPDDHomeSuperBrandStartTime];
    self.type = [aDecoder decodeObjectForKey:kPDDHomeSuperBrandType];
    self.desc = [aDecoder decodeObjectForKey:kPDDHomeSuperBrandDesc];
    self.subjectId = [aDecoder decodeDoubleForKey:kPDDHomeSuperBrandSubjectId];
    self.homeBannerWidth = [aDecoder decodeDoubleForKey:kPDDHomeSuperBrandHomeBannerWidth];
    self.shareImage = [aDecoder decodeObjectForKey:kPDDHomeSuperBrandShareImage];
    self.endTime = [aDecoder decodeDoubleForKey:kPDDHomeSuperBrandEndTime];
    self.homeBanner = [aDecoder decodeObjectForKey:kPDDHomeSuperBrandHomeBanner];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_subject forKey:kPDDHomeSuperBrandSubject];
    [aCoder encodeObject:_goodsList forKey:kPDDHomeSuperBrandGoodsList];
    [aCoder encodeDouble:_homeBannerHeight forKey:kPDDHomeSuperBrandHomeBannerHeight];
    [aCoder encodeDouble:_position forKey:kPDDHomeSuperBrandPosition];
    [aCoder encodeObject:_secondName forKey:kPDDHomeSuperBrandSecondName];
    [aCoder encodeDouble:_startTime forKey:kPDDHomeSuperBrandStartTime];
    [aCoder encodeObject:_type forKey:kPDDHomeSuperBrandType];
    [aCoder encodeObject:_desc forKey:kPDDHomeSuperBrandDesc];
    [aCoder encodeDouble:_subjectId forKey:kPDDHomeSuperBrandSubjectId];
    [aCoder encodeDouble:_homeBannerWidth forKey:kPDDHomeSuperBrandHomeBannerWidth];
    [aCoder encodeObject:_shareImage forKey:kPDDHomeSuperBrandShareImage];
    [aCoder encodeDouble:_endTime forKey:kPDDHomeSuperBrandEndTime];
    [aCoder encodeObject:_homeBanner forKey:kPDDHomeSuperBrandHomeBanner];
}

- (id)copyWithZone:(NSZone *)zone
{
    PDDHomeSuperBrand *copy = [[PDDHomeSuperBrand alloc] init];
    
    if (copy) {

        copy.subject = [self.subject copyWithZone:zone];
        copy.goodsList = [self.goodsList copyWithZone:zone];
        copy.homeBannerHeight = self.homeBannerHeight;
        copy.position = self.position;
        copy.secondName = [self.secondName copyWithZone:zone];
        copy.startTime = self.startTime;
        copy.type = [self.type copyWithZone:zone];
        copy.desc = [self.desc copyWithZone:zone];
        copy.subjectId = self.subjectId;
        copy.homeBannerWidth = self.homeBannerWidth;
        copy.shareImage = [self.shareImage copyWithZone:zone];
        copy.endTime = self.endTime;
        copy.homeBanner = [self.homeBanner copyWithZone:zone];
    }
    
    return copy;
}


@end
