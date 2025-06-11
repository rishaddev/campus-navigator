
import SwiftUI

struct LabDetailView: View {
    let lab: Lab
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Hall Image
                Image(lab.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipped()
                
                // Content Section
                VStack(alignment: .leading, spacing: 20) {
                    // lab Name and Navigate Button
                    HStack {
                        Text(lab.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button(action: {
                            // Navigate action
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
                    
                    Text(lab.location)
                        .font(.body)
                        .fontWeight(.medium)
                        .padding(.horizontal)
                        .padding(.top, -10)
                    
                    // Divider
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 1)
                        .padding(.horizontal)
                    
                    // Today's Schedule
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Today")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                        
                        // Schedule Card
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Web API Development")
                                .font(.body)
                                .fontWeight(.medium)
                            
                            Text("COBSCCOMP24.1P | Mr. Steve Jobs")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Spacer().frame(height: 5)
                            
                            Text("Hours")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Text("8 AM - 4 PM")
                                .font(.body)
                                .fontWeight(.medium)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.05))
                        .cornerRadius(12)
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
        .navigationTitle(lab.name)
        .navigationBarTitleDisplayMode(.inline)
        .edgesIgnoringSafeArea(.top)
    }
}
