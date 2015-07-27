//
//  JGFGPSPhotoProperties.h
//  New York City
//
//  Created by Joshua Fuglsang on 25/07/2015.
//  Copyright © 2015 josh-fuggle. All rights reserved.
//

@import Foundation;

#import "JGFPhotoProperty.h"
#import "JGFPhotoPropertySet.h"
#import "JGFPresentablePhotoInformation.h"

@interface JGFGPSPhotoProperties : NSObject <JGFPhotoPropertySet, JGFPresentablePhotoInformation>

@property (nullable, atomic, readonly) JGFPhotoFloatProperty *latitude;
@property (nullable, atomic, readonly) JGFPhotoFloatProperty *longitude;
@property (nullable, atomic, readonly) JGFPhotoFloatProperty *altitude;
@property (nullable, atomic, readonly) JGFPhotoStringProperty *timeStamp;
@property (nullable, atomic, readonly) JGFPhotoIntegerProperty *satellites;
@property (nullable, atomic, readonly) JGFPhotoIntegerProperty *status;
@property (nullable, atomic, readonly) JGFPhotoStringProperty *areaInformation;
@property (nullable, atomic, readonly) JGFPhotoStringProperty *dateStamp;
@property (nullable, atomic, readonly) JGFPhotoFloatProperty *DOP; // precision

//@property (nullable, atomic, readonly) JGFPhotoStringProperty *version;
//@property (nullable, atomic, readonly) JGFPhotoBoolProperty *latitudeRef;
//@property (nullable, atomic, readonly) JGFPhotoBoolProperty *longitudeRef;
//@property (nullable, atomic, readonly) JGFPhotoBoolProperty *altitudeRef;
//@property (nullable, atomic, readonly) JGFPhotoIntegerProperty *measureMode;
//@property (nullable, atomic, readonly) JGFPhotoIntegerProperty *speedRef;
//@property (nullable, atomic, readonly) JGFPhotoIntegerProperty *speed;
//@property (nullable, atomic, readonly) JGFPhotoIntegerProperty *trackRef;
//@property (nullable, atomic, readonly) JGFPhotoIntegerProperty *track;
//@property (nullable, atomic, readonly) JGFPhotoIntegerProperty *imageDirectionRef;
//@property (nullable, atomic, readonly) JGFPhotoIntegerProperty *imageDirection;
//@property (nullable, atomic, readonly) JGFPhotoIntegerProperty *mapDatum;
//@property (nullable, atomic, readonly) JGFPhotoIntegerProperty *destLatitudeRef;
//@property (nullable, atomic, readonly) JGFPhotoIntegerProperty *destLatitude;
//@property (nullable, atomic, readonly) JGFPhotoIntegerProperty *destLongitudeRef;
//@property (nullable, atomic, readonly) JGFPhotoIntegerProperty *destLongitude;
//@property (nullable, atomic, readonly) JGFPhotoIntegerProperty *destBearingRef;
//@property (nullable, atomic, readonly) JGFPhotoIntegerProperty *destBearing;
//@property (nullable, atomic, readonly) JGFPhotoIntegerProperty *destDistanceRef;
//@property (nullable, atomic, readonly) JGFPhotoIntegerProperty *destDistance;
//@property (nullable, atomic, readonly) JGFPhotoIntegerProperty *processingMethod;
//@property (nullable, atomic, readonly) JGFPhotoIntegerProperty *differental;
//@property (nullable, atomic, readonly) JGFPhotoIntegerProperty *HPositioningError;

@end
