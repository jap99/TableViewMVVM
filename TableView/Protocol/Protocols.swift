import UIKit

protocol ChannelsVCProtocol: AnyObject {
    
}

protocol ChannelsVCCellProtocol: AnyObject {
    func setCellUIObject(_ id: String, _ name: String)
    func updateImage(_ image: UIImage?)
}

