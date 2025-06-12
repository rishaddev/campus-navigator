import SwiftUI

struct LibrariesView: View {
    @State private var searchText = ""
    
    let libraries = [
        Library(id: 1, name: "Common Library", location: "2nd Floor Harrison Building", hours :"Open. 07: 00 AM to 04:00 PM", imageName: "Common-Library"),
        Library(id: 2, name: "Phycology Library", location: "2nd Floor Harrison Building", hours :"Open. 07: 00 AM to 04:00 PM",imageName: "Common-Library"),
        Library(id: 3, name: "Common Library", location: "2nd Floor Harrison Building", hours :"Open. 07: 00 AM to 04:00 PM",imageName: "Common-Library"),
        Library(id: 4, name: "Phycology Library", location: "2nd Floor Harrison Building", hours :"Open. 07: 00 AM to 04:00 PM",imageName: "Common-Library"),
        Library(id: 5, name: "Common Library", location: "2nd Floor Harrison Building", hours :"Open. 07: 00 AM to 04:00 PM",imageName: "Common-Library"),
        Library(id: 6, name: "Phycology Library", location: "2nd Floor Harrison Building", hours :"Open. 07: 00 AM to 04:00 PM", imageName: "Common-Library"),
        Library(id: 7, name: "Common Library", location: "2nd Floor Harrison Building",hours :"Open. 07: 00 AM to 04:00 PM", imageName: "Common-Library"),
    ]
    
    var filteredLibraries: [Library] {
        if searchText.isEmpty {
            return libraries
        } else {
            return libraries.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Libraries")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top, 20)
                .foregroundColor(.primaryGreen)
            
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Find libraries...", text: $searchText)
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
                    ForEach(filteredLibraries) { library in
                        NavigationLink(destination: LibraryDetailView(library: library)) {
                            LibraryRowView(library: library)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if library.id != filteredLibraries.last?.id {
                            Divider()
                                .padding(.leading, 90)
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .navigationTitle("Libraries")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
    }
}

struct Library: Identifiable {
    let id: Int
    let name: String
    let location: String
    let hours: String
    let imageName: String
}

struct LibraryRowView: View {
    let library: Library
    
    var body: some View {
        HStack(spacing: 15) {
            Image(library.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.1))
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(library.name)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.primaryGreen)
                
                Text(library.location)
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

#Preview{
    LibrariesView()
}
