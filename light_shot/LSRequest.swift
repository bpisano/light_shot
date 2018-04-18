//
//  LSRequest.swift
//  light_shot
//
//  Created by Benjamin Pisano on 18/04/2018.
//  Copyright © 2018 Snopia. All rights reserved.
//

import Foundation

class LSRequest {
    
    func getImageData(url urlString: String) -> LSImage? {
        guard let imageURL = getImageAdress(url: urlString) else {
            return nil
        }
        
        do {
            let data = try Data(contentsOf: imageURL)
            let name = imageName(url: imageURL.absoluteString)
            
            return LSImage(imageData: data, name: name)
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private func getImageAdress(url urlString: String) -> URL? {
        guard let url = URL(string: urlString) else {
            print("\(urlString) not a valid URL")
            return nil
        }
        
        do {
            let html = try String(contentsOf: url, encoding: .ascii)
            let document = try SwiftSoup.parse(html)
            let tag = try document.select("img").attr("class", "no-click screenshot-image")
            let adress = try tag.attr("src")
            
            if adress != "https://st.prntscr.com/2018/04/18/0320/img/0_173a7b_211be8ff.png" {
                return URL(string: adress)
            } else {
                return nil
            }
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private func imageName(url: String) -> String {
        guard let name = url.components(separatedBy: "/").last else {
            return "img.png"
        }
        
        return name
    }
}
