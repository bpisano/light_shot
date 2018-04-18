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

if let image = LSRequest().getImageData(url: "https://prnt.sc/11c2d4") {
    LSFileManager().addToDefaultFolder(image: image)
}
