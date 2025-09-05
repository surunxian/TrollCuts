// Created by udevs

import AppIntents

struct LockAppIntent: AppIntent {
	static let title: LocalizedStringResource = "锁屏"

	static let description = IntentDescription(
		"锁定设备。",
		categoryName: "设备"
	)

	func perform() async throws -> some IntentResult {
		let handle = dlopen(FW_ManagedConfiguration, RTLD_LAZY)
		if handle != nil {
            MCProfileConnection.shared().lockDevice()
			dlclose(handle)
		} else {
            throw NSError(domain: "TrollCuts", code: 99, userInfo: [NSLocalizedDescriptionKey: String(format: "Failed to load %@", FW_ManagedConfiguration)] )
        }
		return .result()
	}
}
