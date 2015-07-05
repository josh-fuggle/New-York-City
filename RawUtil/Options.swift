//
//  Options.swift
//  Disneyland
//
//  Created by Joshua Fuglsang on 5/07/2015.
//  Copyright (c) 2015 josh-fuggle. All rights reserved.
//

import Foundation

class Options {
    
    var dryRun: Bool
    
    var shouldRename: Bool
    var shouldConvertRAWs: Bool
    
    var albumName: String?
    var basePath: String?
    
    init(arguments: [String]) {
        
        // Helpers
        
        func getValue(currentIndex: Int, offset: Int, arguments: [String]) -> String? {
            let nextIndex = (currentIndex + offset)
            if nextIndex >= count(arguments) {
                return nil
            }
            return arguments[nextIndex]
        }
        
        
        // Defaults
        shouldRename = false
        shouldConvertRAWs = false
        dryRun = false
        
        if arguments.count > 0 {
            let command = arguments[1]
            
            if command == "rename" {
                shouldRename = true
                
            } else if command == "convert" {
                shouldConvertRAWs = true
            }
            
            for (index, element) in enumerate(arguments) {
                
                if element == "--album" {
                    albumName = getValue(index, 1, arguments)
                    
                } else if element == "--path" {
                    basePath = getValue(index, 1, arguments)
                    
                    // First character is a fullstop, expand it to the cwd
                    if let firstChar = Array(arrayLiteral: basePath)[0] where firstChar == "." {
                        basePath?.stringByReplacingOccurrencesOfString(
                            ".",
                            withString: NSFileManager.defaultManager().currentDirectoryPath,
                            options: .allZeros
                        )
                    }
                    
                    basePath = basePath?.stringByExpandingTildeInPath
                    
                } else if element == "--dryrun" {
                    dryRun = true
                    
                    // Check if the immediatley following value is a negating value. If not, assume true.
                    if let nextElement = getValue(index, 1, arguments) {
                        if nextElement == "false" || nextElement == "0" || nextElement == "NO" {
                            dryRun = false
                        }
                    }
                    
                }
            }
        }
    }
    
    func validate() -> (valid: Bool, suggestions: [String]?) {
        
        var errors = [String]()
        
        if shouldConvertRAWs == false && shouldRename == false {
            errors.append("You must specify either the 'rename' or 'convert' command as the first argument.")
            
        } else {
            if basePath == nil {
                errors.append("You must specify a --path parameter.")
            }
            
            if shouldRename {
                if albumName == nil {
                    errors.append("You must specify a --album parameter.")
                }
            }
        }
        
        if count(errors) > 0 {
            return (false, errors)
        }
        
        return (true, nil)
    }
}