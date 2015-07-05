//
//  main.swift
//  RawUtil
//
//  Created by Joshua Fuglsang on 20/06/2015.
//  Copyright (c) 2015 josh-fuggle. All rights reserved.
//

import Foundation

//var arguments = Process.arguments
//
//if count(arguments) > 0 {
//    let baseImageName = "Events" //arguments[1]
//    let path = "/Volumes/Papaya/Photos/Events" //NSFileManager.defaultManager().currentDirectoryPath // "/Users/jf/Desktop/Processable"
//
//    if let rootURL = NSURL(fileURLWithPath: path) {
//        processDirectory(rootURL, fileManager: NSFileManager.defaultManager(), baseImageName)
//    }
//    
//} else {
//    println("You need to provide a base image name.")
//}

func letsGo() {

    let fm = NSFileManager.defaultManager()
    let baseURL = NSURL(fileURLWithPath: "/Users/jf/Desktop/Test")!

    let scanner = ImageScanner(baseURL: baseURL, fm: fm)
    scanner.scan()
    let URLs = scanner.scannedImageURLs

    println(URLs)
    let renamer = ImageRenamer(baseImageName: "japan", fm: fm)
    renamer.processURLs(URLs)
//
//    let converter = RAWConverter(supportedRAWFormats: ["PEF"], fm: fm)
//    converter.processURLs(URLs)

}

letsGo()