import Foundation

struct StoreCategory: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let icon: String
}

struct StorePackage: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let subtitle: String
    let price: String
    let badge: String?
    let icon: String
    let category: String
    let features: [String]
    let isHot: Bool
}
