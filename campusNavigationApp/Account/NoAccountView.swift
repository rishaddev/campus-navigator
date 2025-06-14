import SwiftUI

struct NoAccountView: View {
    @State private var showSignIn = false
    @State private var showSignUp = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                Text("Account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                
                VStack(spacing: 20) {
                    ZStack {
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 80, height: 80)
                        
                        Image(systemName: "person.fill")
                            .font(.system(size: 35))
                            .foregroundColor(.gray)
                    }
                    
                    Text("Not Signed In")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                }
                .padding(.top, 150)
                
                VStack(spacing: 20) {
                    Button(action: {
                        showSignIn = true
                    }) {
                        Text("Sign In")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.primaryGreen)
                            .cornerRadius(8)
                    }
                    
                    HStack(spacing: 4) {
                        Text("No Account?")
                            .foregroundColor(.gray)
                        Button(action: {
                            showSignUp = true
                        }) {
                            Text("Create Account")
                                .foregroundColor(.primaryGreen)
                                .fontWeight(.medium)
                        }
                    }
                    .font(.system(size: 14))
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
                
                Spacer()
            }
        }
        .sheet(isPresented: $showSignIn) {
            SignInView()
        }
        .sheet(isPresented: $showSignUp) {
            SignUpView()
        }
    }
}

#Preview{
    NoAccountView()
}
