//
//  SceneDelegate.swift
//  gitUser
//
//  Created by Andrey on 17.05.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        let vc = MainScreenFabric.assembledScreen()
        window?.rootViewController = UINavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()
    }
}
