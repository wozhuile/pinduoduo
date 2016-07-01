//
//  PDDGoodsList.h
//
//  Created by   on 16/6/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PDDGroup;

@interface PDDGoodsList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double isApp;
@property (nonatomic, assign) double goodsId;
@property (nonatomic, assign) double eventType;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *hdThumbUrl;
@property (nonatomic, strong) NSString *thumbUrl;
@property (nonatomic, assign) double cnt;
@property (nonatomic, strong) PDDGroup *group;
@property (nonatomic, strong) NSString *goodsName;
@property (nonatomic, assign) double normalPrice;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
