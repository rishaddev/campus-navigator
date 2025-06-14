import SwiftUI

struct SignInView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var username = ""
    @State private var password = ""
    @State private var showForgotPassword = false
    
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
                    .foregroundColor(.primary)
            }
            .padding(.bottom, 40)
            
            VStack(spacing: 0) {
                Text("Sign In")
                    .font(.system(size: 24, weight: .bold))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .foregroundColor(.primaryGreen)
//                    .background(Color.gray.opacity(0.1))
                
                
                VStack(spacing: 15) {
                    TextField("Username", text: $username)
                        .textFieldStyle(CustomTextFieldStyle())
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(CustomTextFieldStyle())
                    
                    Button(action: {
                    }) {
                        Text("Sign In")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .background(Color.primaryGreen)
                            .cornerRadius(6)
                    }
                    .padding(.top, 10)
                    
                    // Forgot Password Link
                    HStack(spacing: 4) {
                        Text("Forgot Password?")
                            .foregroundColor(.gray)
                        Button(action: {
                            showForgotPassword = true
                        }) {
                            Text("Click Here")
                                .foregroundColor(.primaryGreen)
                                .fontWeight(.medium)
                        }
                    }
                    .font(.system(size: 13))
                    .padding(.top, 5)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 25)
                .background(Color(.systemBackground))
            }
            
            Spacer()
        }
        .background(Color(.systemBackground))
        .sheet(isPresented: $showForgotPassword) {
            ForgotPasswordView()
        }
    }
}

#Preview{
    SignInView()
}
