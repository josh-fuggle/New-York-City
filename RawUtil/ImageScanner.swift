//
//  ImageScanner.swift
//  Disneyland
//
//  Created by Joshua Fuglsang on 5/07/2015.
//  Copyright (c) 2015 josh-fuggle. All rights reserved.
//

import Foundation

class ImageScanner {
    
    let baseURL: NSURL
    let fm: NSFileManager
    var scannedImageURLs: [NSURL]?
    
    init (baseURL: NSURL, fm: NSFileManager) {
        self.baseURL = baseURL
        self.fm = fm
    }
    
    func scan() {
        self.scannedImageURLs = recurseDirectories(self.baseURL, fileManager: self.fm)
    }
    
    private func recurseDirectories(URL: NSURL, fileManager fm: NSFileManager) -> [NSURL]? {
        
        let enumerator = fm.enumeratorAtURL(
            URL,
            includingPropertiesForKeys: nil,
            options: (.SkipsHiddenFiles | .SkipsPackageDescendants),
            errorHandler: { _, _ -> Bool in
                return true
        })
        
        if let results = enumerator?.allObjects as? [NSURL] {
            
            var directoryURLs = [NSURL]()
            var imageURLs = [NSURL]()
            
            for node in results {
                
                var isDirectory: AnyObject?
                var error: NSError?
                
                node.getResourceValue(&isDirectory, forKey: NSURLIsDirectoryKey, error: &error)
                
                println("🏁 About to check if file can be processed: \(node)")
                
                if let isDirectory = isDirectory as? Bool where isDirectory == true {
                    directoryURLs.append(node)
                    println("✅ File can be processed as a directory.")
                    
                } else {
                    
                    // If the file is an image, then add it for processing.
                    if let fileExt = node.pathExtension {
                        
                        let unmanagedFileUTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, fileExt, nil)
                        let fileUTI = unmanagedFileUTI.takeRetainedValue()
                        let isImage: Bool = (UTTypeConformsTo(fileUTI, kUTTypeImage) != 0)
                        
                        if isImage {
                            imageURLs.append(node)
                            println("✅ File can be processed as an image.")
                        } else {
                            println("❌ File extension is not compatible: \(fileExt)")
                        }
                    }
                }
            }
            
            for directoryURL in directoryURLs {
                if let children = recurseDirectories(directoryURL, fileManager: fm) {
                    imageURLs = imageURLs + children
                }
            }
            
            return imageURLs
        }
        
        return nil
    }
}