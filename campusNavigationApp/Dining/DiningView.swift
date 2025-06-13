import SwiftUI

struct DiningView: View {
    @State private var searchText = ""
    
    let dinings = [
        Dining(id: 1, name: "The Grill", location: "2nd Floor Harrison Building", hours:"Open | Closes 04 PM", imageName: "The-Grill"),
        Dining(id: 2, name: "The Bistro", location: "2nd Floor Harrison Building", hours:"Closed", imageName: "The-Bistro"),
        Dining(id: 3, name: "Pastry & Puff", location: "2nd Floor Harrison Building", hours:"Open | Closes 04 PM", imageName: "Pastry&Puff"),
        Dining(id: 4, name: "The Cafe", location: "2nd Floor Harrison Building", hours:"Open | Closes 04 PM", imageName: "The-Cafe")
    ]
    
    var filteredDinings: [Dining] {
        if searchText.isEmpty {
            return dinings
        } else {
            return dinings.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Dinings")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top, 20)
                .foregroundColor(.primaryGreen)
            
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Find dinings...", text: $searchText)
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
                    ForEach(filteredDinings) { dining in
                        NavigationLink(destination: DiningDetailView(dining: dining)) {
                            DiningRowView(dining: dining)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if dining.id != filteredDinings.last?.id {
                            Divider()
                                .padding(.leading, 90)
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .navigationTitle("Dinings")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
    }
}

struct Dining: Identifiable {
    let id: Int
    let name: String
    let location: String
    let hours: String
    let imageName: String
}

struct DiningRowView: View {
    let dining: Dining
    
    var body: some View {
        HStack(spacing: 15) {
            Image(dining.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.1))
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(dining.name)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.primaryGreen)
                
                Text(dining.hours)
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

//#Preview{
//    DiningView()
//}
