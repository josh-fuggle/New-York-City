//
//  JGFExifPhotoProperties.m
//  New York City
//
//  Created by Joshua Fuglsang on 26/07/2015.
//  Copyright © 2015 josh-fuggle. All rights reserved.
//

#import "JGFExifPhotoProperties.h"

@implementation JGFExifPhotoProperties

@synthesize rawData = _rawData;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init])
    {
        self.rawData = dictionary;
    }
    return self;
}

#pragma mark - Data

- (JGFPhotoFloatProperty * _Nullable)exposureTime
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifExposureTime, JGFPhotoPropertyTypeFloat);
}

- (JGFPhotoFloatProperty * _Nullable)FNumber
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifFNumber, JGFPhotoPropertyTypeFloat);
}

- (JGFPhotoFloatProperty * _Nullable)ISOSpeed
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifISOSpeed, JGFPhotoPropertyTypeFloat);
}

- (JGFPhotoStringProperty * _Nullable)dateTimeOriginal
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifDateTimeOriginal, JGFPhotoPropertyTypeString);
}

- (JGFPhotoStringProperty * _Nullable)dateTimeDigitized
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifDateTimeDigitized, JGFPhotoPropertyTypeString);
}

- (JGFPhotoFloatProperty * _Nullable)shutterSpeedValue
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifShutterSpeedValue, JGFPhotoPropertyTypeFloat);
}

- (JGFPhotoFloatProperty * _Nullable)apertureValue
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifApertureValue, JGFPhotoPropertyTypeFloat);
}

- (JGFPhotoFloatProperty * _Nullable)brightnessValue
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifBrightnessValue, JGFPhotoPropertyTypeFloat);
}

- (JGFPhotoFloatProperty * _Nullable)subjectDistance
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifSubjectDistance, JGFPhotoPropertyTypeFloat);
}

- (JGFPhotoBoolProperty * _Nullable)flash
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifFlash, JGFPhotoPropertyTypeBool);
}

- (JGFPhotoFloatProperty * _Nullable)focalLength
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifFocalLength, JGFPhotoPropertyTypeFloat);
}

- (JGFPhotoFloatProperty * _Nullable)subjectArea
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifSubjectArea, JGFPhotoPropertyTypeFloat);
}

- (JGFPhotoIntegerProperty * _Nullable)pixelXDimension
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifPixelXDimension, JGFPhotoPropertyTypeInteger);
}

- (JGFPhotoIntegerProperty * _Nullable)pixelYDimension
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifPixelYDimension, JGFPhotoPropertyTypeInteger);
}

- (JGFPhotoFloatProperty * _Nullable)subjectLocation
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifSubjectLocation, JGFPhotoPropertyTypeFloat);
}

- (JGFPhotoStringProperty * _Nullable)exposureMode
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifExposureMode, JGFPhotoPropertyTypeString);
}

- (JGFPhotoFloatProperty * _Nullable)whiteBalance
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifWhiteBalance, JGFPhotoPropertyTypeFloat);
}

- (JGFPhotoFloatProperty * _Nullable)contrast
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifContrast, JGFPhotoPropertyTypeFloat);
}

- (JGFPhotoFloatProperty * _Nullable)saturation
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifSaturation, JGFPhotoPropertyTypeFloat);
}

- (JGFPhotoFloatProperty * _Nullable)sharpness
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifSharpness, JGFPhotoPropertyTypeFloat);
}

- (JGFPhotoStringProperty * _Nullable)imageUniqueID
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifImageUniqueID, JGFPhotoPropertyTypeString);
}

- (JGFPhotoStringProperty * _Nullable)lensSpecification
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifLensSpecification, JGFPhotoPropertyTypeString);
}

- (JGFPhotoStringProperty * _Nullable)lensMake
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifLensMake, JGFPhotoPropertyTypeString);
}

- (JGFPhotoStringProperty * _Nullable)lensModel
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifLensModel, JGFPhotoPropertyTypeString);
}

- (JGFPhotoFloatProperty * _Nullable)gamma
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifGamma, JGFPhotoPropertyTypeFloat);
}

@end
