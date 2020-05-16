//
//  AKProcessIndicator.swift
//  AKProcessIndicator
//
//  Created by AKIO ITAYA on 2020/05/17.
//  Copyright © 2020 AKIO. All rights reserved.
//

import UIKit

public class AKProcessIndicator: UIView {
    private enum Const {
        static let animatingDuration: TimeInterval = 0.5
    }

    private let rightLayer = AnimationLayer(.right)
    private let leftLayer = AnimationLayer(.left)

    override public func layoutSubviews() {
        super.layoutSubviews()

        clipsToBounds = true
        layer.cornerRadius = bounds.size.height / 2

        rightLayer.frame = CGRect(x: .zero, y: .zero, width: bounds.size.width, height: bounds.size.height)
        rightLayer.updateLayer()
        rightLayer.updateColor(tintColor)
        layer.addSublayer(rightLayer)
        leftLayer.frame = CGRect(x: bounds.size.width, y: .zero, width: bounds.size.width, height: bounds.size.height)
        leftLayer.updateLayer()
        leftLayer.updateColor(tintColor)
        layer.addSublayer(leftLayer)
    }

    public func startAnimating() {
        guard !isAnimating else {
            stopAnimating { [weak self] in
                self?.startAnimating()
            }
            return
        }

        UIView.animate(withDuration: Const.animatingDuration) { [weak self] in
            self?.isHidden = false
        }

        rightLayer.addAnimation()
        leftLayer.addAnimation()

        setNeedsLayout()
        layoutIfNeeded()
    }

    public func stopAnimating(completion: (() -> Void)? = nil) {
        UIView.animate(
            withDuration: Const.animatingDuration,
            animations: { [weak self] in
                self?.isHidden = true
            },
            completion: { [weak self] _ in
                self?.rightLayer.removeAllAnimations()
                self?.leftLayer.removeAllAnimations()
                self?.setNeedsLayout()
                self?.layoutIfNeeded()
                completion?()
            }
        )
    }

    public var isAnimating: Bool {
        rightLayer.animationKeys()?.isEmpty ?? true
            || leftLayer.animationKeys()?.isEmpty ?? true
    }

    override public func tintColorDidChange() {
        super.tintColorDidChange()
        rightLayer.updateColor(tintColor)
        leftLayer.updateColor(tintColor)
    }
}
