//
//  RAWConverter.swift
//  New York City
//
//  Created by Joshua Fuglsang on 5/07/2015.
//  Copyright (c) 2015 josh-fuggle. All rights reserved.
//

import Foundation
import ImageIO

private func CGImageWriteToURL(image: CGImageRef, URL: NSURL, metadata: CGImageMetadataRef) {
    let url = URL as CFURLRef
    if let destination = CGImageDestinationCreateWithURL(url, kUTTypeJPEG, 1, nil) {
        CGImageDestinationAddImageAndMetadata(destination, image, metadata, nil)
        
        if (CGImageDestinationFinalize(destination)) {
            print("✅ Saved image to URL: \(URL)")
        } else {
            print("❌ Could not save image to URL: \(URL)")
        }
    }
    else {
        // TODO
    }
}

public class RAWConverter: ImageProcessor {
    
    let supportedRAWFormats: [String]
    let fm: NSFileManager
    
    public init(supportedRAWFormats: [String], fm: NSFileManager) {
        self.supportedRAWFormats = supportedRAWFormats
        self.fm = fm
    }
    
    public func processURLs(URLs: [NSURL]?, dryRun: Bool) {
        if let URLs = URLs {
            for URL in URLs {
                processURL(URL: URL, dryRun: dryRun)
            }
        }
    }
    
    public func processURL(URL from: NSURL, dryRun: Bool) {
        print("🏁 Process image at URL for conversion: \(from)")
        
        if let source = CGImageSourceCreateWithURL(from, nil),
            imageRef = CGImageSourceCreateImageAtIndex(source, 0, nil),
            imageMetadata = CGImageSourceCopyMetadataAtIndex(source, 0, nil) {
            
            if let baseURL = from.URLByDeletingLastPathComponent,
                originalExtension = from.pathExtension,
                name = from.lastPathComponent?.stringByDeletingPathExtension {
                    
                    let JPEGDirectory = baseURL
                    let RAWDirectory = baseURL.URLByAppendingPathComponent("RAW")
                    
                    if self.supportedRAWFormats.contains(originalExtension) {
                        
                        var originalDestination = RAWDirectory.URLByAppendingPathComponent(name)
                        originalDestination = originalDestination.URLByAppendingPathExtension(originalExtension)
                        
                        if !dryRun {
                            
                            do {
                                try fm.moveItemAtURL(from, toURL: originalDestination)
                                try fm.createDirectoryAtURL(RAWDirectory, withIntermediateDirectories: true, attributes: nil)
                            } catch {
                                // TODO
                            }
                        }
                        
                        print("✅ Moved original to directory: \(originalDestination)")
                        
                        var newDestination = JPEGDirectory.URLByAppendingPathComponent(name.stringByDeletingPathExtension)
                        newDestination = newDestination.URLByAppendingPathExtension("JPG")
                        
                        if !dryRun {
                            CGImageWriteToURL(imageRef, URL: newDestination, metadata: imageMetadata)
                        }
                        
                        print("✅ Exported compressed copy to directory: \(newDestination)")
                        
                    } else {
                        print("❌ Image is not of a supported RAW format: \(from)")
                    }
            }
            
        } else {
            print("❌ Could not load image at URL: \(from)")
        }
    }
}