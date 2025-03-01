//
//  AppDelegate.swift
//  DeleteFeedbackQuickAction
//
//  Created by Tanmay Sonawane on 01/03/25.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		if let shortcutItem = options.shortcutItem {
			QuickActionsManager.shared.handleItem(shortcutItem)
		}
		
		let sceneConfiguration = UISceneConfiguration(name: "Custom Configuration", sessionRole: connectingSceneSession.role)
		sceneConfiguration.delegateClass = CustomSceneDelegate.self
		
		return sceneConfiguration
	}
}

class CustomSceneDelegate: UIResponder, UIWindowSceneDelegate {
	func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
		QuickActionsManager.shared.handleItem(shortcutItem)
	}
}
