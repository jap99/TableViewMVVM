// By: Javid A. Poornasir

import UIKit

enum ApiError {
    
    case urlError
    case serviceError(Error)
}




final class WebService {
    
    private init(){}
    
    static func fetch(_ urlString: String,
                      _ completion: @escaping ([Channel]?, ApiError?) -> ()) {
        guard let url = URL(string: urlString) else {
            completion(nil, .urlError)
            return
        }
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let e = err {
                completion(nil, .serviceError(e))
            } else if let d = data {
                let decodedList = try! JSONDecoder().decode(ChannelsList.self, from: d)
                completion(decodedList.channels, nil)
            }
        }.resume()
    }
    
    
    
}
 

