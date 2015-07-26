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

- (JGFPhotoIntegerProperty * __nullable)fileSize
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyFileSize, JGFPhotoPropertyTypeInteger);
}

- (JGFPhotoFloatProperty * __nullable)pixelWidth
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyDPIWidth, JGFPhotoPropertyTypeFloat);
}

- (JGFPhotoFloatProperty * __nullable)pixelHeight
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyPixelHeight, JGFPhotoPropertyTypeFloat);
}

- (JGFPhotoIntegerProperty * __nullable)depth
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyDepth, JGFPhotoPropertyTypeInteger);
}

- (JGFPhotoIntegerProperty * __nullable)DPIWidth
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyDPIWidth, JGFPhotoPropertyTypeInteger);
}

- (JGFPhotoIntegerProperty * __nullable)DPIHeight
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyDPIHeight, JGFPhotoPropertyTypeInteger);
}

- (JGFPhotoIntegerProperty * __nullable)orientation
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyOrientation, JGFPhotoPropertyTypeInteger);
}

- (JGFPhotoBoolProperty * __nullable)isFloat
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyIsFloat, JGFPhotoPropertyTypeBool);
}

- (JGFPhotoBoolProperty * __nullable)isIndexed
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyIsIndexed, JGFPhotoPropertyTypeBool);
}

- (JGFPhotoBoolProperty * __nullable)hasAlpha
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyHasAlpha, JGFPhotoPropertyTypeBool);
}

- (JGFPhotoStringProperty * __nullable)colorModel
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyColorModel, JGFPhotoPropertyTypeString);
}

- (JGFPhotoStringProperty * __nullable)profileName
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyProfileName, JGFPhotoPropertyTypeString);
}

- (JGFTIFFPhotoProperties * __nullable)TIFFData
{
    return [self loadTIFFDataWithKey:kCGImagePropertyTIFFDictionary];
}

- (JGFExifPhotoProperties * __nullable)ExifData
{
    return [self loadEXIFDataWithKey:kCGImagePropertyExifDictionary];
}

- (JGFGPSPhotoProperties * _Nullable)GPSData
{
    return [self loadGPSDataWithKey:kCGImagePropertyGPSDictionary];
}

#pragma mark - Private

- (JGFExifPhotoProperties * __nullable)loadEXIFDataWithKey:(CFStringRef)key
{
    NSString *castedKey = (__bridge NSString *)key;
    id obj = [self.rawData objectForKey:castedKey];
    
    if ([obj isKindOfClass:[NSDictionary class]])
    {
        return [[JGFExifPhotoProperties alloc] initWithDictionary:obj];
    }
    
    return nil;
}

- (JGFTIFFPhotoProperties * __nullable)loadTIFFDataWithKey:(CFStringRef)key
{
    NSString *castedKey = (__bridge NSString *)key;
    id obj = [self.rawData objectForKey:castedKey];
    
    if ([obj isKindOfClass:[NSDictionary class]])
    {
        return [[JGFTIFFPhotoProperties alloc] initWithDictionary:obj];
    }
    
    return nil;
}

- (JGFGPSPhotoProperties * __nullable)loadGPSDataWithKey:(CFStringRef)key
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

- (JGFPhotoStringProperty * __nullable)imageDescription
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyTIFFImageDescription, JGFPhotoPropertyTypeString);
}

- (JGFPhotoStringProperty * __nullable)documentName
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyTIFFDocumentName, JGFPhotoPropertyTypeString);
}

- (JGFPhotoStringProperty * __nullable)make
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyTIFFMake, JGFPhotoPropertyTypeString);
}

- (JGFPhotoStringProperty * __nullable)model
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyTIFFModel, JGFPhotoPropertyTypeString);
}

- (JGFPhotoStringProperty * __nullable)software
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyTIFFSoftware, JGFPhotoPropertyTypeString);
}

- (JGFPhotoStringProperty * __nullable)dateTime
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyTIFFDateTime, JGFPhotoPropertyTypeString);
}

- (JGFPhotoStringProperty * __nullable)artist
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyTIFFArtist, JGFPhotoPropertyTypeString);
}

- (JGFPhotoStringProperty * __nullable)hostComputer
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyTIFFHostComputer, JGFPhotoPropertyTypeString);
}

- (JGFPhotoStringProperty * __nullable)copyright
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

- (JGFPhotoStringProperty * __nullable)dateTimeOriginal
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifDateTimeOriginal, JGFPhotoPropertyTypeString);
}

- (JGFPhotoStringProperty * __nullable)dateTimeDigitized
{
    return JGFPhotoPropertyFromDict(self.rawData, kCGImagePropertyExifDateTimeDigitized, JGFPhotoPropertyTypeString);
}

@end
