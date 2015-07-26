//
//  JGFPhotoMetadata.m
//  New York City
//
//  Created by Joshua Fuglsang on 21/07/2015.
//  Copyright (c) 2015 josh-fuggle. All rights reserved.
//

#import "JGFPhotoInformation.h"

@implementation JGFPhotoInformation

+ (nullable instancetype)photoInformationWithURL:(nullable NSURL *)URL
{
    CGImageSourceRef source = CGImageSourceCreateWithURL((CFURLRef)URL, NULL);
    return [self photoInformationWithImageSource:source];
}

+ (nullable instancetype)photoInformationWithImageSource:(nullable CGImageSourceRef)source
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
