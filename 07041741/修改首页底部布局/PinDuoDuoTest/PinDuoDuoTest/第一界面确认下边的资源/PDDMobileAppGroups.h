//
//  PDDMobileAppGroups.h
//
//  Created by   on 16/6/27
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PDDMobileAppGroups : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double endTime;
@property (nonatomic, strong) NSString *banner;
@property (nonatomic, assign) double groupId;
@property (nonatomic, assign) double startTime;
@property (nonatomic, strong) NSString *thumbUrl;
@property (nonatomic, strong) NSString *goodsName;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, assign) double goodsId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
