// Copyright 2022: Javid A. Poornasir

import UIKit

final class ChannelCellVM {
    
    var channel: Channel?
    weak var cell: ChannelsVCCellProtocol?
    private var channelImageURL = "https://mobile-interview.s3.amazonaws.com/"
    
    
    // MARK: - INIT
    
    init?(_ channel: Channel?) {
        guard let c = channel else { return nil }
        self.channel = c
    }
    
    
    // MARK: - ACTIONS
    
    func setView(_ view: ChannelsVCCellProtocol) {    // invoked in ChannelsVC's cellForItemAt
        self.cell = view
    }
 
    func setupCell() {                                // invoked in ChannelCell's configureCell()
        guard let cell = cell, let ch = channel else { return }
        channelImageURL += ch.imageUrl
        self.downloadChannelImage()
        DispatchQueue.main.async {
            cell.setCellUIObject("\(ch.id)", ch.name)
        }
    }
    
    private func downloadChannelImage() {
        guard let url = URL(string: self.channelImageURL) else { return }
        DispatchQueue.global(qos: .userInteractive).async {
            let data = try! Data(contentsOf: url)
            guard let img = UIImage(data: data) else { return }
            if let c = self.cell {
                c.updateImage(img)
            }
        }
    }
    
    
    

}

