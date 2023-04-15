//
//  Product.swift
//  demo1
//
//  Created by 최우태 on 2023/04/15.
//

import Foundation

struct Product {
    let name : String?
    let cellImageName : String?
    let fullscreenImageName : String?
    
    init(name: String?, cellImageName: String?, fullscreenImageName: String?) {
        self.name = name
        self.cellImageName = cellImageName
        self.fullscreenImageName = fullscreenImageName
    }
}
