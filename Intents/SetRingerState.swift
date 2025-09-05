// Created by udevs

import AppIntents

struct SetRingerStateAppIntent: AppIntent {
	static let title: LocalizedStringResource = "设定静音模式"

	static let description = IntentDescription(
		"打开或关闭设备的静音模式。",
		categoryName: "常用",
		searchKeywords: [
			"sound",
            "ringtone",
			"mute"
		]
	)

	@Parameter(title: "State", default: .on)
	var state: SwitchStateAppEnum

	static var parameterSummary: some ParameterSummary {
		Summary("将静音模式设为\(\.$state)")
	}

	func perform() async throws -> some IntentResult & ReturnsValue<Int> {
    	let ret = setRingerState(state.rawValue == "on" ? 0 : 1)
        return .result(value: Int(ret))
	}
}
