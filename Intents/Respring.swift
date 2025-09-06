//Created by udevs

import AppIntents

struct RespringAppIntent: AppIntent {
	static let title: LocalizedStringResource = "注销"

	static let description = IntentDescription(
		"注销你的设备。",
		categoryName: "脚本"
	)

	func perform() async throws -> some IntentResult {
        let background = DispatchQueue.global()
        background.async {
            respring()
        } 
        return .result()
	}
}
