//
//  SceneDelegate.swift
//  AKProcessIndicatorExample
//
//  Created by AKIO ITAYA on 2020/05/17.
//  Copyright © 2020 AKIO. All rights reserved.
//

import AKProcessIndicator
import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private var timer: Timer?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        let contentView = ContentView()

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }

        UIApplication.shared.setupProcessIndicatorIfNeeded()
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            UIApplication.shared.isLoading.toggle()
        }
    }
}
