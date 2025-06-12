import SwiftUI

struct LabsView: View {
    @State private var searchText = ""
    
    let labs = [
        Lab(id: 1, name: "Mac Lab 1", location: "2nd Floor Harrison Building", imageName: "Hall-18"),
        Lab(id: 2, name: "Mac Lab 2", location: "2nd Floor Harrison Building", imageName: "Hall-18"),
        Lab(id: 3, name: "Mac Lab 3", location: "2nd Floor Harrison Building", imageName: "Hall-18"),
    ]
    
    var filteredLabs: [Lab] {
        if searchText.isEmpty {
            return labs
        } else {
            return labs.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Labs")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top, 20)
                .foregroundColor(.primaryGreen)
            
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Find labs...", text: $searchText)
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
                    ForEach(filteredLabs) { lab in
                        NavigationLink(destination: LabDetailView(lab: lab)) {
                            LabRowView(lab: lab)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if lab.id != filteredLabs.last?.id {
                            Divider()
                                .padding(.leading, 90)
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .navigationTitle("Labs")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
    }
}

struct Lab: Identifiable {
    let id: Int
    let name: String
    let location: String
    let imageName: String
}

struct LabRowView: View {
    let lab: Lab
    
    var body: some View {
        HStack(spacing: 15) {
            Image(lab.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.1))
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(lab.name)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.primaryGreen)
                
                Text(lab.location)
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
//    LabsView()
//}
