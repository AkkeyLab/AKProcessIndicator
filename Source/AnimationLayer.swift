//
//  AnimationLayer.swift
//  AKProcessIndicator
//
//  Created by AKIO ITAYA on 2020/05/17.
//  Copyright © 2020 AKIO. All rights reserved.
//

import UIKit

final class AnimationLayer: CAGradientLayer {
    internal enum Direction {
        case right
        case left
    }

    private enum Const {
        static let coloredAlpha: CGFloat = 0.7
        static let animatingDuration: CFTimeInterval = 1.5
    }

    internal let animation = CABasicAnimation(keyPath: "position.x")
    private var direction: Direction?

    convenience init(_ direction: Direction) {
        self.init()
        self.direction = direction
        self.masksToBounds = true
    }

    internal func addAnimation() {
        animation.fromValue = direction == .right ? -bounds.size.width : bounds.size.width
        animation.toValue = direction == .right ? bounds.size.width : -bounds.size.width
        animation.duration = Const.animatingDuration
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.timeOffset = direction == .right ? .zero : Const.animatingDuration * 0.5
        animation.repeatCount = .infinity
        animation.isRemovedOnCompletion = false
        add(animation, forKey: "animation-layer")
    }

    internal func updateLayer() {
        guard let direction = direction else { return }
        applyGradients(direction)
        applyRoundCorner()
    }

    internal func updateColor(_ color: UIColor) {
        colors = [
            color.withAlphaComponent(.zero).cgColor,
            color.withAlphaComponent(Const.coloredAlpha).cgColor
        ]
    }
}
