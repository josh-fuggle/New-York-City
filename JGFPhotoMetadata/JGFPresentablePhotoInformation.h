//
//  JGFPresentablePhotoInformation.h
//  New York City
//
//  Created by Joshua Fuglsang on 26/07/2015.
//  Copyright © 2015 josh-fuggle. All rights reserved.
//

@import Foundation;

@protocol JGFPresentablePhotoInformation <NSObject>

- (NSString *)localizedTitle;
- (NSArray *)presentablePhotoInformation;

@end
