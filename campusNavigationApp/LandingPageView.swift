import SwiftUI

struct LandingPageView: View {
    @Binding var showMainApp: Bool
    
    var body: some View {
        VStack(spacing: 40) {
            Spacer()
            
            VStack(spacing: 20) {
                Text("Campus Navigator")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primaryGreen)
                
                Text("Find your destination easily")
                    .font(.subheadline)
                    .foregroundColor(.secondaryGray)
            }
            
            Spacer()
            
            Button(action: {
                showMainApp = true
            }) {
                Text("Get Started")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.primaryGreen)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 50)
        }
        .background(Color.white)
    }
}

#Preview {
    LandingPageView(showMainApp: .constant(false))
}
