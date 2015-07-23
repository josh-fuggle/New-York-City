//
//  Renamer.swift
//  Disneyland
//
//  Created by Joshua Fuglsang on 5/07/2015.
//  Copyright (c) 2015 josh-fuggle. All rights reserved.
//

import Foundation

class Renamer: ImageProcessor {
    
    let baseImageName: String
    let fm: NSFileManager
    
    init(baseImageName: String, fm: NSFileManager) {
        self.baseImageName = baseImageName
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
        
        println("🏁 Process image at URL for renaming: \(from)")
        
        if let baseURL = from.URLByDeletingLastPathComponent, originalExtension = from.pathExtension?.uppercaseString {
            
            var to = baseURL.URLByAppendingPathComponent(calcImageName(from))
            to = to.URLByAppendingPathExtension(originalExtension)
            
            if !dryRun {
                var error: NSError?
                fm.moveItemAtURL(from, toURL: to, error: &error)
            }
            
            println("✅ Moved image to path: \(to)")
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
        var nameComponents = NSMutableArray()
        nameComponents.addObject(baseImageName)
        
        if let properties = JGFPhotoProperties.propertyTreeWithURL(URL) {
        
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
            println("❌ Unable to extract creation date.")
        }
        
        // Build the new name
        var newName = nameComponents.componentsJoinedByString("_")
        
        newName = newName.stringByReplacingOccurrencesOfString(" ", withString: "_")
        
        return newName.uppercaseString
    }
    
}
