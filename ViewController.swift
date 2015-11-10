//
//  ViewController.swift
//  DeviceAndStatusBarOrientationNotificationSample
//
//  Created by toshi0383 on 11/10/15.
//  Copyright © 2015 toshi0383. All rights reserved.
//

import UIKit

let UnknownObject = "Unknown Object"

class ViewController: UIViewController {

    @IBOutlet weak var currentStatusBarLabel: UILabel!
    @IBOutlet weak var currentDeviceLabel: UILabel!
    @IBOutlet weak var notificationDeviceLabel: UILabel!
    @IBOutlet weak var notificationStatusBarLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        listen()
    }
    @IBAction func button(sender: AnyObject) {
        sync()
    }
    func sync() {
        let device = UIDevice.currentDevice().orientation.description
        if let s = currentDeviceLabel.text where device == s {
        } else {
            currentDeviceLabel.updateTextAndHighlight(device)
        }
        let st = UIApplication.sharedApplication().statusBarOrientation.description
        if let s = currentStatusBarLabel.text where st == s {
        } else {
            currentStatusBarLabel.updateTextAndHighlight(st)
        }
    }
    func listen() {
        let center = NSNotificationCenter.defaultCenter()
        center.addObserver(self, selector: "statusBar:", name: UIApplicationDidChangeStatusBarOrientationNotification, object: nil)
        center.addObserver(self, selector: "device:", name: UIDeviceOrientationDidChangeNotification, object: nil)
    }
    func device(not:NSNotification) {
        LOG()
        if let app = not.object as? UIDevice {
            let o = app.orientation
            notificationDeviceLabel.updateTextAndHighlight(o.description)
        } else {
            notificationDeviceLabel.updateTextAndHighlight(UnknownObject)
        }
        self.sync()
    }
    func statusBar(not:NSNotification) {
        LOG()
        if let app = not.object as? UIApplication {
            let o = app.statusBarOrientation
            notificationStatusBarLabel.updateTextAndHighlight(o.description)
        } else {
            notificationStatusBarLabel.updateTextAndHighlight(UnknownObject)
        }
        self.sync()
    }
}

