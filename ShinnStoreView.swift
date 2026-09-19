import SwiftUI

struct ShinnStoreView: View {
    let categories: [StoreCategory] // Thay thế bằng kiểu dữ liệu thực tế của bạn

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(categories) { category in
                    PackageRowView(category: category)
                }
            }
            .padding()
        }
        .navigationTitle("Shinn Store")
    }
}

// Model và View mẫu (nếu cần để đối chiếu)
struct StoreCategory: Identifiable {
    let id = UUID()
    let name: String
}

struct PackageRowView: View {
    let category: StoreCategory
    
    var body: some View {
        HStack {
            Text(category.name)
                .font(.headline)
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}
