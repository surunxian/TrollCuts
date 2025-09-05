// Created by udevs

import AppIntents

struct UserspaceRebootAppIntent: AppIntent {
	static let title: LocalizedStringResource = "重启用户空间"

	static let description = IntentDescription(
		"Userspace reboot device.",
		categoryName: "Device"
	)

	func perform() async throws -> some IntentResult{
		userspaceReboot()
		return .result()
	}
}
