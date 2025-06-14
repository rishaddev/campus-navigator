import SwiftUI

struct BuildingDetailView: View {
    let building: Building
    @State private var showNavigationPopup = false
    @State private var selectedFloor = "Ground Floor"
    
    let floors = ["Ground Floor", "1st Floor", "2nd Floor", "3rd Floor"]
    
    // Map floor names to image names
    var floorImageName: String {
        switch selectedFloor {
        case "Ground Floor":
            return "ground-floor"
        case "1st Floor":
            return "1st-floor"
        case "2nd Floor":
            return "2nd-floor"
        case "3rd Floor":
            return "3rd-floor"
        default:
            return "ground-floor"
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(building.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipped()
                
                // Content Section
                VStack(alignment: .leading, spacing: 20) {
                    // Hall Name and Navigate Button
                    HStack {
                        Text(building.name)
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
                    
                    // Divider
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 1)
                        .padding(.horizontal)
                    
                    // Floor Plan Section
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Floor Plan")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                        
                        // Floor Dropdown
                        HStack {
                            Menu {
                                ForEach(floors, id: \.self) { floor in
                                    Button(floor) {
                                        selectedFloor = floor
                                    }
                                }
                            } label: {
                                HStack {
                                    Text(selectedFloor)
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.primary)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.down")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundColor(.gray)
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 12)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(8)
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        // Floor Plan Image
                        VStack {
                            Image(floorImageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxHeight: 400)
                                .cornerRadius(12)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(12)
                        }
                        .padding(.horizontal)
                    }
                    
                    // Divider
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 1)
                        .padding(.horizontal)
                    
                    // Amenities
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Departments")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 10) {
                            AmenityCard(icon: "building.fill", title: "Computing")
                            AmenityCard(icon: "building.fill", title: "Logistics")
                            AmenityCard(icon: "building.fill", title: "Business")
                            AmenityCard(icon: "building.fill", title: "Marketing")
                        }
                        .padding(.horizontal)
                        
                    }
                    
                    Spacer(minLength: 50)
                }
            }
        }
        .navigationTitle(building.name)
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

#Preview {
    BuildingDetailView(building: Building(id: 1, name: "Harrison Building", location: "", imageName: "Harrison-Building"))
}
