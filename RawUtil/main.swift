//
//  main.swift
//  Disneyland
//
//  Created by Joshua Fuglsang on 20/06/2015.
//  Copyright (c) 2015 josh-fuggle. All rights reserved.
//

import Foundation

func letsGo(options: Options) {

    // Validate the the user passed in correct arguements.
    let results = options.validate()
    if let suggestions = results.suggestions where results.valid == false {
        for suggestion in suggestions {
            println(" 🔫 \(suggestion)")
        }
        return
    }
    
    // Let's begin
    if let path = options.basePath, let baseURL = NSURL(fileURLWithPath: path) {
        
        let fm = NSFileManager.defaultManager()

        let scanner = ImageScanner(baseURL: baseURL, fm: fm)
        scanner.scan()
        let URLs = scanner.scannedImageURLs

        // Rename first
        if let album = options.albumName where options.shouldRename == true {
            let renamer = ImageRenamer(baseImageName: album, fm: fm)
            renamer.processURLs(URLs, dryRun: options.dryRun)
        }
        
        // Now process RAWs
        if options.shouldConvertRAWs {
            let converter = RAWConverter(supportedRAWFormats: ["PEF"], fm: fm)
            converter.processURLs(URLs, dryRun: options.dryRun)
        }
    }
}

letsGo(Options(arguments: Process.arguments))

