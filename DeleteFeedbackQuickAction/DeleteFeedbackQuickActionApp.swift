//
//  DeleteFeedbackQuickActionApp.swift
//  DeleteFeedbackQuickAction
//
//  Created by Tanmay Sonawane on 01/03/25.
//

import SwiftUI

@main
struct DeleteFeedbackQuickActionApp: App {
	@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
	@Environment(\.scenePhase) var scenePhase
	
	var body: some Scene {
		WindowGroup {
			ContentView()
				.onChange(of: scenePhase, { oldValue, newValue in
					switch newValue {
					case .background:
						QuickActionsManager.shared.addQuickActions()
					default: break
					}
				})
		}
	}
}
