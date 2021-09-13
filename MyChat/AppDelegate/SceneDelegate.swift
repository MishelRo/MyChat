//
//  SceneDelegate.swift
//  MyChat
//
//  Created by User on 12.09.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let WS = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(frame: WS.coordinateSpace.bounds)
        window?.windowScene = WS
        window?.rootViewController = UINavigationController(rootViewController: AuthViewController())
        window?.makeKeyAndVisible()
        guard let _ = (scene as? UIWindowScene) else { return }
    }
}

