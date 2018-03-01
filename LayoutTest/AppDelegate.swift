//
//  AppDelegate.swift
//  LayoutTest
//
//  Created by Herman Chan on 2018-02-28.
//  Copyright © 2018 Herman Chan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow()
    let vc = ApplicationViewController()
    let nav = UINavigationController(rootViewController: vc)
    window?.rootViewController = nav
    window?.makeKeyAndVisible()
    return true
  }
}

