import SwiftUI

struct PackageRowView: View {
    let category: StoreCategory
    var onTap: () -> Void = {}

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 14) {
                // ===== Icon =====
                ZStack(alignment: .topLeading) {
                    // Base square with gradient
                    RoundedRectangle(cornerRadius: 13)
                        .fill(
                            LinearGradient(
                                colors: category.iconColors,
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 58, height: 58)

                    // Custom asset nếu có, không thì system icon
                    if let assetName = category.iconAssetName {
                        Image(assetName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 58, height: 58)
                            .clipShape(RoundedRectangle(cornerRadius: 13))
                    } else {
                        Image(systemName: category.iconSystemName)
                            .font(.system(size: 26, weight: .semibold))
                            .foregroundStyle(.white)
                            .frame(width: 58, height: 58)
                            .shadow(color: .black.opacity(0.5), radius: 3)
                    }

                    // "MAX" badge
                    if let badge = category.badgeText {
                        Text(badge)
                            .font(.system(size: 8, weight: .black))
                            .foregroundStyle(.black)
                            .padding(.horizontal, 5)
                            .padding(.vertical, 2)
                            .background(
                                LinearGradient(
                                    colors: [.yellow, .orange],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                            .rotationEffect(.degrees(-18))
                            .offset(x: -5, y: -5)
                            .shadow(color: .black.opacity(0.5), radius: 2)
                    }
                }
                .frame(width: 58, height: 58)
                .overlay(
                    RoundedRectangle(cornerRadius: 13)
                        .strokeBorder(
                            LinearGradient(
                                colors: [.white.opacity(0.5), .white.opacity(0.1)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1
                        )
                )
                .shadow(color: category.iconColors.first?.opacity(0.6) ?? .clear,
                        radius: 10)
                .shadow(color: .black.opacity(0.5), radius: 4, y: 2)

                // ===== Text =====
                VStack(alignment: .leading, spacing: 7) {
                    Text(category.name)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.white)

                    HStack(spacing: 5) {
                        Image(systemName: "cube.fill")
                            .font(.system(size: 10))
                            .foregroundStyle(AppTheme.secondaryText)
                        Text("\(category.packageCount) gói")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundStyle(AppTheme.secondaryText)
                    }
                }

                Spacer()

                // ===== Chevron =====
                GlowChevronButton(action: onTap)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 14)
            .glowCard(cornerRadius: 18, glowOpacity: 0.7)
        }
        .buttonStyle(.plain)
        .padding(.horizontal, 20)
    }
}