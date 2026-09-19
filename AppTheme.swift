import SwiftUI

enum AppTheme {
    // Background
    static let background = Color(red: 0.035, green: 0.035, blue: 0.05)
    static let backgroundDeep = Color(red: 0.015, green: 0.015, blue: 0.025)

    // Card
    static let cardBackground = Color(red: 0.10, green: 0.10, blue: 0.13)
    static let cardBackgroundDark = Color(red: 0.05, green: 0.05, blue: 0.07)

    // Accent
    static let accent = Color.white
    static let accentGlow = Color(red: 0.80, green: 0.83, blue: 0.90)

    // Border glow
    static let borderGlow = Color(red: 0.60, green: 0.65, blue: 0.80)

    // Text
    static let primaryText = Color.white
    static let secondaryText = Color(red: 0.70, green: 0.73, blue: 0.80)
    static let tertiaryText = Color(red: 0.50, green: 0.53, blue: 0.60)

    // Gradients
    static let borderGradient = LinearGradient(
        colors: [
            Color.white.opacity(0.70),
            Color.white.opacity(0.15),
            Color.white.opacity(0.45)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let cardGradient = LinearGradient(
        colors: [
            Color(red: 0.13, green: 0.13, blue: 0.16),
            Color(red: 0.05, green: 0.05, blue: 0.08)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let cardGradientFlipped = LinearGradient(
        colors: [
            Color(red: 0.05, green: 0.05, blue: 0.08),
            Color(red: 0.13, green: 0.13, blue: 0.16)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    // Font helper — dùng custom font nếu có, fallback về system
    static func display(_ size: CGFloat, weight: Font.Weight = .black) -> Font {
        if UIFont(name: "KaushanScript-Regular", size: size) != nil {
            return .custom("KaushanScript-Regular", size: size)
        }
        if UIFont(name: "BrushStrike", size: size) != nil {
            return .custom("BrushStrike", size: size)
        }
        return .system(size: size, weight: weight)
    }
}