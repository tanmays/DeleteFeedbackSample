//
//  QuickActionManager.swift
//  FinanceApp
//
//  Created by Tanmay Sonawane on 04/02/25.
//

import SwiftUI

class QuickActionsManager: ObservableObject {
	static let shared = QuickActionsManager()
	@Published var quickAction: QuickAction? = nil
	
	private init() {}
	
	func handleItem(_ item: UIApplicationShortcutItem) {
		guard let actionItem = QuickAction.allCases.first(where: {$0.id == item.type}) else { return }
		switch actionItem {
		case .deleteFeedback:
			// Open Email Action
			let supportEmail = "test@example.com" // Add your support email here
			let subject = "Delete Feedback v\(Bundle.main.releaseVersionNumber ?? "") b\(Bundle.main.bundleNumber ?? 0)"
			let encodedSubject = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
			if let url = URL(string: "mailto:\(supportEmail)?subject=\(encodedSubject)") {
				UIApplication.shared.open(url)
			}
		}
	}
	
	func addQuickActions() {
		UIApplication.shared.shortcutItems = [QuickAction.deleteFeedback.item]
	}
}

enum QuickAction: Hashable, CaseIterable {
	case deleteFeedback
	
	var id: String {
		switch self {
		case .deleteFeedback:
			return "money.finma.deletefeedback"
		}
	}
	
	var item: UIApplicationShortcutItem {
		switch self {
		case .deleteFeedback:
			return UIApplicationShortcutItem(
				type: id,
				localizedTitle: "Deleting? Tell us why.",
				localizedSubtitle: "Send feedback before you delete.",
				icon: UIApplicationShortcutIcon(type: .compose),
				userInfo: nil
			)
		}
	}
}
