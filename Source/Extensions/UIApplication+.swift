//
//  UIApplication+.swift
//  AKProcessIndicator
//
//  Created by AKIO ITAYA on 2020/05/17.
//  Copyright © 2020 AKIO. All rights reserved.
//

import UIKit

public extension UIApplication {
    /**
     Call this after creating a UIWindow with AppDelegate or SceneDelegate and defining it in the system.
     If this is executed on a device other than
     iPhoneX / iPhoneXS / iPhoneXS Max / iPhoneXR / iPhone11 Pro / iPhone11 Pro Max / iPhone11,
     the processing in the method will be skipped.
    */
    func setupProcessIndicatorIfNeeded(substitute: (() -> Void) = {}) {
        guard let window = targetWindow, isSafeAreaPhoneDevice else {
            return substitute()
        }
        window.addSubview(AKProcessIndicatorManager.shared.indicator)
    }

    /**
     it is possible to switch the display / non-display of Process Indicator by switching the flag.
     If the setup is not completed or is not done properly, the SET method will not work.
    */
    var isLoding: Bool {
        set {
            processIndicator.isAnimating = newValue
            processIndicator.tintColor = statusBarReverseColor
        }
        get {
            processIndicator.isAnimating
        }
    }
}

private extension UIApplication {
    private var targetWindow: UIWindow? {
        windows.filter { $0.isKeyWindow }.first
    }

    /**
     This will return the Process Indicator that was `addSubview` during setup.
    */
    private var processIndicator: AKProcessIndicator {
        AKProcessIndicatorManager.shared.indicator
    }

    /**
     It expects to return TRUE for the following devices:
     iPhoneX / iPhoneXS / iPhoneXS Max / iPhoneXR / iPhone11 Pro / iPhone11 Pro Max / iPhone11
    */
    private var isSafeAreaPhoneDevice: Bool {
        targetWindow?.safeAreaInsets.bottom ?? 0 > 0.0
            || UIDevice.current.userInterfaceIdiom == .phone
    }

    private var statusBarReverseColor: UIColor {
        guard let window = targetWindow else {
            return .gray
        }
        if #available(iOS 13.0, *) {
            return window.windowScene?.statusBarManager?.statusBarStyle == .lightContent ? .white : .black
        } else {
            return statusBarStyle == .default ? UIColor.black : UIColor.white
        }
    }
}
