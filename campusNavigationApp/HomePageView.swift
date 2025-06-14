import SwiftUI

struct HomePageView: View {
    @State private var showLectureHallsPage = false
    @State private var showLabsPage = false
    @State private var showSOSPage = false
    @State private var searchText = ""
    
    let lectureHalls = [
        LectureHall(id: 1, name: "Hall 18", location: "2nd Floor Harrison Building", imageName: "Hall-18"),
        LectureHall(id: 2, name: "Hall 22", location: "2nd Floor Harrison Building", imageName: "Hall-22")
    ]
    
    let labs = [
        Lab(id: 1, name: "Mac Lab 1", location: "2nd Floor Harrison Building", imageName: "Hall-18"),
        Lab(id: 2, name: "Mac Lab 2", location: "2nd Floor Harrison Building", imageName: "Hall-18")
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background color
                Color(red: 0.85, green: 0.92, blue: 0.87)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        HeaderSection()
                        
                        VStack(alignment: .leading, spacing: 20) {
                            MapSection()
                            LectureHallsSection()
                            LabsSection()
                            Spacer(minLength: 100)
                        }
                        .padding(.top, 20)
                        .background(Color.white)
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                    }
                }
                .navigationBarHidden(true)
            }
        }
        .sheet(isPresented: $showSOSPage) {
            SOSPageView()
        }
    }
    
    @ViewBuilder
    private func HeaderSection() -> some View {
        VStack(alignment: .leading, spacing: 15) {
            // Search bar with SOS button
            HStack(spacing: 12) {
                // Search bar container
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                    
                    TextField("Search", text: $searchText)
                        .font(.system(size: 16))
                    
                    if !searchText.isEmpty {
                        Button(action: {
                            searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                                .font(.system(size: 16))
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(Color.white.opacity(0.8))
                .cornerRadius(8)
                
                // SOS Button 
                NavigationLink(destination: SOSPageView()) {
                                            Image(systemName: "light.beacon.min")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.red)
                                        }
            }
            .padding(.top, 10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Good Morning,")
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
                Text("John Abraham")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.black)
            }
            .padding(.bottom, 30)
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    private func MapSection() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Map")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.black)
                .padding(.horizontal, 20)
            
            Image("Campus-map")
                .resizable()
//                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
                .cornerRadius(12)
                .padding(.horizontal, 20)
        }
    }
    
    @ViewBuilder
    private func LectureHallsSection() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Lecture Halls")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                Spacer()
                
                NavigationLink(destination: LectureHallsView()){
                    Text("View All")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }.buttonStyle(PlainButtonStyle())
                
            }
            .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(lectureHalls, id: \.id) { hall in
                        NavigationLink(destination: LectureHallDetailView(hall: hall)) {
                            LectureHallCard(lectureHall: hall)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
        }
    }
    
    @ViewBuilder
    private func LabsSection() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Labs")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                Spacer()
                NavigationLink(destination: LabsView()){
                    Text("View All")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }.buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(labs, id: \.id) { lab in
                        NavigationLink(destination: LabDetailView(lab: lab)) {
                            LabCard(lab: lab)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
        }
    }
}

// Emergency Button Component
struct EmergencyButton: View {
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 15) {
                Image(systemName: icon)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(color)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.black)
                    
                    Text(subtitle)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .medium))
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct LectureHallCard: View {
    let lectureHall: LectureHall
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(lectureHall.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 180, height: 120)
                .clipped()
                .cornerRadius(12, corners: [.topLeft, .topRight])
            
            VStack(alignment: .leading, spacing: 4) {
                Text(lectureHall.name)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .frame(width: 180, alignment: .leading)
            .background(Color.white)
            .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

struct LabCard: View {
    let lab: Lab
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(lab.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 180, height: 120)
                .clipped()
                .cornerRadius(12, corners: [.topLeft, .topRight])
            
            VStack(alignment: .leading, spacing: 4) {
                Text(lab.name)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .frame(width: 180, alignment: .leading)
            .background(Color.white)
            .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

// Extension for corner radius on specific corners
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    HomePageView()
}
