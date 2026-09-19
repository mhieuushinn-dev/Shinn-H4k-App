import SwiftUI

struct RepositoryMarketplaceView: View {
    var body: some View {
        ZStack {
            // Màu nền tối tổng thể phong cách gaming
            Color.black.ignoresSafeArea()
            
            // Hiệu ứng ánh sáng nền mờ (nếu có thể thêm hình nền texture)
            VStack(spacing: 0) {
                // Header
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        HStack(spacing: 6) {
                            Text("👑")
                                .font(.system(size: 24))
                            Text("SHINN H4K")
                                .font(.system(size: 22, weight: .black))
                                .italic()
                                .foregroundColor(.white)
                        }
                        Text("GAMING CENTER")
                            .font(.system(size: 10, weight: .bold))
                            .tracking(3)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    // Nút Telegram
                    Button(action: {
                        // Mở liên kết Telegram @ShinnThieuu
                    }) {
                        HStack(spacing: 6) {
                            Image(systemName: "paperplane.fill")
                                .font(.system(size: 12))
                            Text("@ShinnThieuu")
                                .font(.system(size: 12, weight: .semibold))
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(
                            Capsule()
                                .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                .background(Capsule().fill(Color.white.opacity(0.1)))
                        )
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 10)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        // Banner Chính (Hình ảnh mèo sét và cảnh báo)
                        ZStack {
                            RoundedRectangle(cornerRadius: 24)
                                .fill(LinearGradient(colors: [Color.gray.opacity(0.3), Color.black], startPoint: .top, endPoint: .bottom))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 24)
                                        .stroke(LinearGradient(colors: [.white.opacity(0.6), .gray.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1.5)
                                )
                            
                            VStack(spacing: 12) {
                                // Hình ảnh mèo (Bạn có thể thay bằng Image("ten_anh_meo"))
                                ZStack {
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color.gray.opacity(0.4))
                                        .frame(height: 140)
                                        .overlay(
                                            Text("🖼️ [Ảnh Mèo Sét]")
                                                .foregroundColor(.white.opacity(0.6))
                                                .font(.system(size: 14, weight: .medium))
                                        )
                                }
                                .padding(10)
                                
                                // Huy hiệu 1: Miễn phí
                                HStack(spacing: 6) {
                                    Image(systemName: "cube.box.fill")
                                        .font(.system(size: 12))
                                    Text("LÀ APP VÀ REPO HOÀN TOÀN")
                                        .font(.system(size: 11, weight: .bold))
                                    Text("FREE")
                                        .font(.system(size: 11, weight: .black))
                                        .italic()
                                        .foregroundColor(.yellow)
                                }
                                .foregroundColor(.white)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 8)
                                .background(
                                    Capsule()
                                        .stroke(Color.white.opacity(0.4), lineWidth: 1)
                                        .background(Capsule().fill(Color.black.opacity(0.6)))
                                )
                                
                                // Huy hiệu 2: Cảnh báo lừa đảo
                                HStack(spacing: 6) {
                                    Image(systemName: "exclamationmark.triangle.fill")
                                        .foregroundColor(.yellow)
                                        .font(.system(size: 12))
                                    Text("NẾU BẠN MUA CHÚNG, BẠN ĐÃ BỊ LÙA!")
                                        .font(.system(size: 11, weight: .black))
                                        .italic()
                                        .foregroundColor(.white)
                                }
                                .padding(.horizontal, 14)
                                .padding(.vertical, 8)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.white.opacity(0.4), lineWidth: 1)
                                        .background(RoundedRectangle(cornerRadius: 12).fill(Color.black.opacity(0.6)))
                                )
                            }
                            .padding(12)
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 10)
                        
                        // Tiêu đề Danh mục gói
                        HStack {
                            HStack(spacing: 8) {
                                Image(systemName: "cube.box.fill")
                                    .foregroundColor(.white)
                                Text("DANH MỤC GÓI")
                                    .font(.system(size: 16, weight: .black))
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                            
                            // Nhãn Miễn phí 100%
                            HStack(spacing: 4) {
                                Image(systemName: "flame.fill")
                                    .font(.system(size: 10))
                                    .foregroundColor(.orange)
                                Text("Miễn phí 100%")
                                    .font(.system(size: 11, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(
                                Capsule()
                                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                    .background(Capsule().fill(Color.gray.opacity(0.2)))
                            )
                        }
                        .padding(.horizontal, 20)
                        
                        // Danh sách các Card Gói
                        VStack(spacing: 14) {
                            PackageCardView(title: "Free Fire", subtitle: "2 gói", iconName: "ff_icon", tag: "MAX")
                            PackageCardView(title: "Free Fire Max", subtitle: "2 gói", iconName: "ffmax_icon", tag: "MAX")
                            PackageCardView(title: "MOD VIP", subtitle: "9 gói", iconName: "modvip_icon", tag: nil)
                        }
                        .padding(.horizontal, 16)
                        
                        Spacer(minLength: 40)
                    }
                }
            }
        }
    }
}

// Subview cho từng thẻ gói ứng dụng
struct PackageCardView: View {
    var title: String
    var subtitle: String
    var iconName: String
    var tag: String?
    
    var body: some View {
        HStack(spacing: 14) {
            // Icon ứng dụng có tag MAX (nếu có)
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 64, height: 64)
                    .overlay(
                        Text("🎮")
                            .font(.system(size: 28))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.white.opacity(0.2), lineWidth: 1)
                    )
                
                if let tag = tag {
                    Text(tag)
                        .font(.system(size: 9, weight: .black))
                        .italic()
                        .foregroundColor(.black)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(
                            UnevenRoundedRectangle(topLeadingRadius: 14, bottomTrailingRadius: 6)
                                .fill(Color.yellow)
                        )
                }
            }
            
            // Tên và thông tin gói
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                
                HStack(spacing: 4) {
                    Image(systemName: "cube.box.fill")
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                    Text(subtitle)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
            
            // Nút mũi tên chuyển hướng
            Circle()
                .fill(Color.white.opacity(0.15))
                .frame(width: 36, height: 36)
                .overlay(
                    Image(systemName: "chevron.right")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.white)
                )
                .overlay(
                    Circle().stroke(Color.white.opacity(0.3), lineWidth: 1)
                )
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(colors: [Color.gray.opacity(0.2), Color.black.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(LinearGradient(colors: [.white.opacity(0.4), .gray.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
                )
        )
    }
}
