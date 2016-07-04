//
//  PDDTopSctollView.h
//
//  Created by   on 16/6/27
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PDDTopSctollView : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double homeBannerWidth;
@property (nonatomic, assign) double position;
@property (nonatomic, assign) double homeBannerHeight;
@property (nonatomic, strong) NSString *secondName;
@property (nonatomic, strong) NSString *subject;
@property (nonatomic, assign) double subjectId;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *homeBanner;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *shareImage;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
