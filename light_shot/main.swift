//
//  main.swift
//  light_shot
//
//  Created by Benjamin Pisano on 18/04/2018.
//  Copyright © 2018 Snopia. All rights reserved.
//

import Foundation
import Cocoa

func getImageAdress(url urlString: String) -> String? {
    guard let url = URL(string: urlString) else {
        print("Error : \(urlString) not a valid URL")
        return nil
    }
    
    do {
        let html = try String(contentsOf: url, encoding: .ascii)
        let document = try SwiftSoup.parse(html)
        let tag = try document.select("img").attr("class", "no-click screenshot-image")
        let adress = try tag.attr("src")
        
        return adress
    } catch let error {
        print("Error: \(error)")
        return nil
    }
}

func getImage(url urlString: String) -> NSImage? {
    guard let url = URL(string: urlString) else {
        print("Error : \(urlString) not a valid URL")
        return nil
    }
    
    do {
        let data = try Data(contentsOf: url)
        let folder = try Folder(path: "/Users/bpisano/Desktop/")
        let file = try folder.createFile(named: "file.png")
        try file.write(data: data)
        return NSImage(data: data)
    } catch let error {
        print("Error: \(error)")
        return nil
    }
}

let adress = getImageAdress(url: "https://prnt.sc/11c2d4")
let image = getImage(url: adress!)





/*
let fileManager = FileManager.default

// Create 'subfolder' directory

do {
    try fileManager.createDirectory(atPath: "file:///Users/bpisano/Desktop", withIntermediateDirectories: true, attributes: nil)
}
catch let error as NSError {
    print("Ooops! Something went wrong: \(error)")
}
dump(image)*/
