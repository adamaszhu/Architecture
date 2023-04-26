//
//  AppDelegate.swift
//  Architecture
//
//  Created by Adamas on 11/6/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    private let coordinator = AppCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        coordinator.start()
        return true
    }
}
