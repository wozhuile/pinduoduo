//
//  RankGoodsList.h
//
//  Created by   on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RankGroup;

@interface RankGoodsList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double normalPrice;
@property (nonatomic, assign) double isApp;
@property (nonatomic, assign) double eventType;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) RankGroup *group;
@property (nonatomic, strong) NSString *goodsName;
@property (nonatomic, assign) double goodsId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
