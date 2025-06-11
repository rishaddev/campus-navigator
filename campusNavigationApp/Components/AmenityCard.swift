import SwiftUI


struct AmenityCard: View {
    let icon: String
    let title: String
    var isFullWidth: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.primaryGreen)
                .font(.system(size: 20))
                .frame(width: 24)
            
            Text(title)
                .font(.body)
                .foregroundColor(.primary)
            
            if !isFullWidth {
                Spacer()
            }
        }
        .padding()
        .background(Color.clear)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
    }
}
