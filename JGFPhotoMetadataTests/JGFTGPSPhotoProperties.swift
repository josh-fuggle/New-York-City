//
//  JGFTGPSPhotoProperties.swift
//  New York City
//
//  Created by Joshua Fuglsang on 25/07/2015.
//  Copyright © 2015 josh-fuggle. All rights reserved.
//

import XCTest
import JGFPhotoMetadata

class JGFTGPSPhotoProperties: XCTestCase {
    
    var properties: JGFPhotoProperties?

    override func setUp() {
        super.setUp()
        
        let imageURL = NSBundle(forClass: self.classForCoder).URLForResource("sallykins", withExtension: "jpg")
        
        if let photoProperties = JGFPhotoProperties.propertyTreeWithURL(imageURL) {
            self.properties = photoProperties
        } else {
            XCTFail()
        }
    }
    
    func testThatItCorrectlyReturnsProperties() {
        
        if let props = self.properties, GPSData = props.GPSData {
            
            let latitude = GPSData.latitude!
            XCTAssertNotNil(latitude)
            
            let longitude = GPSData.longitude!
            XCTAssertNotNil(longitude)
            
            let dateStamp = GPSData.dateStamp!
            XCTAssertNotNil(dateStamp)
            
            let timeStamp = GPSData.timeStamp!
            XCTAssertNotNil(timeStamp)
            
            let altitude = GPSData.altitude!
            XCTAssertNotNil(altitude)
            
        } else {
            XCTFail()
        }
        
    }

}
