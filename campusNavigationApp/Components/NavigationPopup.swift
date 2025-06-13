import SwiftUI

struct NavigationPopup: View {
    @Binding var isPresented: Bool
    let destination: String
    let distance: String
    let imageName: String
    
    var body: some View {
        ZStack {
            // Background overlay
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    isPresented = false
                }
            
            // Popup content
            VStack(spacing: 0) {
                // Header
                HStack {
                    Text("Navigation")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button(action: {
                        isPresented = false
                    }) {
                        Text("Close")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                
                // Direction card
                VStack(spacing: 12) {
                    HStack {
                        Image(systemName: "arrow.up")
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(Color.primaryGreen)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("towards \(destination)")
                                .font(.body)
                                .fontWeight(.medium)
                            
                            Text(distance)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .background(Color.primaryGreen.opacity(0.1))
                    .cornerRadius(12)
                    
                    // Gate image
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                
                // Navigation buttons
                HStack(spacing: 15) {
                    Button(action: {
                        isPresented = false
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 14, weight: .medium))
                            Text("Previous")
                                .font(.system(size: 16, weight: .medium))
                        }
                        .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        isPresented = false
                    }) {
                        HStack {
                            Text("Next")
                                .font(.system(size: 16, weight: .medium))
                            Image(systemName: "chevron.right")
                                .font(.system(size: 14, weight: .medium))
                        }
                        .foregroundColor(.gray)
                    }
                }
                .padding()
            }
            .background(Color.white)
            .cornerRadius(20)
            .padding()
        }
    }
}
