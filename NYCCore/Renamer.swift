//
//  Renamer.swift
//  New York City
//
//  Created by Joshua Fuglsang on 5/07/2015.
//  Copyright (c) 2015 josh-fuggle. All rights reserved.
//

import Foundation
import JGFPhotoMetadata

public class Renamer: ImageProcessor {
    
    let baseImageName: String
    let fm: NSFileManager
    
    public init(baseImageName: String, fm: NSFileManager) {
        self.baseImageName = baseImageName
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
        
        print("🏁 Process image at URL for renaming: \(from)")
        
        if let baseURL = from.URLByDeletingLastPathComponent, originalExtension = from.pathExtension?.uppercaseString {
            
            var to = baseURL.URLByAppendingPathComponent(calcImageName(from))
            to = to.URLByAppendingPathExtension(originalExtension)
            
            if !dryRun {
                do {
                    try fm.moveItemAtURL(from, toURL: to)
                } catch {
                    // TODO
                }
            }
            
            print("✅ Moved image to path: \(to)")
        }
    }
    
    func calcImageName(URL: NSURL) -> String {
        
        func formatSystemDate(dateTaken: String) -> String {
            let inFormatter = NSDateFormatter()
            inFormatter.dateFormat = "yyyy:MM:dd HH:mm:ss"
            let date = inFormatter.dateFromString(dateTaken)
            
            let outFormatter = NSDateFormatter()
            outFormatter.dateFormat = "yyyyMMdd_HHmmss"
            let formattedDateTaken = outFormatter.stringFromDate(date!)
            
            return formattedDateTaken
        }
        
        // Assemble all the name components
        var dateExtracted = false
        let nameComponents = NSMutableArray()
        nameComponents.addObject(baseImageName)
        
        if let properties = JGFPhotoInformation.propertyTreeWithURL(URL) {
        
            if let Exif = properties.ExifData, dateTime = Exif.dateTimeOriginal {
                nameComponents.addObject(formatSystemDate(dateTime.value))
                dateExtracted = true
            }
            
            
            if let TIFF = properties.TIFFData {
                
                if let dateTime = TIFF.dateTime where dateExtracted == false {
                    nameComponents.addObject(formatSystemDate(dateTime.value))
                    dateExtracted = true
                }
                
                if let model = TIFF.model {
                    var makeComponents = model.value.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: " +,.-_"))
                    nameComponents.addObject(makeComponents.first!)
                }
                
            }
        }
        
        if dateExtracted == false {
            print("❌ Unable to extract creation date.")
        }
        
        // Build the new name
        var newName = nameComponents.componentsJoinedByString("_")
        
        newName = newName.stringByReplacingOccurrencesOfString(" ", withString: "_")
        
        return newName.uppercaseString
    }
    
}
