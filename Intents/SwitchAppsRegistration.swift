//Created by udevs

import AppIntents

struct SwitchAppsRegistrationAppIntent: AppIntent {
	static let title: LocalizedStringResource = "切换应用程序注册状态"

	static let description = IntentDescription(
		"切换所有TrollStore安装的应用程序注册状态。",
		categoryName: "TrollStore",
		searchKeywords: [
			"trollstore",
			"system",
			"user",
            "registration"
		]
	)

	@Parameter(title: "State", default: .system)
	var state: AppRegistrationStateAppEnum

	@Parameter(
		title: "忽略 TrollCuts",
		default: true
	)
	var ignoreSelf: Bool

	static var parameterSummary: some ParameterSummary {
		Summary("将应用程序注册状态设为\(\.$state)"){
			\.$ignoreSelf
		}
	}

	func perform() async throws -> some IntentResult {
		if  trollStorePath() != nil {
            switchAllAppsRegistration(state.rawValue.capitalized, ignoreSelf ? ["TrollCuts.app"]: nil)
		} else {
			throw NSError(domain: "TrollCuts", code: 99, userInfo: [NSLocalizedDescriptionKey: "TrollStore not installed."] )
		}
        return .result()
	}
}

enum AppRegistrationStateAppEnum: String, AppEnum {
	case system
	case user

	static let typeDisplayRepresentation: TypeDisplayRepresentation = "App Registration State"

	static let caseDisplayRepresentations: [Self: DisplayRepresentation] = [
		.system: "System",
		.user: "User"
	]
}
