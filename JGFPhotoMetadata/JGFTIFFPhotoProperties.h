//
//  JGFTIFFPhotoProperties.h
//  New York City
//
//  Created by Joshua Fuglsang on 26/07/2015.
//  Copyright © 2015 josh-fuggle. All rights reserved.
//

@import Foundation;

#import "JGFPhotoProperty.h"
#import "JGFPhotoPropertySet.h"

@interface JGFTIFFPhotoProperties : NSObject <JGFPhotoPropertySet>

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
