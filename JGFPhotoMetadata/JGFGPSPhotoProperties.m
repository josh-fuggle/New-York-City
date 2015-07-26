//
//  JGFGPSPhotoProperties.m
//  New York City
//
//  Created by Joshua Fuglsang on 25/07/2015.
//  Copyright © 2015 josh-fuggle. All rights reserved.
//

@import ImageIO;

#import "JGFGPSPhotoProperties.h"

@implementation JGFGPSPhotoProperties

#pragma mark - Init

@synthesize rawData = _rawData;

- (nonnull instancetype)initWithDictionary:(nonnull NSDictionary *)dictionary
{
    if (self = [super init])
    {
        self.rawData = dictionary;
    }
    return self;
}

#pragma mark - Data

- (JGFPhotoStringProperty * _Nullable)version
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyGPSVersion, JGFPhotoPropertyTypeString);
}

- (JGFPhotoFloatProperty * _Nullable)latitude
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyGPSLatitude, JGFPhotoPropertyTypeFloat);
}

- (JGFPhotoFloatProperty * _Nullable)longitude
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyGPSLongitude, JGFPhotoPropertyTypeFloat);
}

- (JGFPhotoFloatProperty * _Nullable)altitude
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyGPSAltitude, JGFPhotoPropertyTypeFloat);
}

- (JGFPhotoStringProperty * _Nullable)timeStamp
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyGPSTimeStamp, JGFPhotoPropertyTypeString);
}

- (JGFPhotoIntegerProperty * _Nullable)satellites
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyGPSSatellites, JGFPhotoPropertyTypeInteger);
}

- (JGFPhotoIntegerProperty * _Nullable)status
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyGPSStatus, JGFPhotoPropertyTypeInteger);
}

- (JGFPhotoStringProperty * _Nullable)areaInformation
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyGPSAreaInformation, JGFPhotoPropertyTypeString);
}

- (JGFPhotoStringProperty * _Nullable)dateStamp
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyGPSDateStamp, JGFPhotoPropertyTypeString);
}

- (JGFPhotoFloatProperty * _Nullable)DOP
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyGPSDOP, JGFPhotoPropertyTypeFloat);
}

@end
