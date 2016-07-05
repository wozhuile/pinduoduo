//
//  PURCHARSDataModle.h
//
//  Created by   on 16/7/5
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PURCHARSDataModle : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *goods;
@property (nonatomic, assign) double serverTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
