import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 15)
            .padding(.vertical, 12)
            .background(Color.mediumGreen.opacity(0.1))
            .cornerRadius(6)
            .font(.system(size: 15))
    }
}

