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
    
    var information: JGFPhotoInformation?

    override func setUp() {
        super.setUp()
        
        let imageURL = NSBundle(forClass: self.classForCoder).URLForResource("sallykins", withExtension: "jpg")
        
        if let information = JGFPhotoInformation(URL: imageURL) {
            self.information = information
        } else {
            XCTFail()
        }
    }
    
    func testThatItCorrectlyReturnsProperties() {
        
        if let info = self.information, GPSData = info.GPSData {
            
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
