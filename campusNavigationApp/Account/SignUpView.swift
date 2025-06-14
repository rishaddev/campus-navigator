import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Account")
                    .font(.title3)
                    .fontWeight(.medium)
                
                Spacer()
                
                Button("Close") {
                    dismiss()
                }
                .foregroundColor(.gray)
                .font(.system(size: 14))
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .padding(.bottom, 30)
            
            
            VStack(spacing: 15) {
                ZStack {
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 60, height: 60)
                    
                    Image(systemName: "person.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.gray)
                }
                
                Text("Not Signed In")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.primaryGreen)
            }
            .padding(.bottom, 40)
            
            
            VStack(spacing: 0) {
                Text("Sign Up")
                    .font(.system(size: 24, weight: .bold))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .foregroundColor(.primaryGreen)
                
                
                VStack(spacing: 15) {
                    TextField("Name", text: $name)
                        .textFieldStyle(CustomTextFieldStyle())
                    
                    TextField("Email", text: $email)
                        .textFieldStyle(CustomTextFieldStyle())
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(CustomTextFieldStyle())
                    
                    Button(action: {
                    }) {
                        Text("Sign Up")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .background(Color.primaryGreen)
                            .cornerRadius(6)
                    }
                    .padding(.top, 10)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 25)
                .background(Color(.systemBackground))
            }
            
            Spacer()
        }
        .background(Color(.systemBackground))
    }
}

#Preview {
    SignUpView()
}
