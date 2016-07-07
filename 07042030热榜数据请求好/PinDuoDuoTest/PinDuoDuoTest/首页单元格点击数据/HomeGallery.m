//
//  HomeGallery.m
//
//  Created by   on 16/7/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HomeGallery.h"


NSString *const kHomeGalleryUrl = @"url";
NSString *const kHomeGalleryHeight = @"height";
NSString *const kHomeGalleryId = @"id";
NSString *const kHomeGalleryWidth = @"width";
NSString *const kHomeGalleryType = @"type";
NSString *const kHomeGalleryPriority = @"priority";
NSString *const kHomeGalleryGoodsId = @"goods_id";


@interface HomeGallery ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeGallery

@synthesize url = _url;
@synthesize height = _height;
@synthesize galleryIdentifier = _galleryIdentifier;
@synthesize width = _width;
@synthesize type = _type;
@synthesize priority = _priority;
@synthesize goodsId = _goodsId;


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
            self.url = [self objectOrNilForKey:kHomeGalleryUrl fromDictionary:dict];
            self.height = [[self objectOrNilForKey:kHomeGalleryHeight fromDictionary:dict] doubleValue];
            self.galleryIdentifier = [[self objectOrNilForKey:kHomeGalleryId fromDictionary:dict] doubleValue];
            self.width = [[self objectOrNilForKey:kHomeGalleryWidth fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kHomeGalleryType fromDictionary:dict] doubleValue];
            self.priority = [[self objectOrNilForKey:kHomeGalleryPriority fromDictionary:dict] doubleValue];
            self.goodsId = [[self objectOrNilForKey:kHomeGalleryGoodsId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.url forKey:kHomeGalleryUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kHomeGalleryHeight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.galleryIdentifier] forKey:kHomeGalleryId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.width] forKey:kHomeGalleryWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kHomeGalleryType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priority] forKey:kHomeGalleryPriority];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsId] forKey:kHomeGalleryGoodsId];

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

    self.url = [aDecoder decodeObjectForKey:kHomeGalleryUrl];
    self.height = [aDecoder decodeDoubleForKey:kHomeGalleryHeight];
    self.galleryIdentifier = [aDecoder decodeDoubleForKey:kHomeGalleryId];
    self.width = [aDecoder decodeDoubleForKey:kHomeGalleryWidth];
    self.type = [aDecoder decodeDoubleForKey:kHomeGalleryType];
    self.priority = [aDecoder decodeDoubleForKey:kHomeGalleryPriority];
    self.goodsId = [aDecoder decodeDoubleForKey:kHomeGalleryGoodsId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_url forKey:kHomeGalleryUrl];
    [aCoder encodeDouble:_height forKey:kHomeGalleryHeight];
    [aCoder encodeDouble:_galleryIdentifier forKey:kHomeGalleryId];
    [aCoder encodeDouble:_width forKey:kHomeGalleryWidth];
    [aCoder encodeDouble:_type forKey:kHomeGalleryType];
    [aCoder encodeDouble:_priority forKey:kHomeGalleryPriority];
    [aCoder encodeDouble:_goodsId forKey:kHomeGalleryGoodsId];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeGallery *copy = [[HomeGallery alloc] init];
    
    if (copy) {

        copy.url = [self.url copyWithZone:zone];
        copy.height = self.height;
        copy.galleryIdentifier = self.galleryIdentifier;
        copy.width = self.width;
        copy.type = self.type;
        copy.priority = self.priority;
        copy.goodsId = self.goodsId;
    }
    
    return copy;
}


@end
