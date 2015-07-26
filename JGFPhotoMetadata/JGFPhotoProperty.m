//
//  JGFPhotoProperty.m
//  New York City
//
//  Created by Joshua Fuglsang on 23/07/2015.
//  Copyright (c) 2015 josh-fuggle. All rights reserved.
//

@import ImageIO;

#import "JGFPhotoProperty.h"

static NSString *ImageIOLocalizedString(NSString* key)
{
    static NSBundle* b = nil;
    
    if (!b)
    {
        b = [NSBundle bundleWithIdentifier:@"com.apple.ImageIO.framework"];
    }
    
    return [b localizedStringForKey:key value:key table:@"CGImageSource"];
}

extern _Nullable id <JGFPhotoProperty> JGFPhotoPropertyFromDict(NSDictionary * _Nonnull dict, CFStringRef _Nonnull key, JGFPhotoPropertyType type)
{
    NSString *castedKey = (__bridge NSString *)key;
    NSString *locKey = ImageIOLocalizedString(castedKey);
    id obj = [dict objectForKey:castedKey];
    
    id <JGFPhotoProperty> property;
    
    switch (type)
    {
        case JGFPhotoPropertyTypeBool:
            property = [JGFPhotoBoolProperty alloc];
            break;
            
        case JGFPhotoPropertyTypeInteger:
            property = [JGFPhotoIntegerProperty alloc];
            break;
            
        case JGFPhotoPropertyTypeFloat:
            property = [JGFPhotoFloatProperty alloc];
            break;
            
        case JGFPhotoPropertyTypeString:
            property = [JGFPhotoStringProperty alloc];
            break;
    }
    
    return [property initWithName:locKey value:obj];
}

@implementation JGFPhotoBoolProperty

@synthesize name = _name;

- (nullable instancetype)initWithName:(nonnull NSString *)name value:(nonnull id)value
{
    if (self = [super init])
    {
        self.name = name;
        
        if ([value isKindOfClass:[NSNumber class]])
        {
            NSNumber *casted = (NSNumber *)value;
            self.value = casted.boolValue;
        }
        else
        {
            return nil;
        }
    }
    return self;
}

@end

@implementation JGFPhotoFloatProperty

@synthesize name = _name;

- (nullable instancetype)initWithName:(nonnull NSString *)name value:(nonnull id)value
{
    if (self = [super init])
    {
        self.name = name;
        
        if ([value isKindOfClass:[NSNumber class]])
        {
            NSNumber *casted = (NSNumber *)value;
            self.value = casted.floatValue;
        }
        else
        {
            return nil;
        }
    }
    return self;
}

@end

@implementation JGFPhotoIntegerProperty

@synthesize name = _name;

- (nullable instancetype)initWithName:(nonnull NSString *)name value:(nonnull id)value
{
    if (self = [super init])
    {
        self.name = name;
        
        if ([value isKindOfClass:[NSNumber class]])
        {
            NSNumber *casted = (NSNumber *)value;
            self.value = casted.integerValue;
        }
        else
        {
            return nil;
        }
    }
    return self;
}

@end

@implementation JGFPhotoStringProperty

@synthesize name = _name;

- (nullable instancetype)initWithName:(nonnull NSString *)name value:(nonnull id)value
{
    if (self = [super init])
    {
        self.name = name;
        
        if ([value isKindOfClass:[NSString class]])
        {
            NSString *casted = (NSString *)value;
            self.value = casted;
        }
        else
        {
            return nil;
        }
    }
    return self;
}

@end
