//Created by udevs

import AppIntents

struct StartLocationSimulationAppIntent: AppIntent {
	static let title: LocalizedStringResource = "启用虚拟定位"

	static let description = IntentDescription(
		"Simulate GPS location to specified coordinate.",
		categoryName: "Location",
		searchKeywords: [
			"gps",
            "locsim",
            "simulate"
		]
	)

	@Parameter(title: "纬度,经度")
	var coordinate: String

	@Parameter(title: "高度", default: 0.0)
	var alt: Double

	@Parameter(title: "水平精度", default: 0.0)
	var ha: Double

	@Parameter(title: "垂直精度", default: 0.0)
	var va: Double

	static var parameterSummary: some ParameterSummary {
		Summary("设置虚拟坐标为\(\.$coordinate)"){
            \.$alt
            \.$ha
            \.$va
        }
	}

	func perform() async throws -> some IntentResult {
		let handle = dlopen(FW_CoreLocation, RTLD_LAZY)
        if handle != nil {
			// Don't need to tell me how much I suck in swift, I knows
			let coor = parseCoorString(coordinate).compactMap({ $0 as? Double })
			if coor == nil {
                throw NSError(domain: "TrollCuts", code: 1, userInfo: [NSLocalizedDescriptionKey: "Unable to parse coordinate input" ])
			}
            let ret = startLocSim(coor[0], coor[1], alt, ha, va)
			dlclose(handle)
            if ret != 0 {
                throw NSError(domain: "TrollCuts", code: 1, userInfo: [NSLocalizedDescriptionKey: String(format: "Invalid coordinate: %d, %d", coor[0], coor[1])] )
            }
		} else {
            throw NSError(domain: "TrollCuts", code: 99, userInfo: [NSLocalizedDescriptionKey: String(format: "Failed to load %@", FW_CoreLocation)] )
        }
        return .result()
	}
}
