//
//  PDDRankDataModel.h
//
//  Created by   on 16/6/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PDDRankDataModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double favoriteUpdateTime;
@property (nonatomic, assign) double serverTime;
@property (nonatomic, strong) NSArray *countryList;
@property (nonatomic, strong) NSArray *promotionList;
@property (nonatomic, strong) NSArray *goodsList;
@property (nonatomic, strong) NSArray *homeRecommendSubjects;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
