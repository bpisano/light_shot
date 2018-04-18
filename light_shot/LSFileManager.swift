//
//  LSFileManager.swift
//  light_shot
//
//  Created by Benjamin Pisano on 18/04/2018.
//  Copyright © 2018 Snopia. All rights reserved.
//

import Foundation

class LSFileManager {
    
    struct shared {
        static let desktopPath = "~/Desktop"
        static var defaultDirectory = "~/Desktop/img"
    }
    
    private func defaultImageFolder() -> Folder? {
        do {
            return try Folder(path: shared.defaultDirectory)
        } catch {
            return nil
        }
    }
    
    func createDefaultFolderIfNeeded() throws {
        guard defaultImageFolder() == nil else {
            return
        }
        
        do {
            try Folder(path: shared.desktopPath).createSubfolder(named: "img")
        } catch let error {
            throw error
        }
    }
    
    func addToDefaultFolder(image: LSImage) {
        guard let imageFolder = defaultImageFolder() else {
            return
        }
        
        do {
            let imageFile = try imageFolder.createFile(named: image.name)
            try imageFile.write(data: image.imageData)
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
