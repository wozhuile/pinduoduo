//
//  NewGoodsList.h
//
//  Created by   on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NewGroup;

@interface NewGoodsList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double isApp;
@property (nonatomic, assign) double goodsId;
@property (nonatomic, assign) double time;
@property (nonatomic, strong) NSString *hdThumbUrl;
@property (nonatomic, assign) double eventType;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *thumbUrl;
@property (nonatomic, strong) NewGroup *group;
@property (nonatomic, strong) NSString *goodsName;
@property (nonatomic, assign) double normalPrice;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
