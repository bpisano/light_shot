//
//  main.swift
//  light_shot
//
//  Created by Benjamin Pisano on 18/04/2018.
//  Copyright © 2018 Snopia. All rights reserved.
//

import Foundation

do {
    try LSFileManager().createDefaultFolderIfNeeded()
} catch let error {
    print(error)
    exit(0)
}

LSNameGenerator().generate(len: 6) { (name) in
    if var image = LSRequest().getImageData(url: "https://prnt.sc/\(name)") {
        print("Image found for name : \(name)")
        image.name = name + ".png"
        LSFileManager().addToDefaultFolder(image: image)
    }
}
