// Created by udevs

import AppIntents

struct SetAutoLockAppIntent: AppIntent {
	static let title: LocalizedStringResource = "设定自动锁定"

	static let description = IntentDescription(
		"更改设备的屏幕自动锁定时间。“自动锁定”也可在“设置”的“显示与亮度”中更改。",
		categoryName: "设置",
		searchKeywords: [
			"screen",
            "display",
            "autolock"
		]
	)

    @Parameter(title: "Duration", default: .halfsec)
	var duration: AutoLockDurationAppEnum

	static var parameterSummary: some ParameterSummary {
		Summary("将自动锁定时间设为\(\.$duration)")
	}

	func perform() async throws -> some IntentResult {
		let handle = dlopen(FW_ManagedConfiguration, RTLD_LAZY)
        var value: Int32 = 0
        if handle != nil {
            switch duration {
                case .halfsec:
                    value = 30
                case .onemin:
                    value = 60
                case .twomin:
                    value = 120
                case .threemin:
                    value = 180
                case .fourmin:
                    value = 240
                case .fivemin:
                    value = 300
                case .never:
                    value = Int32.max
            }
            MCProfileConnection.shared().setValue(NSNumber(value: value), forSetting: "maxInactivity")
			dlclose(handle)
		} else {
            throw NSError(domain: "TrollCuts", code: 99, userInfo: [NSLocalizedDescriptionKey: String(format: "Failed to load %@", FW_ManagedConfiguration)] )
        }
        return .result()
	}
}

enum AutoLockDurationAppEnum: String, AppEnum {
	case halfsec
	case onemin
    case twomin
    case threemin
    case fourmin
    case fivemin
    case never

	static let typeDisplayRepresentation: TypeDisplayRepresentation = "Auto-Lock Duration"

	static let caseDisplayRepresentations: [Self: DisplayRepresentation] = [
		.halfsec: "30秒钟",
		.onemin: "1分钟",
        .twomin: "2分钟",
		.threemin: "3分钟",
		.fourmin: "4分钟",
		.fivemin: "5分钟",
		.never: "永不"

	]
}
