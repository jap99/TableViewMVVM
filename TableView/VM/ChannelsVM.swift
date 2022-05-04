// Copyright 2022: Javid A. Poornasir

import Foundation

final class ChannelsVM {
    
    weak var view: ChannelsVCProtocol?
    var channels: [Channel] = []
    
    
    // MARK: - INIT
    
    init?(_ view: ChannelsVCProtocol, _ channels: ChannelsList? = nil) {
        self.view = view
        if self.channels.isEmpty {
            ChannelsList({ [weak self] channels in
                self?.channels = channels
            })
        }
    }
    
    
    // MARK: - ACTIONS
     
    func numberOfItemsInSection() -> Int {
        return channels.count
    }
      
    func cellViewModelAt(_ indexPath: IndexPath) -> ChannelCellVM? {
        let index = indexPath.row
        if (index < 0) || (index >= self.channels.count) {
            return nil
        }
        return ChannelCellVM(self.channels[index])
    }
    

     
    
}
