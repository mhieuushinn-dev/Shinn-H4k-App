import SwiftUI

// MARK: - Glow Card Modifier (mạnh hơn bản trước)

struct GlowCardModifier: ViewModifier {
    var cornerRadius: CGFloat = 18
    var borderWidth: CGFloat = 1.2
    var glowOpacity: Double = 0.9
    var innerGlow: Bool = true

    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(AppTheme.cardGradient)
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(AppTheme.borderGradient, lineWidth: borderWidth)
            )
            .overlay(
                // Inner highlight ở cạnh trên
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(
                        LinearGradient(
                            colors: [
                                Color.white.opacity(innerGlow ? 0.35 : 0),
                                Color.clear,
                                Color.clear
                            ],
                            startPoint: .top,
                            endPoint: .center
                        ),
                        lineWidth: 1
                    )
            )
            // Outer glow — tăng cường
            .shadow(color: AppTheme.borderGlow.opacity(glowOpacity * 0.7),
                    radius: 16, x: 0, y: 0)
            .shadow(color: Color.white.opacity(glowOpacity * 0.35),
                    radius: 6, x: 0, y: 0)
            .shadow(color: Color.black.opacity(0.6),
                    radius: 8, x: 0, y: 4)
    }
}

extension View {
    func glowCard(
        cornerRadius: CGFloat = 18,
        borderWidth: CGFloat = 1.2,
        glowOpacity: Double = 0.9
    ) -> some View {
        modifier(GlowCardModifier(
            cornerRadius: cornerRadius,
            borderWidth: borderWidth,
            glowOpacity: glowOpacity
        ))
    }
}

// MARK: - Light Streaks Background

struct LightStreaksBackground: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                AppTheme.background
                    .ignoresSafeArea()

                // Streak 1 — chéo trên
                Path { path in
                    path.move(to: CGPoint(x: -100, y: geo.size.height * 0.35))
                    path.addLine(to: CGPoint(
                        x: geo.size.width + 100,
                        y: geo.size.height * 0.08
                    ))
                }
                .stroke(
                    LinearGradient(
                        colors: [
                            Color.white.opacity(0.0),
                            Color.white.opacity(0.10),
                            Color.white.opacity(0.0)
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    ),
                    lineWidth: 60
                )
                .blur(radius: 25)

                // Streak 2 — chéo dưới
                Path { path in
                    path.move(to: CGPoint(x: -100, y: geo.size.height * 0.85))
                    path.addLine(to: CGPoint(
                        x: geo.size.width + 100,
                        y: geo.size.height * 0.55
                    ))
                }
                .stroke(
                    LinearGradient(
                        colors: [
                            Color.white.opacity(0.0),
                            Color.white.opacity(0.08),
                            Color.white.opacity(0.0)
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    ),
                    lineWidth: 90
                )
                .blur(radius: 40)

                // Streak 3 — mảnh, sáng rõ
                Path { path in
                    path.move(to: CGPoint(x: -50, y: geo.size.height * 0.55))
                    path.addLine(to: CGPoint(
                        x: geo.size.width + 50,
                        y: geo.size.height * 0.30
                    ))
                }
                .stroke(
                    LinearGradient(
                        colors: [
                            Color.white.opacity(0.0),
                            Color.white.opacity(0.15),
                            Color.white.opacity(0.0)
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    ),
                    lineWidth: 18
                )
                .blur(radius: 8)
            }
        }
    }
}

// MARK: - Chevron Button (custom)

struct GlowChevronButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                // Outer glow
                Circle()
                    .fill(Color.white.opacity(0.08))
                    .frame(width: 44, height: 44)
                    .blur(radius: 6)

                // Base circle
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.white.opacity(0.18),
                                Color.white.opacity(0.06)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 38, height: 38)

                // Border
                Circle()
                    .strokeBorder(
                        LinearGradient(
                            colors: [
                                Color.white.opacity(0.75),
                                Color.white.opacity(0.25)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1.2
                    )
                    .frame(width: 38, height: 38)

                // Chevron
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .heavy))
                    .foregroundStyle(.white)
                    .shadow(color: .white.opacity(0.8), radius: 3)
            }
            .frame(width: 44, height: 44)
        }
        .buttonStyle(.plain)
    }
}