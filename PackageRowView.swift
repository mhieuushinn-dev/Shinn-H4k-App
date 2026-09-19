// Trong PackageRowView.swift, đoạn icon:

if let assetName = category.iconAssetName {
    Image(assetName)
        .resizable()
        .aspectRatio(contentMode: .fill)   // ← fill thay vì fit
        .frame(width: 58, height: 58)
        .clipped()                          // ← cắt phần thừa
        .clipShape(RoundedRectangle(cornerRadius: 13))
} else {
    Image(systemName: category.iconSystemName)
        .font(.system(size: 26, weight: .semibold))
        .foregroundStyle(.white)
        .frame(width: 58, height: 58)
        .shadow(color: .black.opacity(0.5), radius: 3)
}