// Copyright 2022: Javid A. Poornasir

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        DispatchQueue.main.async {
            self.window = UIWindow(windowScene: windowScene)
            let vc = ChannelsVC()
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
        }
    }
 
}

