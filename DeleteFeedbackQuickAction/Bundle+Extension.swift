//
//  Bundle+Extension.swift
//  DeleteFeedbackQuickAction
//
//  Created by Tanmay Sonawane on 01/03/25.
//

import Foundation

extension Bundle {
	var releaseVersionNumber: String? {
		return infoDictionary?["CFBundleShortVersionString"] as? String
	}
	
	var buildVersionNumber: String? {
		return infoDictionary?["CFBundleVersion"] as? String
	}
	
	var bundleNumber: Int? {
		guard let bundleVersionNumber = self.buildVersionNumber else { return nil }
		return Int(bundleVersionNumber)
	}
}
