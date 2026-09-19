import SwiftUI

struct StoreCategory: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let iconSystemName: String
    let iconAssetName: String?
    let packageCount: Int
    let badgeText: String?
    let iconColors: [Color]

    init(
        name: String,
        iconSystemName: String,
        iconAssetName: String? = nil,
        packageCount: Int,
        badgeText: String? = nil,
        iconColors: [Color]
    ) {
        self.name = name
        self.iconSystemName = iconSystemName
        self.iconAssetName = iconAssetName
        self.packageCount = packageCount
        self.badgeText = badgeText
        self.iconColors = iconColors
    }
}