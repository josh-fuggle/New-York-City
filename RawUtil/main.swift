//
//  main.swift
//  RawUtil
//
//  Created by Joshua Fuglsang on 20/06/2015.
//  Copyright (c) 2015 josh-fuggle. All rights reserved.
//

import Foundation
import ImageIO

func imageName(baseImageName: String, imageSource: CGImageSourceRef) -> String {
    
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

func CGImageWriteToURL(image: CGImageRef, URL: NSURL, metadata: CGImageMetadataRef) {
    let url = URL as CFURLRef
    let destination = CGImageDestinationCreateWithURL(url, kUTTypeJPEG, 1, nil)
    CGImageDestinationAddImageAndMetadata(destination, image, metadata, nil)
    
    if (CGImageDestinationFinalize(destination)) {
        println("SUCCESS -> Saved image to URL: \(URL)")
    } else {
        println("FAILED -> Could not save image to URL: \(URL)")
    }
}

func processDirectory(URL: NSURL, fileManager fm: NSFileManager, baseImageName: String) {
        
    let enumerator = fm.enumeratorAtURL(
        URL,
        includingPropertiesForKeys: nil,
        options: (.SkipsHiddenFiles | .SkipsPackageDescendants),
        errorHandler: { _, _ -> Bool in
            return true
    })
    
    // Fix the results, so that we don't walk in to any new files.
    // I.e. our own generated subdirectories.
    if let results = enumerator?.allObjects as? [NSURL] {
    
        
        // Build an array of directories for us to walk in to,
        // and an array of images to process.
        var directoryURLs = [NSURL]()
        var imageURLs = [NSURL]()
        
        for node in results {
            
            var isDirectory: AnyObject?
            var error: NSError?
            
            node.getResourceValue(&isDirectory, forKey: NSURLIsDirectoryKey, error: &error)
            
            if let isDirectory = isDirectory as? Bool where isDirectory == true {
                directoryURLs.append(node)
                
            } else {
                
                // If the file is an image, then add it for processing.
                if let fileExt = node.pathExtension {
                    
                    let unmanagedFileUTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, fileExt, nil)
                    let fileUTI = unmanagedFileUTI.takeRetainedValue()
                    let isImage: Bool = (UTTypeConformsTo(fileUTI, kUTTypeImage) != 0)
                    
                    if isImage {
                        imageURLs.append(node)
                    }
                }
            }
        }
        
        for directoryURL in directoryURLs {
            processDirectory(directoryURL, fileManager: fm, baseImageName)
        }
        
        for imageURL in imageURLs {
            processURL(imageURL, fm, baseImageName)
        }
        
    }
}

func processURL(URL: NSURL, fm: NSFileManager, baseImageName: String) {
            
    println("BEGIN -> Process image at URL: \(URL)")
    
    if let source = CGImageSourceCreateWithURL(URL, nil) {
        
        let imageRef = CGImageSourceCreateImageAtIndex(source, 0, nil)
        let imageMetadata = CGImageSourceCopyMetadataAtIndex(source, 0, nil)
        
        if let baseURL = URL.URLByDeletingLastPathComponent, originalExtension = URL.pathExtension {
                
            let name = imageName(baseImageName, source)
            
            var JPEGDirectory = baseURL
            var RAWDirectory = baseURL.URLByAppendingPathComponent("RAW")
            
            var error: NSError?
            
            if originalExtension == "PEF" {
                
                var originalDestination = RAWDirectory.URLByAppendingPathComponent(name)
                originalDestination = originalDestination.URLByAppendingPathExtension(originalExtension)
                
                fm.moveItemAtURL(URL, toURL: originalDestination, error: &error)
                fm.createDirectoryAtURL(RAWDirectory, withIntermediateDirectories: true, attributes: nil, error: &error)
                
                var newDestination = JPEGDirectory.URLByAppendingPathComponent(name.stringByDeletingPathExtension)
                newDestination = newDestination.URLByAppendingPathExtension("JPG")
                
                CGImageWriteToURL(imageRef, newDestination, imageMetadata)
                
            } else {
                
                var originalDestination = JPEGDirectory.URLByAppendingPathComponent(name)
                originalDestination = originalDestination.URLByAppendingPathExtension(originalExtension)
                
                fm.moveItemAtURL(URL, toURL: originalDestination, error: &error)
                
                println("INFO -> Image is not a RAW. Skipping.")
            }
        }
        
    } else {
        println("FAILED -> Could not load image at URL: \(URL)")
    }
}



var arguments = Process.arguments

if count(arguments) > 0 {
    let baseImageName = "Events" //arguments[1]
    let path = "/Volumes/Papaya/Photos/Events" //NSFileManager.defaultManager().currentDirectoryPath // "/Users/jf/Desktop/Processable"

    if let rootURL = NSURL(fileURLWithPath: path) {
        processDirectory(rootURL, fileManager: NSFileManager.defaultManager(), baseImageName)
    }
    
} else {
    println("You need to provide a base image name.")
}






