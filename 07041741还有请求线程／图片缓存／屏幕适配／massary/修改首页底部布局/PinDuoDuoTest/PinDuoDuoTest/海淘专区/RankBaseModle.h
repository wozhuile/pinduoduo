//
//  RankBaseModle.h
//
//  Created by   on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RankBaseModle : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double favoriteUpdateTime;
@property (nonatomic, strong) NSArray *homeRecommendSubjects;
@property (nonatomic, strong) NSArray *countryList;
@property (nonatomic, strong) NSArray *promotionList;
@property (nonatomic, strong) NSArray *goodsList;
@property (nonatomic, assign) double serverTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
