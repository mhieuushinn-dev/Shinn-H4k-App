import SwiftUI

struct HeroBannerView: View {
    // Nếu bạn có ảnh → đổi thành true và thêm asset "hero_background"
    var useCustomImage: Bool = false

    var body: some View {
        ZStack {
            // ===== Background =====
            if useCustomImage {
                Image("hero_background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                // Placeholder khi chưa có ảnh
                LinearGradient(
                    colors: [
                        Color(red: 0.15, green: 0.16, blue: 0.20),
                        Color(red: 0.03, green: 0.03, blue: 0.06)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                Image(systemName: "eye.fill")
                    .font(.system(size: 90))
                    .foregroundStyle(
                        RadialGradient(
                            colors: [
                                Color.green.opacity(0.9),
                                Color.green.opacity(0.3),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 5,
                            endRadius: 70
                        )
                    )
                    .shadow(color: .green.opacity(0.6), radius: 25)
            }

            // Gradient overlay để text nổi
            LinearGradient(
                colors: [
                    Color.black.opacity(0.0),
                    Color.black.opacity(0.4),
                    Color.black.opacity(0.95)
                ],
                startPoint: .top,
                endPoint: .bottom
            )

            // ===== Content =====
            VStack(spacing: 6) {
                Spacer()

                Text("APP")
                    .font(AppTheme.display(24, weight: .black))
                    .italic()
                    .foregroundStyle(.white)
                    .shadow(color: .white.opacity(0.9), radius: 8)
                    .shadow(color: .white.opacity(0.5), radius: 2)

                Text("SHINN H4K")
                    .font(AppTheme.display(42, weight: .black))
                    .italic()
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.white, Color.white.opacity(0.9)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .shadow(color: .white.opacity(1.0), radius: 14)
                    .shadow(color: .white.opacity(0.6), radius: 4)
                    .shadow(color: .white.opacity(0.3), radius: 1)

                Spacer().frame(height: 6)

                // Free badge
                HStack(spacing: 6) {
                    Image(systemName: "cube.fill")
                        .font(.system(size: 11, weight: .bold))
                    Text("LÀ APP VÀ REPO HOÀN TOÀN ")
                        .font(.system(size: 11, weight: .semibold))
                    + Text("FREE")
                        .font(.system(size: 11, weight: .black))
                        .italic()
                }
                .foregroundStyle(.white)
                .padding(.horizontal, 14)
                .padding(.vertical, 7)
                .background(
                    Capsule()
                        .fill(Color.black.opacity(0.75))
                        .overlay(
                            Capsule().strokeBorder(
                                LinearGradient(
                                    colors: [.white.opacity(0.7), .white.opacity(0.2)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ),
                                lineWidth: 1
                            )
                        )
                )

                // Warning
                HStack(spacing: 10) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(.white)
                        .shadow(color: .white.opacity(0.5), radius: 3)

                    VStack(alignment: .leading, spacing: 1) {
                        Text("NẾU BẠN MUA CHÚNG")
                            .font(.system(size: 9, weight: .medium))
                            .foregroundStyle(AppTheme.secondaryText)
                        Text("BẠN ĐÃ BỊ LỪA!")
                            .font(AppTheme.display(15, weight: .black))
                            .italic()
                            .foregroundStyle(.white)
                            .shadow(color: .white.opacity(0.6), radius: 3)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 9)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.black.opacity(0.85))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .strokeBorder(
                                    LinearGradient(
                                        colors: [.white.opacity(0.8), .white.opacity(0.3)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ),
                                    lineWidth: 1.2
                                )
                        )
                )
                .padding(.bottom, 14)
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 260)
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .strokeBorder(AppTheme.borderGradient, lineWidth: 1.5)
        )
        .shadow(color: AppTheme.borderGlow.opacity(0.55), radius: 18)
        .shadow(color: .white.opacity(0.25), radius: 5)
        .padding(.horizontal, 20)
    }
}