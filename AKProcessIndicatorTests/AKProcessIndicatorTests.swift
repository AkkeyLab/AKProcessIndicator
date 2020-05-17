//
//  AKProcessIndicatorTests.swift
//  AKProcessIndicatorTests
//
//  Created by AKIO ITAYA on 2020/05/17.
//  Copyright © 2020 AKIO. All rights reserved.
//

import XCTest
@testable import AKProcessIndicator

final class AKProcessIndicatorTests: XCTestCase {

    func testGradientsRight() {
        let layer = CAGradientLayer()
        layer.applyGradients(.right)
        XCTAssertEqual(layer.startPoint, CGPoint(x: 0.5, y: 0))
        XCTAssertEqual(layer.endPoint, CGPoint(x: 1, y: 0))
        XCTAssertEqual(layer.anchorPoint, CGPoint(x: 0, y: 0))
    }

    func testGradientsLeft() {
        let layer = CAGradientLayer()
        layer.applyGradients(.left)
        XCTAssertEqual(layer.startPoint, CGPoint(x: 0.5, y: 0))
        XCTAssertEqual(layer.endPoint, CGPoint(x: 0, y: 0))
        XCTAssertEqual(layer.anchorPoint, CGPoint(x: 0, y: 0))
    }

    func testGradientsRoundCornerInt() {
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: 100, height: 10)
        layer.applyRoundCorner()
        XCTAssertEqual(layer.cornerRadius, 5)
    }

    func testGradientsRoundCornerDouble() {
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: 100, height: 10.5)
        layer.applyRoundCorner()
        XCTAssertEqual(layer.cornerRadius, 5.25)
    }

    func testAnimationBlackColors() {
        let layer = AnimationLayer(.right)
        let colors = [
            UIColor.black.withAlphaComponent(.zero).cgColor,
            UIColor.black.withAlphaComponent(0.7).cgColor
        ]
        layer.updateColor(.black)

        XCTAssertEqual(layer.colors as! [CGColor], colors)
    }

    func testAnimationWhiteColors() {
        let layer = AnimationLayer(.right)
        let colors = [
            UIColor.white.withAlphaComponent(.zero).cgColor,
            UIColor.white.withAlphaComponent(0.7).cgColor
        ]
        layer.updateColor(.white)

        XCTAssertEqual(layer.colors as! [CGColor], colors)
    }

    func testAddAnimationRight() {
        let layer = AnimationLayer(.right)
        layer.frame = CGRect(x: 0, y: 0, width: 100, height: 10)
        XCTAssertNil(layer.animationKeys())
        layer.addAnimation()
        XCTAssertEqual(layer.animation.fromValue as! CGFloat, -100)
        XCTAssertEqual(layer.animation.toValue as! CGFloat, 100)
        XCTAssertEqual(layer.animation.duration, 1.5)
        XCTAssertEqual(layer.animation.timingFunction, CAMediaTimingFunction(name: .easeInEaseOut))
        XCTAssertEqual(layer.animation.timeOffset, 0)
        XCTAssertEqual(layer.animation.repeatCount, Float.infinity)
        XCTAssertEqual(layer.animation.isRemovedOnCompletion, false)
        XCTAssertNotNil(layer.animationKeys())
        XCTAssert(layer.animationKeys()!.contains("animation-layer"))
    }

    func testAddAnimationLeft() {
        let layer = AnimationLayer(.left)
        layer.frame = CGRect(x: 0, y: 0, width: 100, height: 10)
        XCTAssertNil(layer.animationKeys())
        layer.addAnimation()
        XCTAssertEqual(layer.animation.fromValue as! CGFloat, 100)
        XCTAssertEqual(layer.animation.toValue as! CGFloat, -100)
        XCTAssertEqual(layer.animation.duration, 1.5)
        XCTAssertEqual(layer.animation.timingFunction, CAMediaTimingFunction(name: .easeInEaseOut))
        XCTAssertEqual(layer.animation.timeOffset, 0.75)
        XCTAssertEqual(layer.animation.repeatCount, Float.infinity)
        XCTAssertEqual(layer.animation.isRemovedOnCompletion, false)
        XCTAssertNotNil(layer.animationKeys())
        XCTAssert(layer.animationKeys()!.contains("animation-layer"))
    }

    func testAddAnimationStopRight() {
        let layer = AnimationLayer(.right)
        layer.frame = CGRect(x: 0, y: 0, width: 100, height: 10)
        XCTAssertNil(layer.animationKeys())
        layer.addAnimation()
        XCTAssertNotNil(layer.animationKeys())
        layer.removeAllAnimations()
        XCTAssertNil(layer.animationKeys())
    }

    func testAddAnimationStopLeft() {
        let layer = AnimationLayer(.left)
        layer.frame = CGRect(x: 0, y: 0, width: 100, height: 10)
        XCTAssertNil(layer.animationKeys())
        layer.addAnimation()
        XCTAssertNotNil(layer.animationKeys())
        layer.removeAllAnimations()
        XCTAssertNil(layer.animationKeys())
    }
}
