import SwiftUI

struct ShinnStoreView: View {
    @State private var categories: [StoreCategory] = [
        StoreCategory(
            name: "Free Fire",
            iconSystemName: "flame.fill",
            iconAssetName: nil,   // đổi thành "freefire_icon" khi có asset
            packageCount: 2,
            badgeText: "MAX",
            iconColors: [
                Color(red: 1.00, green: 0.78, blue: 0.20),
                Color(red: 0.95, green: 0.35, blue: 0.05)
            ]
        ),
        StoreCategory(
            name: "Free Fire Max",
            iconSystemName: "flame.fill",
            iconAssetName: nil,   // đổi thành "freefiremax_icon"
            packageCount: 2,
            badgeText: "MAX",
            iconColors: [
                Color(red: 1.00, green: 0.72, blue: 0.15),
                Color(red: 0.88, green: 0.28, blue: 0.05)
            ]
        ),
        StoreCategory(
            name: "MOD VIP",
            iconSystemName: "shield.lefthalf.filled",
            iconAssetName: nil,   // đổi thành "modvip_icon"
            packageCount: 9,
            badgeText: nil,
            iconColors: [
                Color(red: 0.50, green: 0.90, blue: 0.45),
                Color(red: 0.20, green: 0.60, blue: 0.25)
            ]
        )
    ]

    var body: some View {
        ZStack {
            LightStreaksBackground()
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 16) {
                    HeaderView()
                        .padding(.top, 4)

                    HeroBannerView(useCustomImage: false)
                        .padding(.top, 2)

                    SectionHeaderView(
                        title: "DANH MỤC GÓI",
                        badgeText: "Miễn phí 100%"
                    )
                    .padding(.top, 4)

                    VStack(spacing: 12) {
                        ForEach(categories) { category in
                            PackageRowView(category: category) {
                                // TODO: navigate to detail
                            }
                        }
                    }

                    Color.clear.frame(height: 30)
                }
            }
            .scrollIndicators(.hidden)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ShinnStoreView()
}