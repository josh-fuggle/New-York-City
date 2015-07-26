//
//  JGFPhotoPropertySet.h
//  New York City
//
//  Created by Joshua Fuglsang on 26/07/2015.
//  Copyright © 2015 josh-fuggle. All rights reserved.
//

@import Foundation;

@protocol JGFPhotoPropertySet <NSObject>

- (nonnull instancetype)initWithDictionary:(nonnull NSDictionary *)dictionary;

@property (nonnull, nonatomic, strong) NSDictionary *rawData;

@end
