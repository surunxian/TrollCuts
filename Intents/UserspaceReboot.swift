// Created by udevs

import AppIntents

struct UserspaceRebootAppIntent: AppIntent {
	static let title: LocalizedStringResource = "重启用户空间"

	static let description = IntentDescription(
		"重新启动越狱时创建的用户空间。",
		categoryName: "脚本"
	)

	func perform() async throws -> some IntentResult{
		userspaceReboot()
		return .result()
	}
}
