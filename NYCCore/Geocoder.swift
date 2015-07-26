//
//  Geocoder.swift
//  New York City
//
//  Created by Joshua Fuglsang on 26/07/2015.
//  Copyright © 2015 josh-fuggle. All rights reserved.
//

import Foundation
import CoreLocation

public typealias GeocodeCompletionHandler = (Geocoder) -> Void

public class Geocoder {
    
    public var placemarks: [CLPlacemark]?
    
    private let location: CLLocation
    private let geocoder: CLGeocoder
    
    public init(loc: CLLocation) {
        location = loc
        geocoder = CLGeocoder()
    }
    
    public func geocode(completion: GeocodeCompletionHandler) {
        geocoder.reverseGeocodeLocation(location) { [unowned self] (placemarks, error) -> Void in
            if let error = error {
                print("Failed to geocode with error: \(error)")
            } else {
                self.placemarks = placemarks
            }
            completion(self)
        }
    }
    
}

