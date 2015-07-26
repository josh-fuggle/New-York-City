//
//  JGFPhotoMetadata.m
//  New York City
//
//  Created by Joshua Fuglsang on 21/07/2015.
//  Copyright (c) 2015 josh-fuggle. All rights reserved.
//

#import "JGFPhotoProperties.h"
#import "JGFGPSPhotoProperties.h"

@implementation JGFPhotoProperties

+ (nullable instancetype)propertyTreeWithURL:(nullable NSURL *)URL
{
    CGImageSourceRef source = CGImageSourceCreateWithURL((CFURLRef)URL, NULL);
    return [self propertyTreeWithImageSource:source];
}

+ (nullable instancetype)propertyTreeWithImageSource:(nullable CGImageSourceRef)source
{
    if (source)
    {
        return [[self alloc] initWithDictionary:(__bridge NSDictionary *)CGImageSourceCopyPropertiesAtIndex(source, 0, NULL)];
    }
    
    return nil;
}

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

- (JGFPhotoIntegerProperty * _Nullable)fileSize
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyFileSize, JGFPhotoPropertyTypeInteger);
}

- (JGFPhotoFloatProperty * _Nullable)pixelWidth
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyDPIWidth, JGFPhotoPropertyTypeFloat);
}

- (JGFPhotoFloatProperty * _Nullable)pixelHeight
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyPixelHeight, JGFPhotoPropertyTypeFloat);
}

- (JGFPhotoIntegerProperty * _Nullable)depth
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyDepth, JGFPhotoPropertyTypeInteger);
}

- (JGFPhotoIntegerProperty * _Nullable)DPIWidth
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyDPIWidth, JGFPhotoPropertyTypeInteger);
}

- (JGFPhotoIntegerProperty * _Nullable)DPIHeight
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyDPIHeight, JGFPhotoPropertyTypeInteger);
}

- (JGFPhotoIntegerProperty * _Nullable)orientation
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyOrientation, JGFPhotoPropertyTypeInteger);
}

- (JGFPhotoBoolProperty * _Nullable)isFloat
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyIsFloat, JGFPhotoPropertyTypeBool);
}

- (JGFPhotoBoolProperty * _Nullable)isIndexed
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyIsIndexed, JGFPhotoPropertyTypeBool);
}

- (JGFPhotoBoolProperty * _Nullable)hasAlpha
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyHasAlpha, JGFPhotoPropertyTypeBool);
}

- (JGFPhotoStringProperty * _Nullable)colorModel
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyColorModel, JGFPhotoPropertyTypeString);
}

- (JGFPhotoStringProperty * _Nullable)profileName
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyProfileName, JGFPhotoPropertyTypeString);
}

- (JGFTIFFPhotoProperties * _Nullable)TIFFData
{
    return [self loadTIFFDataWithKey:kCGImagePropertyTIFFDictionary];
}

- (JGFExifPhotoProperties * _Nullable)ExifData
{
    return [self loadEXIFDataWithKey:kCGImagePropertyExifDictionary];
}

- (JGFGPSPhotoProperties * _Nullable)GPSData
{
    return [self loadGPSDataWithKey:kCGImagePropertyGPSDictionary];
}

#pragma mark - Private

- (JGFExifPhotoProperties * _Nullable)loadEXIFDataWithKey:(CFStringRef)key
{
    NSString *castedKey = (__bridge NSString *)key;
    id obj = [self.rawData objectForKey:castedKey];
    
    if ([obj isKindOfClass:[NSDictionary class]])
    {
        return [[JGFExifPhotoProperties alloc] initWithDictionary:obj];
    }
    
    return nil;
}

- (JGFTIFFPhotoProperties * _Nullable)loadTIFFDataWithKey:(CFStringRef)key
{
    NSString *castedKey = (__bridge NSString *)key;
    id obj = [self.rawData objectForKey:castedKey];
    
    if ([obj isKindOfClass:[NSDictionary class]])
    {
        return [[JGFTIFFPhotoProperties alloc] initWithDictionary:obj];
    }
    
    return nil;
}

- (JGFGPSPhotoProperties * _Nullable)loadGPSDataWithKey:(CFStringRef)key
{
    NSString *castedKey = (__bridge NSString *)key;
    id obj = [self.rawData objectForKey:castedKey];
    
    if ([obj isKindOfClass:[NSDictionary class]])
    {
        return [[JGFGPSPhotoProperties alloc] initWithDictionary:obj];
    }
    
    return nil;
}

@end

@implementation JGFTIFFPhotoProperties

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

- (JGFPhotoStringProperty * _Nullable)imageDescription
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyTIFFImageDescription, JGFPhotoPropertyTypeString);
}

- (JGFPhotoStringProperty * _Nullable)documentName
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyTIFFDocumentName, JGFPhotoPropertyTypeString);
}

- (JGFPhotoStringProperty * _Nullable)make
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyTIFFMake, JGFPhotoPropertyTypeString);
}

- (JGFPhotoStringProperty * _Nullable)model
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyTIFFModel, JGFPhotoPropertyTypeString);
}

- (JGFPhotoStringProperty * _Nullable)software
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyTIFFSoftware, JGFPhotoPropertyTypeString);
}

- (JGFPhotoStringProperty * _Nullable)dateTime
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyTIFFDateTime, JGFPhotoPropertyTypeString);
}

- (JGFPhotoStringProperty * _Nullable)artist
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyTIFFArtist, JGFPhotoPropertyTypeString);
}

- (JGFPhotoStringProperty * _Nullable)hostComputer
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyTIFFHostComputer, JGFPhotoPropertyTypeString);
}

- (JGFPhotoStringProperty * _Nullable)copyright
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyTIFFCopyright, JGFPhotoPropertyTypeString);
}

@end

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
