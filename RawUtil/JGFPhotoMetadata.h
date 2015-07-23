//
//  JGFPhotoMetadata.h
//  Disneyland
//
//  Created by Joshua Fuglsang on 21/07/2015.
//  Copyright (c) 2015 josh-fuggle. All rights reserved.
//

@import Foundation;

#import "JGFPhotoProperty.h"

@protocol JGFPhotoPropertyTree <NSObject>
- (nonnull instancetype)initWithDictionary:(nonnull NSDictionary *)dictionary;
@property (nonnull, nonatomic, strong) NSDictionary *rawData;
@end

@class JGFTIFFPhotoProperties, JGFExifPhotoProperties;

@interface JGFPhotoProperties : NSObject <JGFPhotoPropertyTree>

+ (nullable instancetype)propertyTreeWithURL:(nullable NSURL *)URL;
+ (nullable instancetype)propertyTreeWithImageSource:(nullable CGImageSourceRef)imageSource;

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

@end

@interface JGFTIFFPhotoProperties : NSObject <JGFPhotoPropertyTree>

@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *imageDescription;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *documentName;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *make;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *model;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *software;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *dateTime;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *artist;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *hostComputer;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *copyright;

@end

@interface JGFExifPhotoProperties : NSObject <JGFPhotoPropertyTree>

// Note: a lot of these aren't implemented yet.

@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *exposureTime;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *FNumber;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *spectralSensitivity;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *ISOSpeedRatings;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *OECF;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *sensitivityType;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *standardOutputSensitivity;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *recommendedExposureIndex;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *ISOSpeed;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *ISOSpeedLatitudeyyy;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *ISOSpeedLatitudezzz;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *ExifVersion;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *dateTimeOriginal;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *dateTimeDigitized;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *componentsConfiguration;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *compressedBitsPerPixel;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *shutterSpeedValue;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *apertureValue;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *brightnessValue;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *exposureBiasValue;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *maxApertureValue;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *subjectDistance;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *meteringMode;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *lightSource;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *flash;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *focalLength;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *subjectArea;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *makeNote;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *userComment;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *subsecTime;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *subsecTimeOrginal;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *subsecTimeDigitized;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *flashPixVersion;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *colorSpace;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *pixelXDimension;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *pixelYDimension;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *relatedSoundFile;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *flashEnergy;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *spatialFrequencyResponse;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *focalPlaneXResolution;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *focalPlaneYResolution;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *focalPlaneResolutionUnit;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *subjectLocation;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *exposureIndex;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *sensingMethod;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *fileSource;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *sceneType;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *CFAPattern;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *customRendered;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *exposureMode;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *whiteBalance;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *digitalZoomRatio;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *focalLenIn35mmFilm;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *sceneCaptureType;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *gainControl;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *contrast;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *saturation;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *sharpness;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *deviceSettingDescription;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *subjectDistRange;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *imageUniqueID;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *cameraOwnerName;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *bodySerialNumber;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *lensSpecification;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *lensMake;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *lensModel;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *lensSerialNumber;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *gamma;

@end
