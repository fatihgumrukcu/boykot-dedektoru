import SwiftUI

struct NavigationButton: View {
    let icon: String
    let text: String
    var isSelected: Bool = false
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(isSelected ? .white : .white.opacity(0.5))
            Text(text)
                .font(.system(size: 12))
                .foregroundColor(isSelected ? .white : .white.opacity(0.5))
        }
    }
} 