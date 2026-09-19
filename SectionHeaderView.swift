import SwiftUI

struct SectionHeaderView: View {
    let title: String
    let badgeText: String?

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "cube.fill")
                .font(.system(size: 17, weight: .bold))
                .foregroundStyle(.white)
                .shadow(color: .white.opacity(0.5), radius: 3)

            Text(title)
                .font(.system(size: 17, weight: .black))
                .foregroundStyle(.white)
                .shadow(color: .white.opacity(0.4), radius: 4)

            Spacer()

            if let badgeText {
                HStack(spacing: 5) {
                    Image(systemName: "flame.fill")
                        .font(.system(size: 10))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.orange, .red],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    Text(badgeText)
                        .font(.system(size: 11, weight: .bold))
                        .foregroundStyle(.white)
                }
                .padding(.horizontal, 11)
                .padding(.vertical, 6)
                .background(
                    Capsule()
                        .fill(Color.black.opacity(0.7))
                        .overlay(
                            Capsule().strokeBorder(
                                LinearGradient(
                                    colors: [.white.opacity(0.5), .white.opacity(0.15)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1
                            )
                        )
                )
            }
        }
        .padding(.horizontal, 20)
    }
}