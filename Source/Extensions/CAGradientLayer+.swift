//
//  CAGradientLayer+.swift
//  AKProcessIndicator
//
//  Created by AKIO ITAYA on 2020/05/17.
//  Copyright © 2020 AKIO. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    private enum Const {
        static let half: CGFloat = 0.5
        static let max: CGFloat = 1
        static let min: CGFloat = 0
    }

    internal func applyGradients(_ direction: AnimationLayer.Direction) {
        startPoint = .init(x: Const.half, y: .zero)
        endPoint = .init(x: direction == .right ? Const.max : Const.min, y: .zero)
        anchorPoint = .zero
    }

    internal func applyRoundCorner() {
        cornerRadius = bounds.size.height / 2
    }
}
