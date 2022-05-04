// Copyright 2022: Javid A. Poornasir

final class ChannelsList: Decodable {
    
    var channels: [Channel] = []
    
    private enum CodingKeys: String, CodingKey {
        case channels = "Channels"
    }
    
    
    // MARK: - INIT
    
    @discardableResult
    init(_ comp: @escaping ([Channel]) -> ()) {
        guard channels.isEmpty else { return }
        self.fetchChannels { (channels) in
            self.channels = channels
            comp(channels)
        }
    }
    
    
    // MARK: - ACTIONS
    
    private func fetchChannels(_ completion: @escaping ([Channel]) -> ()) {
        let url: String = "https://mobile-interview.s3.amazonaws.com/channels.json"
        WebService.fetch(url) { (channelsArr, err) in
            completion(channelsArr ?? [])
        }
    }
    
    
    
}

