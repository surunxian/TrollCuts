// Created by udevs

import AppIntents

struct GetRingerStateAppIntent: AppIntent {
	static let title: LocalizedStringResource = "获取静音模式状态"

	static let description = IntentDescription(
		"返回关于静音模式的信息。",
		categoryName: "设置",
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
