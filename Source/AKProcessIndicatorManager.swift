//
//  AKProcessIndicatorManager.swift
//  AKProcessIndicator
//
//  Created by AKIO ITAYA on 2020/05/20.
//  Copyright © 2020 AKIO. All rights reserved.
//

import UIKit

final class AKProcessIndicatorManager {
    private enum Const {
        static let indicatorWidth: CGFloat = 44
        static let indicatorHeight: CGFloat = 4
        static let rightMargin: CGFloat = 30
        static let topMargin: CGFloat = 6
    }

    static let shared = AKProcessIndicatorManager()

    internal let indicator: AKProcessIndicator

    private init(app: UIApplication = .shared) {
        indicator = AKProcessIndicator(frame: CGRect(
            x: app.statusBarFrame.width - (Const.rightMargin + Const.indicatorWidth),
            y: Const.topMargin,
            width: Const.indicatorWidth,
            height: Const.indicatorHeight
        ))
        indicator.isUserInteractionEnabled = false
    }
}
