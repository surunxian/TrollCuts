// Created by udevs

import AppIntents

struct GetRingerStateAppIntent: AppIntent {
	static let title: LocalizedStringResource = "获取静音模式状态"

	static let description = IntentDescription(
		"Get ringer switch state.",
		categoryName: "常用",
		searchKeywords: [
			"sound",
            "ringtone",
			"mute"
		]
	)

	func perform() async throws -> some IntentResult & ReturnsValue<Int>  {
        let state = getRingerState()
        return .result(value: Int(state))
	}
}
