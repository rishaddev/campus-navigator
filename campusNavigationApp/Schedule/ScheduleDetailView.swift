import SwiftUI

struct ScheduleDetailView: View {
    let schedule: Schedule
    @State private var showNavigationPopup = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Title and Navigate Button
                    HStack {
                        Text(schedule.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Date & Time")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text(schedule.hours)
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    .padding(.horizontal)
                    
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Venue")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text(schedule.location)
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    .padding(.horizontal)
                    
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Lecturer")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text(schedule.lecturer)
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    .padding(.horizontal)
                    
                    // Full Width Navigate Button
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
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.primaryGreen)
                        .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    // Description Section
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Description")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eius mod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eius mod tempor incididunt ut labore et dolore magna aliqua.")
                            .font(.body)
                            .lineSpacing(4)
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    // Terms & Condition Section
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Terms & Condition")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            HStack(alignment: .top) {
                                Text("1.")
                                    .font(.body)
                                    .fontWeight(.medium)
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eius mod tempor incididunt ut labore et dolore magna")
                                    .font(.body)
                                    .lineSpacing(2)
                            }
                            
                            HStack(alignment: .top) {
                                Text("2.")
                                    .font(.body)
                                    .fontWeight(.medium)
                                Text("liqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eius mod tempor incididunt ut labore et dolore magna aliqua")
                                    .font(.body)
                                    .lineSpacing(2)
                            }
                            
                            HStack(alignment: .top) {
                                Text("3.")
                                    .font(.body)
                                    .fontWeight(.medium)
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eius mod tempor incididunt ut labore et dolore magna")
                                    .font(.body)
                                    .lineSpacing(2)
                            }
                            
                            HStack(alignment: .top) {
                                Text("4.")
                                    .font(.body)
                                    .fontWeight(.medium)
                                Text("liqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eius mod tempor incididunt ut labore et dolore magna aliqua.")
                                    .font(.body)
                                    .lineSpacing(2)
                            }
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
                    
                    Text(schedule.location)
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
            .navigationTitle(schedule.name)
            .navigationBarTitleDisplayMode(.inline)
            
            // Navigation Popup
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
}

#Preview{
    ScheduleDetailView(schedule: Schedule(
                id: 1,
                name: "Web Application Development",
                location: "Hall 24",
                hours: "06 June 2025 | 09:00 AM - 12:00 PM",
                lecturer: "Mr. John"
            ))
}
