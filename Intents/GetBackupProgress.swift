// Created by udevs

import AppIntents

struct GetBackupProgressAppIntent: AppIntent {
	static let title: LocalizedStringResource = "获取备份进度"

	static let description = IntentDescription(
		"获取iCloud备份进度。",
		categoryName: "备份",
		searchKeywords: [
			"icloud"
		]
	)

	func perform() async throws -> some IntentResult & ReturnsValue<Double> {
		let handle = dlopen(FW_MobileBackup, RTLD_LAZY)
		var progress: Double = -1.0
		if handle != nil {
			let mbManager = MBManager()
			progress = Double(mbManager.backupState().progress)
			dlclose(handle)
		} else {
            throw NSError(domain: "TrollCuts", code: 99, userInfo: [NSLocalizedDescriptionKey: String(format: "Failed to load %@", FW_MobileBackup)] )
        }
		return .result(value: progress)
	}
}
