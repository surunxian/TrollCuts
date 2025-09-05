//Created by udevs

import AppIntents

struct RespringAppIntent: AppIntent {
	static let title: LocalizedStringResource = "注销"

	static let description = IntentDescription(
		"Respring device.",
		categoryName: "设备"
	)

	func perform() async throws -> some IntentResult {
        let background = DispatchQueue.global()
        background.async {
            respring()
        } 
        return .result()
	}
}
