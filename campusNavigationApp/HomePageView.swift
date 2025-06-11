import SwiftUI

struct HomePageView: View {
    @State private var showLectureHallInfo = false
    @State private var showLabInfo = false
    @State private var showLectureHallPage = false
    @State private var showLabsPage = false
    
    let lectureHalls = ["Hall 10", "Hall 12", "Hall 2", "Hall 5", "Hall 8"]
    let labs = ["Lab 1", "Lab 2", "Lab 3", "Lab 4", "Lab 5"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Header
                    HStack {
                        Text("John Abraham")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    // Map Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Map")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        Image(systemName: "map.fill")
                            .font(.system(size: 100))
                            .foregroundColor(.primaryGreen)
                            .frame(maxWidth: .infinity, minHeight: 200)
                            .background(Color.backgroundGray)
                            .cornerRadius(12)
                            .padding(.horizontal)
                    }
                    
                    // Lecture Halls Section
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Lecture Halls")
                                .font(.headline)
                            Spacer()
                            Button("View All") {
                                showLectureHallPage = true
                            }
                            .foregroundColor(.primaryGreen)
                        }
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(lectureHalls, id: \.self) { hall in
                                    FacilityCard(
                                        title: hall,
                                        imageName: "building.2.fill",
                                        action: {
                                            showLectureHallInfo = true
                                        }
                                    )
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    // Labs Section
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Labs")
                                .font(.headline)
                            Spacer()
                            Button("View All") {
                                showLabsPage = true
                            }
                            .foregroundColor(.primaryGreen)
                        }
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(labs, id: \.self) { lab in
                                    FacilityCard(
                                        title: lab,
                                        imageName: "desktopcomputer",
                                        action: {
                                            showLabInfo = true
                                        }
                                    )
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    Spacer(minLength: 100)
                }
                .padding(.top)
            }
            .navigationBarHidden(true)
        }
        .sheet(isPresented: $showLectureHallInfo) {
            LectureHallInfoView()
        }
        .sheet(isPresented: $showLabInfo) {
            LabInfoView()
        }
        .sheet(isPresented: $showLectureHallPage) {
            LectureHallPageView()
        }
        .sheet(isPresented: $showLabsPage) {
            LabsPageView()
        }
    }
}

struct FacilityCard: View {
    let title: String
    let imageName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: imageName)
                    .font(.system(size: 40))
                    .foregroundColor(.primaryGreen)
                    .frame(width: 120, height: 80)
                    .background(Color.backgroundGray)
                    .cornerRadius(8)
                
                Text(title)
                    .font(.caption)
                    .foregroundColor(.black)
            }
        }
    }
}

#Preview {
    HomePageView()
}
