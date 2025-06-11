import SwiftUI

struct ExplorePageView: View {
    @State private var showLectureHalls = false
    @State private var showExaminations = false
    @State private var showLabs = false
    @State private var showLibrary = false
    @State private var showDining = false
    @State private var showParking = false
    @State private var showEvents = false
    @State private var showCarPark = false
    @State private var showCafeteria = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    // Categories Section
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Categories")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 15) {
                            CategoryButton(title: "Lecture Halls", icon: "building.2.fill") {
                                showLectureHalls = true
                            }
                            CategoryButton(title: "Examinations", icon: "doc.text.fill") {
                                showExaminations = true
                            }
                            CategoryButton(title: "Labs", icon: "desktopcomputer") {
                                showLabs = true
                            }
                            CategoryButton(title: "Library", icon: "books.vertical.fill") {
                                showLibrary = true
                            }
                            CategoryButton(title: "Dining", icon: "fork.knife") {
                                showDining = true
                            }
                            CategoryButton(title: "Parking", icon: "car.fill") {
                                showParking = true
                            }
                            CategoryButton(title: "Events", icon: "calendar.badge.plus") {
                                showEvents = true
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Quick Access Section
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Quick Access")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        HStack(spacing: 15) {
                            QuickAccessCard(
                                title: "Car Parking",
                                imageName: "car.fill",
                                action: {
                                    showCarPark = true
                                }
                            )
                            
                            QuickAccessCard(
                                title: "Cafeteria",
                                imageName: "cup.and.saucer.fill",
                                action: {
                                    showCafeteria = true
                                }
                            )
                        }
                        .padding(.horizontal)
                        
                        HStack(spacing: 15) {
                            QuickAccessCard(
                                title: "Main Building",
                                imageName: "building.fill",
                                action: {
                                    showCarPark = true
                                }
                            )
                            
                            QuickAccessCard(
                                title: "Sports Center",
                                imageName: "sportscourt.fill",
                                action: {
                                    showCafeteria = true
                                }
                            )
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
        .sheet(isPresented: $showLectureHalls) {
            PlaceholderView(title: "Lecture Halls")
        }
        .sheet(isPresented: $showExaminations) {
            PlaceholderView(title: "Examinations")
        }
        .sheet(isPresented: $showLabs) {
            PlaceholderView(title: "Labs")
        }
        .sheet(isPresented: $showLibrary) {
            PlaceholderView(title: "Library")
        }
        .sheet(isPresented: $showDining) {
            PlaceholderView(title: "Dining")
        }
        .sheet(isPresented: $showParking) {
            PlaceholderView(title: "Parking")
        }
        .sheet(isPresented: $showEvents) {
            PlaceholderView(title: "Events")
        }
        .sheet(isPresented: $showCarPark) {
            PlaceholderView(title: "Car Park")
        }
        .sheet(isPresented: $showCafeteria) {
            PlaceholderView(title: "Cafeteria")
        }
    }
}

struct CategoryButton: View {
    let title: String
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(.primaryGreen)
                    .frame(width: 30)
                
                Text(title)
                    .font(.body)
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding()
            .background(Color.backgroundGray)
            .cornerRadius(10)
        }
    }
}

struct QuickAccessCard: View {
    let title: String
    let imageName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 10) {
                Image(systemName: imageName)
                    .font(.system(size: 40))
                    .foregroundColor(.primaryGreen)
                    .frame(height: 80)
                
                Text(title)
                    .font(.caption)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.backgroundGray)
            .cornerRadius(12)
        }
    }
}

#Preview {
    ExplorePageView()
}
