//
//  UIKitExtensions.swift
//  DeviceAndStatusBarOrientationNotificationSample
//
//  Created by toshi0383 on 11/10/15.
//  Copyright © 2015 toshi0383. All rights reserved.
//

import UIKit
extension UIInterfaceOrientation:CustomStringConvertible {
    public var description:String {
        switch self {
        case .Portrait:return "Portrait"
        case .PortraitUpsideDown:return "PortraitUpsideDown"
        case .LandscapeLeft:return "LandscapeLeft"
        case .LandscapeRight:return "LandscapeRight"
        case .Unknown:return "Unknown"
        }
    }
}
extension UIDeviceOrientation:CustomStringConvertible {
    public var description:String {
        switch self {
        case .FaceDown:return "FaceDown"
        case .FaceUp:return "FaceUp"
        case .Portrait:return "Portrait"
        case .PortraitUpsideDown:return "PortraitUpsideDown"
        case .LandscapeLeft:return "LandscapeLeft"
        case .LandscapeRight:return "LandscapeRight"
        case .Unknown:return "Unknown"
        }
    }
}

extension UILabel {
    func updateTextAndHighlight(text:String) {
        self.text = text
        let originalColor = layer.backgroundColor
        layer.backgroundColor = UIColor.whiteColor().CGColor
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.7)
        layer.backgroundColor = originalColor
        CATransaction.commit()
    }
}
