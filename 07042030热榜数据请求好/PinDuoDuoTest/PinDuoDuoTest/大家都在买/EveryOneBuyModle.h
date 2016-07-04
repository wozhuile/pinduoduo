//
//  EveryOneBuyModle.h
//
//  Created by   on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface EveryOneBuyModle : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *goodsList;
@property (nonatomic, assign) double favoriteUpdateTime;
@property (nonatomic, assign) double serverTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
