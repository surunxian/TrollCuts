// Created by udevs

import AppIntents

struct SetAutoBrightnessAppIntent: AppIntent {
	static let title: LocalizedStringResource = "设定自动亮度调节"

	static let description = IntentDescription(
		"打开或关闭设备的自动亮度调节。“自动亮度调节”也可在“设置”的“辅助功能”中启用。",
		categoryName: "常用",
		searchKeywords: [
			"screen",
            "display",
			"autobrightness"
		]
	)

	@Parameter(title: "State", default: .on)
	var state: SwitchStateAppEnum

	static var parameterSummary: some ParameterSummary {
		Summary("将自动亮度调节设为\(\.$state)")
	}

	func perform() async throws -> some IntentResult {
        let handle = dlopen(FW_GraphicsServices, RTLD_LAZY)
        if handle != nil {
            CFPreferencesSetAppValue("BKEnableALS" as CFString, state.rawValue == "on" ? kCFBooleanTrue : kCFBooleanFalse , "com.apple.backboardd" as CFString);
            CFPreferencesAppSynchronize("com.apple.backboardd" as CFString);
            GSSendAppPreferencesChanged("com.apple.backboardd" as CFString, "BKEnableALS" as CFString);
        } else {
            throw NSError(domain: "TrollCuts", code: 99, userInfo: [NSLocalizedDescriptionKey: String(format: "Failed to load %@", FW_GraphicsServices)] )
        }
        return .result()
	}
}
