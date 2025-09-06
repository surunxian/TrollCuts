// Created by udevs

import AppIntents

struct RebootAppIntent: AppIntent {
	static let title: LocalizedStringResource = "重启"

	static let description = IntentDescription(
		"重新启动你的设备。",
		categoryName: "设备"
	)

	func perform() async throws -> some IntentResult {
		let handle = dlopen(FW_FrontBoardServices, RTLD_LAZY)
		if handle != nil {
			FBSSystemService.shared().reboot()
			dlclose(handle)
		} else {
            throw NSError(domain: "TrollCuts", code: 99, userInfo: [NSLocalizedDescriptionKey: String(format: "Failed to load %@", FW_FrontBoardServices)] )
        }
		return .result()
	}
}
