//
//  PDDHomeData.h
//
//  Created by   on 16/6/27
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PDDHomeSuperBrand;

@interface PDDHomeData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double favoriteUpdateTime;
@property (nonatomic, strong) NSArray *homeRecommendSubjects;
@property (nonatomic, strong) PDDHomeSuperBrand *homeSuperBrand;
@property (nonatomic, strong) NSArray *goodsList;
@property (nonatomic, strong) NSArray *mobileAppGroups;
@property (nonatomic, assign) double serverTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
