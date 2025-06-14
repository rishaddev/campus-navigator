import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var email = ""
    @State private var countdown = 48
    @State private var timer: Timer?
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
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
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.primaryGreen)
            }
            .padding(.bottom, 40)
            
            
            VStack(spacing: 0) {
                Text("Forgot Password")
                    .font(.system(size: 24, weight: .medium))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .foregroundColor(.primaryGreen)
                
                VStack(spacing: 20) {
                    TextField("Enter Email", text: $email)
                        .textFieldStyle(CustomTextFieldStyle())
                    
                    Button(action: {
                        startCountdown()
                    }) {
                        Text("Confirm")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .background(Color.primaryGreen)
                            .cornerRadius(6)
                    }
                    
                    VStack(spacing: 8) {
                        Text("You will receive your password reset link shortly")
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                        
                        Text(String(format: "%02d:%02d", countdown / 60, countdown % 60))
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.primary)
                        
                        HStack(spacing: 4) {
                            Text("If not received?")
                                .foregroundColor(.gray)
                            Button(action: {
                            }) {
                                Text("Click here")
                                    .foregroundColor(.primaryGreen)
                                    .fontWeight(.medium)
                            }
                        }
                        .font(.system(size: 13))
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
        .onDisappear {
            timer?.invalidate()
        }
    }
    
    private func startCountdown() {
        countdown = 48
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if countdown > 0 {
                countdown -= 1
            } else {
                timer?.invalidate()
            }
        }
    }
}

#Preview {
    ForgotPasswordView()
}
