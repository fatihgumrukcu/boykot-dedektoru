import SwiftUI

struct CategoryCard: View {
    let category: Category
    @State private var isPressed = false
    @State private var showDetail = false
    
    var body: some View {
        Button(action: {
            showDetail = true
        }) {
            VStack(spacing: 16) {
                // Icon
                Group {
                    if category.icon.starts(with: "clean") {
                        Image(category.icon)
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 52, height: 52)
                            .padding(2)
                            .foregroundColor(.white)
                    } else {
                        Image(systemName: category.icon)
                            .font(.system(size: 32))
                            .foregroundColor(.white)
                    }
                }
                .frame(width: 64, height: 64)
                .background(
                    Circle()
                        .fill(category.color)
                )
                
                VStack(spacing: 4) {
                    // Category Name
                    Text(category.name)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    // Brand Count
                    Text("\(category.brands.count) Marka")
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.7))
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(red: 0.15, green: 0.25, blue: 0.45).opacity(0.5))
            )
            .scaleEffect(isPressed ? 0.95 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
        }
        .onTapGesture {
            withAnimation {
                isPressed = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    isPressed = false
                }
            }
        }
        .sheet(isPresented: $showDetail) {
            CategoryDetailView(category: category)
        }
    }
} 