//
//  JGFPhotoProperty.m
//  New York City
//
//  Created by Joshua Fuglsang on 23/07/2015.
//  Copyright (c) 2015 josh-fuggle. All rights reserved.
//

#import "JGFPhotoProperty.h"

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
