//
//  JGFPhotoMetadata.h
//  New York City
//
//  Created by Joshua Fuglsang on 21/07/2015.
//  Copyright (c) 2015 josh-fuggle. All rights reserved.
//

@import Foundation;

#import "JGFPhotoProperty.h"
#import "JGFPhotoPropertySet.h"
#import "JGFPresentablePhotoInformation.h"

#import "JGFGPSPhotoProperties.h"
#import "JGFExifPhotoProperties.h"
#import "JGFTIFFPhotoProperties.h"

@interface JGFPhotoInformation : NSObject <JGFPhotoPropertySet, JGFPresentablePhotoInformation>

+ (nullable instancetype)photoInformationWithURL:(nullable NSURL *)URL;
+ (nullable instancetype)photoInformationWithImageSource:(nullable CGImageSourceRef)source;

@property (nullable, nonatomic, readonly) JGFPhotoIntegerProperty *fileSize;
@property (nullable, nonatomic, readonly) JGFPhotoFloatProperty *pixelWidth;
@property (nullable, nonatomic, readonly) JGFPhotoFloatProperty *pixelHeight;
@property (nullable, nonatomic, readonly) JGFPhotoIntegerProperty *depth;
@property (nullable, nonatomic, readonly) JGFPhotoIntegerProperty *DPIWidth;
@property (nullable, nonatomic, readonly) JGFPhotoIntegerProperty *DPIHeight;
@property (nullable, nonatomic, readonly) JGFPhotoIntegerProperty *orientation;
@property (nullable, nonatomic, readonly) JGFPhotoBoolProperty *isFloat;
@property (nullable, nonatomic, readonly) JGFPhotoBoolProperty *isIndexed;
@property (nullable, nonatomic, readonly) JGFPhotoBoolProperty *hasAlpha;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *colorModel;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *profileName;

@property (nullable, nonatomic, readonly) JGFTIFFPhotoProperties *TIFFData;
@property (nullable, nonatomic, readonly) JGFExifPhotoProperties *ExifData;
@property (nullable, nonatomic, readonly) JGFGPSPhotoProperties *GPSData;

@end
