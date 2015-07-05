//
//  RAWConverter.swift
//  RawUtil
//
//  Created by Joshua Fuglsang on 5/07/2015.
//  Copyright (c) 2015 josh-fuggle. All rights reserved.
//

import Foundation
import ImageIO

func CGImageWriteToURL(image: CGImageRef, URL: NSURL, metadata: CGImageMetadataRef) {
    let url = URL as CFURLRef
    let destination = CGImageDestinationCreateWithURL(url, kUTTypeJPEG, 1, nil)
    CGImageDestinationAddImageAndMetadata(destination, image, metadata, nil)
    
    if (CGImageDestinationFinalize(destination)) {
        println("✅ Saved image to URL: \(URL)")
    } else {
        println("❌ Could not save image to URL: \(URL)")
    }
}

class RAWConverter: ImageProcessor {
    
    let supportedRAWFormats: [String]
    let fm: NSFileManager
    
    init(supportedRAWFormats: [String], fm: NSFileManager) {
        self.supportedRAWFormats = supportedRAWFormats
        self.fm = fm
    }
    
    func processURLs(URLs: [NSURL]?, dryRun: Bool) {
        if let URLs = URLs {
            for URL in URLs {
                processURL(URL: URL, dryRun: dryRun)
            }
        }
    }
    
    func processURL(URL from: NSURL, dryRun: Bool) {
        println("🏁 Process image at URL for conversion: \(from)")
        
        if let source = CGImageSourceCreateWithURL(from, nil) {
            
            let imageRef = CGImageSourceCreateImageAtIndex(source, 0, nil)
            let imageMetadata = CGImageSourceCopyMetadataAtIndex(source, 0, nil)
            
            if let baseURL = from.URLByDeletingLastPathComponent,
                originalExtension = from.pathExtension,
                name = from.lastPathComponent?.stringByDeletingPathExtension {
                    
                    var JPEGDirectory = baseURL
                    var RAWDirectory = baseURL.URLByAppendingPathComponent("RAW")
                    
                    var error: NSError?
                    
                    if contains(self.supportedRAWFormats, originalExtension) {
                        
                        var originalDestination = RAWDirectory.URLByAppendingPathComponent(name)
                        originalDestination = originalDestination.URLByAppendingPathExtension(originalExtension)
                        
                        if !dryRun {
                            fm.moveItemAtURL(from, toURL: originalDestination, error: &error)
                            fm.createDirectoryAtURL(RAWDirectory, withIntermediateDirectories: true, attributes: nil, error: &error)
                        }
                        
                        println("✅ Moved original to directory: \(originalDestination)")
                        
                        var newDestination = JPEGDirectory.URLByAppendingPathComponent(name.stringByDeletingPathExtension)
                        newDestination = newDestination.URLByAppendingPathExtension("JPG")
                        
                        if !dryRun {
                            CGImageWriteToURL(imageRef, newDestination, imageMetadata)
                        }
                        
                        println("✅ Exported compressed copy to directory: \(newDestination)")
                        
                    } else {
                        println("❌ Image is not of a supported RAW format: \(from)")
                    }
            }
            
        } else {
            println("❌ Could not load image at URL: \(from)")
        }
    }
}