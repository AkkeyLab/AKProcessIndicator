//
//  UIApplication+.swift
//  AKProcessIndicator
//
//  Created by AKIO ITAYA on 2020/05/17.
//  Copyright © 2020 AKIO. All rights reserved.
//

import UIKit

public extension UIApplication {
    func setupProcessIndicatorIfNeeded(substitute: (() -> Void) = {}) {
        guard let window = targetWindow, isSafeAreaPhoneDevice else {
            return substitute()
        }
        let indicator = AKProcessIndicator(frame: CGRect(
            x: window.frame.width - (Const.rightMargin + Const.indicatorWidth),
            y: Const.topMargin,
            width: Const.indicatorWidth,
            height: Const.indicatorHeight
        ))
        indicator.isUserInteractionEnabled = false
        window.addSubview(indicator)
    }

    var isLoding: Bool {
        set {
            processIndicator?.isAnimating = newValue
            processIndicator?.tintColor = statusBarReverseColor
        }
        get {
            processIndicator?.isAnimating ?? false
        }
    }
}

private extension UIApplication {
    private enum Const {
        static let indicatorWidth: CGFloat = 44
        static let indicatorHeight: CGFloat = 4
        static let rightMargin: CGFloat = 30
        static let topMargin: CGFloat = 6
    }

    private var targetWindow: UIWindow? {
        windows.filter { $0.isKeyWindow }.first
    }

    private var processIndicator: AKProcessIndicator? {
        targetWindow?.subviews.compactMap { $0 as? AKProcessIndicator }.first
    }

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
