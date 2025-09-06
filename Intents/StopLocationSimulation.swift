//Created by udevs

import AppIntents

struct StopLocationSimulationAppIntent: AppIntent {
	static let title: LocalizedStringResource = "停用模拟定位位置"

	static let description = IntentDescription(
		"停止模拟GPS位置。",
		categoryName: "模拟",
		searchKeywords: [
			"gps",
            "locsim",
            "simulate"
		]
	)

	// @Parameter(title: "Force", default: false)
	// var force: Bool

	func perform() async throws -> some IntentResult {
		let handle = dlopen(FW_CoreLocation, RTLD_LAZY)
        if handle != nil {
            stopLocSim(false)
			dlclose(handle)
		} else {
            throw NSError(domain: "TrollCuts", code: 99, userInfo: [NSLocalizedDescriptionKey: String(format: "Failed to load %@", FW_CoreLocation)] )
        }
        return .result()
	}
}
