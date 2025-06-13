
import SwiftUI

struct LibraryDetailView: View {
    let library: Library
    @State private var showNavigationPopup = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(library.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 20) {
                    // lab Name and Navigate Button
                    HStack {
                        Text(library.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button(action: {
                            showNavigationPopup = true
                        }) {
                            HStack {
                                Image(systemName: "location.north.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                Text("Navigate")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(Color.primaryGreen)
                            .cornerRadius(8)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    HStack {
                        Text("Location")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Text(library.location)
                        .font(.body)
                        .fontWeight(.medium)
                        .padding(.horizontal)
                        .padding(.top, -10)
                    
                    // Hours
                    HStack {
                        Text("Hours")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Text(library.hours)
                        .font(.body)
                        .fontWeight(.medium)
                        .padding(.horizontal)
                        .padding(.top, -10)
                    
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 1)
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Crowd")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                        
                        VStack(alignment: .center, spacing: 5) {
                            Text("80%")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                            
                            Text("Occupied")
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(.primaryGreen)
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.lightGreen)
                        .cornerRadius(10)
                        .padding(.horizontal)

                    }
                    
                    // Amenities
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Amenities")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 10) {
                            AmenityCard(icon: "wifi", title: "Wi-Fi")
                            AmenityCard(icon: "chair.fill", title: "100 Seats")
                            AmenityCard(icon: "rectangle.on.rectangle", title: "Smart Board")
                            AmenityCard(icon: "door.left.hand.open", title: "2 Entrance")
                        }
                        .padding(.horizontal)
                        
                        // Accessible Entrance (full width)
                        AmenityCard(icon: "figure.roll", title: "Accessible Entrance", isFullWidth: true)
                            .padding(.horizontal)
                    }
                    
                    Spacer(minLength: 50)
                }
            }
        }
        .navigationTitle(library.name)
        .navigationBarTitleDisplayMode(.inline)
        .edgesIgnoringSafeArea(.top)
        
        if showNavigationPopup {
            NavigationPopup(
                isPresented: $showNavigationPopup,
                destination: "Gate No. 01",
                distance: "150m",
                imageName: "Gate-1"
            )
            .animation(.easeInOut(duration: 0.3), value: showNavigationPopup)
        }
    }
}

