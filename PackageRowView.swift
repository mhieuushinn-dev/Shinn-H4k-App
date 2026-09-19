import SwiftUI

struct PackageRowView: View {
    let category: StoreCategory // Hoặc kiểu dữ liệu tương ứng của bạn trong StoreModels

    var body: some View {
        HStack(spacing: 12) {
            if let assetName = category.iconAssetName {
                Image(assetName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 58, height: 58)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 13))
            } else {
                Image(systemName: category.iconSystemName)
                    .font(.system(size: 26, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(width: 58, height: 58)
                    .shadow(color: .black.opacity(0.5), radius: 3)
            }
        }
    }
}
