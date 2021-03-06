//
//  ImageProcessor.swift
//  New York City
//
//  Created by Joshua Fuglsang on 5/07/2015.
//  Copyright (c) 2015 josh-fuggle. All rights reserved.
//

import Foundation

public protocol ImageProcessor {
    func processURLs(URLs: [NSURL]?, dryRun: Bool)
    func processURL(URL from: NSURL, dryRun: Bool)
}
