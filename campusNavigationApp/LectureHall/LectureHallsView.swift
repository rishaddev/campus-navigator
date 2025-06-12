//
//  LectureHallsView.swift
//  campusNavigationApp
//
//  Created by Rishad 009 on 2025-06-11.
//

import SwiftUI

struct LectureHallsView: View {
    @State private var searchText = ""
    
    let lectureHalls = [
        LectureHall(id: 1, name: "Hall 18", location: "2nd Floor Harrison Building", imageName: "Hall-18"),
        LectureHall(id: 2, name: "Hall 22", location: "2nd Floor Harrison Building", imageName: "Hall-22"),
        LectureHall(id: 3, name: "Hall 303", location: "2nd Floor Harrison Building", imageName: "Hall-303"),
        LectureHall(id: 4, name: "Hall 15", location: "2nd Floor Harrison Building", imageName: "Hall-15"),
        LectureHall(id: 5, name: "Hall 20", location: "2nd Floor Harrison Building", imageName: "Hall-22"),
        LectureHall(id: 6, name: "Hall 31", location: "2nd Floor Harrison Building", imageName: "Hall-303")
    ]
    
    var filteredHalls: [LectureHall] {
        if searchText.isEmpty {
            return lectureHalls
        } else {
            return lectureHalls.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Lecture Halls")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top, 20)
                .foregroundColor(.primaryGreen)
            
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Find lecture halls...", text: $searchText)
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
                    ForEach(filteredHalls) { hall in
                        NavigationLink(destination: LectureHallDetailView(hall: hall)) {
                            HallRowView(hall: hall)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if hall.id != filteredHalls.last?.id {
                            Divider()
                                .padding(.leading, 90)
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .navigationTitle("Lecture Halls")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
    }
}

struct LectureHall: Identifiable {
    let id: Int
    let name: String
    let location: String
    let imageName: String
}

struct HallRowView: View {
    let hall: LectureHall
    
    var body: some View {
        HStack(spacing: 15) {
            Image(hall.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.1))
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(hall.name)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.primaryGreen)
                
                Text(hall.location)
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
    LectureHallsView()
}
    