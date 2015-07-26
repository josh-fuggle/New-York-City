//
//  JGFPhotoProperty.h
//  New York City
//
//  Created by Joshua Fuglsang on 23/07/2015.
//  Copyright (c) 2015 josh-fuggle. All rights reserved.
//

@import Foundation;

typedef NS_ENUM(NSInteger, JGFPhotoPropertyType)
{
    JGFPhotoPropertyTypeInteger,
    JGFPhotoPropertyTypeFloat,
    JGFPhotoPropertyTypeBool,
    JGFPhotoPropertyTypeString
};

@protocol JGFPhotoProperty <NSObject>
- (nullable instancetype)initWithName:(nonnull NSString *)name value:(nonnull id)value;
@property (nonnull, nonatomic, strong) NSString *name;
@end

extern _Nullable id <JGFPhotoProperty> JGFPhotoPropertyFromDict(NSDictionary * _Nonnull dict, CFStringRef _Nonnull key, JGFPhotoPropertyType type);

@interface JGFPhotoIntegerProperty : NSObject <JGFPhotoProperty>
@property (nonatomic, assign) NSInteger value;
@end

@interface JGFPhotoFloatProperty : NSObject <JGFPhotoProperty>
@property (nonatomic, assign) CGFloat value;
@end

@interface JGFPhotoStringProperty : NSObject <JGFPhotoProperty>
@property (nonnull, nonatomic, assign) NSString *value;
@end

@interface JGFPhotoBoolProperty : NSObject <JGFPhotoProperty>
@property (nonatomic, assign) BOOL value;
@end

