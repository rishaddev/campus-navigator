import SwiftUI

struct DiningDetailView: View {
    let dining: Dining
    @State private var showNavigationPopup = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(dining.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipped()
                
                // Content Section
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text(dining.name)
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
                    
                    // Location
                    HStack {
                        Text("Location")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Text(dining.location)
                        .font(.body)
                        .fontWeight(.medium)
                        .padding(.horizontal)
                        .padding(.top, -10)
                    
                    HStack {
                        Text("Hours")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Text(dining.hours)
                        .font(.body)
                        .fontWeight(.medium)
                        .padding(.horizontal)
                        .padding(.top, -10)
                    
                    // Divider
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 1)
                        .padding(.horizontal)
                    
                    // Crowd
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
                    
                    // Menu Section
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("Menu")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Button(action: {
                                // View All action
                            }) {
                                Text("View All")
                                    .font(.subheadline)
                                    .foregroundColor(.primaryGreen)
                            }
                        }
                        .padding(.horizontal)
                        
                        // Menu Items
                        VStack(spacing: 0) {
                            MenuItemRow(
                                imageName: "chicken-pastry",
                                title: "Chicken Pastry",
                                price: "Rs. 150.00"
                            )
                            
                            Divider()
                                .padding(.leading, 70)
                            
                            MenuItemRow(
                                imageName: "egg-roll",
                                title: "Egg Roll",
                                price: "Rs. 150.00"
                            )
                            
                            Divider()
                                .padding(.leading, 70)
                            
                            MenuItemRow(
                                imageName: "chocolate-shake",
                                title: "Chocolate Milk Shake",
                                price: "Rs. 450.00"
                            )
                        }
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
                            AmenityCard(icon: "chair.fill", title: "150 Seats")
                            AmenityCard(icon: "figure.wave", title: "Restroom")
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
        .navigationTitle(dining.name)
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

// Menu Item Row Component
struct MenuItemRow: View {
    let imageName: String
    let title: String
    let price: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.1))
                )
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                
                Spacer()
            }
            
            Spacer()
            
            HStack(spacing: 5) {
                Text(price)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 12)
        .contentShape(Rectangle())
    }
}

struct MenuItem: Identifiable {
    let id: Int
    let name: String
    let price: String
    let imageName: String
}

//#Preview {
//    DiningDetailView(dining: Dining(id: 1, name: "The Grill", location: "Ground Floor, Harrison Building", hours: "Open. 07:00 AM to 04:00 PM", imageName: "The-Grill"))
//}
