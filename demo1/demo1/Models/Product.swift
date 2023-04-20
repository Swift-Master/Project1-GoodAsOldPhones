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
