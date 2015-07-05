//
//  ImageRenamer.swift
//  RawUtil
//
//  Created by Joshua Fuglsang on 5/07/2015.
//  Copyright (c) 2015 josh-fuggle. All rights reserved.
//

import Foundation
import ImageIO

class ImageRenamer: ImageProcessor {
    
    let baseImageName: String
    let fm: NSFileManager
    
    init(baseImageName: String, fm: NSFileManager) {
        self.baseImageName = baseImageName
        self.fm = fm
    }
    
    func processURLs(URLs: [NSURL]?) {
        if let URLs = URLs {
            for URL in URLs {
                processURL(URL: URL)
            }
        }
    }
    
    func processURL(URL from: NSURL) {
        
        println("BEGIN -> Process image at URL: \(from)")
        
        if let source = CGImageSourceCreateWithURL(from, nil) {
            
            let imageRef = CGImageSourceCreateImageAtIndex(source, 0, nil)
            let imageMetadata = CGImageSourceCopyMetadataAtIndex(source, 0, nil)
            
            if let baseURL = from.URLByDeletingLastPathComponent, originalExtension = from.pathExtension {
                
                var to = baseURL.URLByAppendingPathComponent(calcImageName(source))
                to = to.URLByAppendingPathExtension(originalExtension)
                
                var error: NSError?
                fm.moveItemAtURL(from, toURL: to, error: &error)
            }
            
        } else {
            println("FAILED -> Could not load image at URL: \(from)")
        }
    }
    
    func calcImageName(imageSource: CGImageSourceRef) -> String {
        
        // Assemble all the name components
        var nameComponents = NSMutableArray()
        nameComponents.addObject(baseImageName)
        
        let imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil)
        
        // Get date taken
        let exifPropertiesPointer = CFDictionaryGetValue(imageProperties, unsafeAddressOf(kCGImagePropertyExifDictionary))
        if exifPropertiesPointer != nil {
            let exifPropertiesUnsafe = unsafeBitCast(exifPropertiesPointer, CFDictionaryRef.self)
            
            let dateTakenPointer = CFDictionaryGetValue(exifPropertiesUnsafe, unsafeAddressOf(kCGImagePropertyExifDateTimeOriginal))
            if dateTakenPointer != nil {
                let dateTakenUnsafe = unsafeBitCast(dateTakenPointer, CFStringRef.self)
                let dateTaken = dateTakenUnsafe as! String
                
                let inFormatter = NSDateFormatter()
                inFormatter.dateFormat = "yyyy:MM:dd HH:mm:ss"
                let date = inFormatter.dateFromString(dateTaken)
                
                let outFormatter = NSDateFormatter()
                outFormatter.dateFormat = "yyyyMMdd_HHmmss"
                let formattedDateTaken = outFormatter.stringFromDate(date!)
                nameComponents.addObject(formattedDateTaken)
            }
        }
        
        
        // Camera Model (GoPro, Pentax, etc.)
        let tiffPropertiesPointer = CFDictionaryGetValue(imageProperties, unsafeAddressOf(kCGImagePropertyTIFFDictionary))
        
        if tiffPropertiesPointer != nil {
            let tiffPropertiesUnsafe = unsafeBitCast(tiffPropertiesPointer, CFDictionaryRef.self)
            
            let makePointer = CFDictionaryGetValue(tiffPropertiesUnsafe, unsafeAddressOf(kCGImagePropertyTIFFModel))
            if makePointer != nil {
                let unsafeMake = unsafeBitCast(makePointer, CFStringRef.self)
                var makeString = unsafeMake as! String
                var makeComponents = makeString.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: " +,.-_"))
                nameComponents.addObject(makeComponents.first!)
            }
        }
        
        // Build the new name
        var newName = nameComponents.componentsJoinedByString("_")
        
        newName = newName.stringByReplacingOccurrencesOfString(" ", withString: "_")
        
        return newName.uppercaseString
    }
    
}
