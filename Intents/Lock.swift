// Created by udevs

import AppIntents

struct LockAppIntent: AppIntent {
	static let title: LocalizedStringResource = "锁屏"

	static let description = IntentDescription(
		"锁定此设备屏幕。",
		categoryName: "脚本"
	)

	func perform() async throws -> some IntentResult {
		        if let connection = MCProfileConnection.shared() {
            connection.lockDevice()
        } else {
            throw NSError(
                domain: "TrollCuts",
                code: 99,
                userInfo: [NSLocalizedDescriptionKey: "Failed to access MCProfileConnection"]
            )
        }
        return .result()
    }
}