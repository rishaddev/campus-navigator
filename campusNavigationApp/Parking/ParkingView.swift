import SwiftUI

struct ParkingView: View {
    @State private var searchText = ""
    
    let parkings = [
        Parking(id: 1, name: "Main Parking", location: "Ground Floor Harrison Building", contactNumber: "123-456-789", hours:"Open | Closes 04 PM", imageName: "MainParking"),
    ]
    
    var filteredParkings: [Parking] {
        if searchText.isEmpty {
            return parkings
        } else {
            return parkings.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Parkings")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top, 20)
                .foregroundColor(.primaryGreen)
            
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Find parkings...", text: $searchText)
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
                    ForEach(filteredParkings) { parking in
                        NavigationLink(destination: ParkingDetailView(parking: parking)) {
                           ParkingRowView(parking: parking)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
//                        ParkingRowView(parking: parking).buttonStyle(PlainButtonStyle())
                        
                        if parking.id != filteredParkings.last?.id {
                            Divider()
                                .padding(.leading, 90)
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .navigationTitle("Parkings")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
    }
}

struct Parking: Identifiable {
    let id: Int
    let name: String
    let location: String
    let contactNumber: String
    let hours: String
    let imageName: String
}

struct ParkingRowView: View {
    let parking: Parking
    
    var body: some View {
        HStack(spacing: 15) {
            Image(parking.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.1))
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(parking.name)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.primaryGreen)
                
                Text(parking.hours)
                    .font(.caption)
                    .foregroundColor(.gray)
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
    ParkingView()
}
