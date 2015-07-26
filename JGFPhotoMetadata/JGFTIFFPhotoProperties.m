//
//  JGFTIFFPhotoProperties.m
//  New York City
//
//  Created by Joshua Fuglsang on 26/07/2015.
//  Copyright © 2015 josh-fuggle. All rights reserved.
//

#import "JGFTIFFPhotoProperties.h"

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
