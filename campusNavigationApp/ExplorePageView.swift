import SwiftUI

struct ExplorePageView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    
                    VStack(spacing: 0) {
                        NavigationLink(destination: LectureHallsView()) {
                            CategoryRow(title: "Lecture Halls", icon: "building.2.fill")
                        }
                        
                        NavigationLink(destination: ExaminationsView()) {
                            CategoryRow(title: "Examinations", icon: "doc.text.fill")
                        }
                        
                        NavigationLink(destination: LabsView()) {
                            CategoryRow(title: "Labs", icon: "desktopcomputer")
                        }
                        
                        NavigationLink(destination: LibraryView()) {
                            CategoryRow(title: "Library", icon: "books.vertical.fill")
                        }
                        
                        NavigationLink(destination: DiningView()) {
                            CategoryRow(title: "Dining", icon: "fork.knife")
                        }
                        
                        NavigationLink(destination: ParkingView()) {
                            CategoryRow(title: "Parking", icon: "car.fill")
                        }
                        
                        NavigationLink(destination: EventsView()) {
                            CategoryRow(title: "Events", icon: "calendar.badge.plus")
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Quick Access")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 15) {
                            NavigationLink(destination: ParkingDetailView()) {
                                QuickAccessCard(
                                    title: "Main parking",
                                    imageName: "MainParking",
                                    isSystemImage: false
                                )
                            }
                            
                            NavigationLink(destination: CafeteriaDetailView()) {
                                QuickAccessCard(
                                    title: "Main cafeteria",
                                    imageName: "MainCafeteria",
                                    isSystemImage: false
                                )
                            }
                            
                            NavigationLink(destination: AuditoriumDetailView()) {
                                QuickAccessCard(
                                    title: "Main auditorium",
                                    imageName: "MainParking",
                                    isSystemImage: false
                                )
                            }
                            
                            NavigationLink(destination: LibraryDetailView()) {
                                QuickAccessCard(
                                    title: "Main library",
                                    imageName: "MainCafeteria",
                                    isSystemImage: false
                                )
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer(minLength: 100)
                }
                .padding(.top)
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct CategoryRow: View {
    let title: String
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(.gray)
                .frame(width: 30)
            
            Text(title)
                .font(.body)
                .foregroundColor(.black)
                .padding(.leading, 8)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
        .background(Color.white)
    }
}

struct QuickAccessCard: View {
    let title: String
    let imageName: String
    let isSystemImage: Bool
    
    init(title: String, imageName: String, isSystemImage: Bool = true) {
        self.title = title
        self.imageName = imageName
        self.isSystemImage = isSystemImage
    }
    
    var body: some View {
        VStack() {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.1))
                    .frame(height: 120)
                
                if isSystemImage {
                    Image(systemName: imageName)
                        .font(.system(size: 40))
                        .foregroundColor(.primaryGreen)
                } else {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                        .foregroundColor(.primaryGreen)
                }
            }
            
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .padding(.vertical, 5)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        
    }
}

#Preview {
    ExplorePageView()
}
