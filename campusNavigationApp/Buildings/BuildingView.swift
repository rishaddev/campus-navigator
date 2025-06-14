import SwiftUI

struct BuildingsView: View {
    @State private var searchText = ""
    
    let buildings = [
        Building(id: 1, name: "Harrison Building", location: "", imageName: "Harrison-Building"),
        Building(id: 2, name: "Aitken Building", location: "", imageName: "Aitken-Building"),
        Building(id: 3, name: "Lincoln Building", location: "", imageName: "Lincoln-Building"),
    ]
    
    var filteredBuildings: [Building] {
        if searchText.isEmpty {
            return buildings
        } else {
            return buildings.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Buildings")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top, 20)
                .foregroundColor(.primaryGreen)
            
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Find buildings...", text: $searchText)
                    .textFieldStyle(PlainTextFieldStyle())
                
                if !searchText.isEmpty {
                    Button(action: {
                        searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.vertical, 15)
            
            
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(filteredBuildings) { building in
                        NavigationLink(destination: BuildingDetailView(building: building)) {
                            BuildingRowView(building: building)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if building.id != filteredBuildings.last?.id {
                            Divider()
                                .padding(.leading, 90)
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .navigationTitle("Buildings")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
    }
}

struct Building: Identifiable {
    let id: Int
    let name: String
    let location: String
    let imageName: String
}

struct BuildingRowView: View {
    let building: Building
    
    var body: some View {
        HStack(spacing: 15) {
            Image(building.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.1))
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(building.name)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.primaryGreen)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 12)
        .contentShape(Rectangle())
    }
}

#Preview {
    BuildingsView()
}
