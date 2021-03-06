//
//  Options.swift
//  New York City
//
//  Created by Joshua Fuglsang on 5/07/2015.
//  Copyright (c) 2015 josh-fuggle. All rights reserved.
//

import Foundation

public class Options {
    
    public var dryRun: Bool
    
    public var shouldRename: Bool
    public var shouldConvertRAWs: Bool
    
    public var albumName: String?
    public var basePath: String?
    
    public init(arguments: [String]) {
        
        // Helpers
        
        func getValue(currentIndex: Int, offset: Int, arguments: [String]) -> String? {
            let nextIndex = (currentIndex + offset)
            if nextIndex >= arguments.count {
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
            
            for (index, element) in arguments.enumerate() {
                
                if element == "--album" {
                    albumName = getValue(index, offset: 1, arguments: arguments)
                    
                } else if element == "--path" {
                    basePath = getValue(index, offset: 1, arguments: arguments)
                    
                    // First character is a fullstop, expand it to the cwd
                    if let firstChar = Array(arrayLiteral: basePath)[0] where firstChar == "." {
                        basePath?.stringByReplacingOccurrencesOfString(
                            ".",
                            withString: NSFileManager.defaultManager().currentDirectoryPath
                        )
                    }
                    
                    basePath = basePath?.stringByExpandingTildeInPath
                    
                } else if element == "--dryrun" {
                    dryRun = true
                    
                    // Check if the immediatley following value is a negating value. If not, assume true.
                    if let nextElement = getValue(index, offset: 1, arguments: arguments) {
                        if nextElement == "false" || nextElement == "0" || nextElement == "NO" {
                            dryRun = false
                        }
                    }
                    
                }
            }
        }
    }
    
    public func validate() -> (valid: Bool, suggestions: [String]?) {
        
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
        
        if errors.count > 0 {
            return (false, errors)
        }
        
        return (true, nil)
    }
}