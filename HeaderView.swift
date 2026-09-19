import SwiftUI

struct HeaderView: View {
    var onTelegramTap: () -> Void = {}

    var body: some View {
        VStack(spacing: 6) {
            // Row 1: Crown + Title + Send
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: "crown.fill")
                    .font(.system(size: 20, weight: .black))
                    .foregroundStyle(.white)
                    .shadow(color: .white.opacity(0.9), radius: 8)
                    .shadow(color: .white.opacity(0.5), radius: 2)

                Text("SHINN H4K")
                    .font(AppTheme.display(26, weight: .black))
                    .italic()
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.white, Color.white.opacity(0.85)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .shadow(color: .white.opacity(0.9), radius: 10)
                    .shadow(color: .white.opacity(0.5), radius: 3)

                Spacer()

                Button(action: onTelegramTap) {
                    ZStack {
                        Circle()
                            .fill(Color.white.opacity(0.08))
                            .frame(width: 46, height: 46)
                            .blur(radius: 6)

                        Circle()
                            .fill(AppTheme.cardBackground)
                            .frame(width: 40, height: 40)
                            .overlay(
                                Circle().strokeBorder(
                                    LinearGradient(
                                        colors: [.white.opacity(0.8), .white.opacity(0.2)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ),
                                    lineWidth: 1.2
                                )
                            )

                        Image(systemName: "paperplane.fill")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundStyle(.white)
                            .rotationEffect(.degrees(-15))
                            .shadow(color: .white.opacity(0.8), radius: 3)
                    }
                    .frame(width: 46, height: 46)
                }
            }

            // Subtitle với tracking rộng
            Text("G A M I N G   C E N T E R")
                .font(.system(size: 9, weight: .semibold))
                .tracking(4)
                .foregroundStyle(AppTheme.secondaryText)
                .padding(.top, 2)

            // Telegram pill
            Button(action: onTelegramTap) {
                HStack(spacing: 6) {
                    Image(systemName: "paperplane.fill")
                        .font(.system(size: 10, weight: .semibold))
                    Text("Telegram: @ShinnThieuu")
                        .font(.system(size: 11, weight: .semibold))
                }
                .foregroundStyle(.white)
                .padding(.horizontal, 14)
                .padding(.vertical, 7)
                .background(
                    Capsule()
                        .fill(Color.black.opacity(0.55))
                        .overlay(
                            Capsule().strokeBorder(
                                LinearGradient(
                                    colors: [.white.opacity(0.6), .white.opacity(0.15)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ),
                                lineWidth: 1
                            )
                        )
                        .shadow(color: .white.opacity(0.2), radius: 4)
                )
            }
            .padding(.top, 4)
        }
        .padding(.horizontal, 20)
        .padding(.top, 4)
    }
}