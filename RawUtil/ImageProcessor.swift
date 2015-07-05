//
//  ImageProcessor.swift
//  RawUtil
//
//  Created by Joshua Fuglsang on 5/07/2015.
//  Copyright (c) 2015 josh-fuggle. All rights reserved.
//

import Foundation

protocol ImageProcessor {
    func processURLs(URLs: [NSURL]?)
    func processURL(URL from: NSURL)
}
