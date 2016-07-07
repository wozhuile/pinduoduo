//
//  HomeGroup.h
//
//  Created by   on 16/7/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HomeGroup : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double endTime;
@property (nonatomic, assign) double customerNum;
@property (nonatomic, assign) double buyLimit;
@property (nonatomic, assign) double groupIdentifier;
@property (nonatomic, assign) double price;
@property (nonatomic, assign) double startTime;
@property (nonatomic, assign) double groupId;
@property (nonatomic, assign) double duration;
@property (nonatomic, assign) double orderLimit;
@property (nonatomic, assign) double isOpen;
@property (nonatomic, assign) double goodsId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
