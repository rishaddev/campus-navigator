import SwiftUI

struct SOSPageView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
      
           
            
            VStack(spacing: 16) {
                ForEach(0..<4) { _ in
                    ContactRow()
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 24)
            
            Spacer()
        }
        
.navigationTitle("SOS")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)

    }
}

struct ContactRow: View {
    var body: some View {
        Button(action: {
           
        }) {
            HStack {
                Image(systemName: "phone.fill")
                    .foregroundColor(Color.primaryGreen)
                
                Text("Head Office")
                    .foregroundColor(.black)
                    .fontWeight(.medium)
                
                Spacer()
                
                Text("011 2345 678")
                    .foregroundColor(Color.mediumGreen)
                
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.mediumGreen)
            }
            .padding()
            .background(Color.mediumGreen.opacity(0.1))
            .cornerRadius(12)
        }
    }
}
