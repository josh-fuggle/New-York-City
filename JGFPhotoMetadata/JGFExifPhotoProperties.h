//
//  JGFExifPhotoProperties.h
//  New York City
//
//  Created by Joshua Fuglsang on 26/07/2015.
//  Copyright © 2015 josh-fuggle. All rights reserved.
//

@import Foundation;

#import "JGFPhotoProperty.h"
#import "JGFPhotoPropertySet.h"

@interface JGFExifPhotoProperties : NSObject <JGFPhotoPropertySet>

@property (nullable, nonatomic, readonly) JGFPhotoFloatProperty *exposureTime;
@property (nullable, nonatomic, readonly) JGFPhotoFloatProperty *FNumber;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *spectralSensitivity;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *ISOSpeedRatings;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *OECF;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *sensitivityType;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *standardOutputSensitivity;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *recommendedExposureIndex;
@property (nullable, nonatomic, readonly) JGFPhotoFloatProperty *ISOSpeed;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *ISOSpeedLatitudeyyy;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *ISOSpeedLatitudezzz;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *ExifVersion;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *dateTimeOriginal;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *dateTimeDigitized;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *componentsConfiguration;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *compressedBitsPerPixel;
@property (nullable, nonatomic, readonly) JGFPhotoFloatProperty *shutterSpeedValue;
@property (nullable, nonatomic, readonly) JGFPhotoFloatProperty *apertureValue;
@property (nullable, nonatomic, readonly) JGFPhotoFloatProperty *brightnessValue;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *exposureBiasValue;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *maxApertureValue;
@property (nullable, nonatomic, readonly) JGFPhotoFloatProperty *subjectDistance;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *meteringMode;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *lightSource;
@property (nullable, nonatomic, readonly) JGFPhotoBoolProperty *flash;
@property (nullable, nonatomic, readonly) JGFPhotoFloatProperty *focalLength;
@property (nullable, nonatomic, readonly) JGFPhotoFloatProperty *subjectArea;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *makeNote;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *userComment;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *subsecTime;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *subsecTimeOrginal;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *subsecTimeDigitized;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *flashPixVersion;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *colorSpace;
@property (nullable, nonatomic, readonly) JGFPhotoIntegerProperty *pixelXDimension;
@property (nullable, nonatomic, readonly) JGFPhotoIntegerProperty *pixelYDimension;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *relatedSoundFile;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *flashEnergy;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *spatialFrequencyResponse;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *focalPlaneXResolution;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *focalPlaneYResolution;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *focalPlaneResolutionUnit;
@property (nullable, nonatomic, readonly) JGFPhotoFloatProperty *subjectLocation;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *exposureIndex;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *sensingMethod;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *fileSource;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *sceneType;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *CFAPattern;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *customRendered;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *exposureMode;
@property (nullable, nonatomic, readonly) JGFPhotoFloatProperty *whiteBalance;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *digitalZoomRatio;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *focalLenIn35mmFilm;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *sceneCaptureType;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *gainControl;
@property (nullable, nonatomic, readonly) JGFPhotoFloatProperty *contrast;
@property (nullable, nonatomic, readonly) JGFPhotoFloatProperty *saturation;
@property (nullable, nonatomic, readonly) JGFPhotoFloatProperty *sharpness;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *deviceSettingDescription;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *subjectDistRange;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *imageUniqueID;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *cameraOwnerName;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *bodySerialNumber;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *lensSpecification;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *lensMake;
@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *lensModel;
//@property (nullable, nonatomic, readonly) JGFPhotoStringProperty *lensSerialNumber;
@property (nullable, nonatomic, readonly) JGFPhotoFloatProperty *gamma;

@end
