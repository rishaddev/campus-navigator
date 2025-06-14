import SwiftUI

// Generic Placeholder View
struct PlaceholderView: View {
    let title: String
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image(systemName: "doc.text")
                    .font(.system(size: 80))
                    .foregroundColor(.primaryGreen)
                
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text("This page is under development")
                    .font(.subheadline)
                    .foregroundColor(.secondaryGray)
                    .padding(.top, 5)
                
                Spacer()
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing: Button("Done") {
                    dismiss()
                }
            )
        }
    }
}

// Lecture Hall Info View
struct LectureHallInfoView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image(systemName: "building.2.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.primaryGreen)
                
                Text("Lecture Hall Info")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text("Detailed information about the lecture hall will be displayed here")
                    .font(.subheadline)
                    .foregroundColor(.secondaryGray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top, 5)
                
                Spacer()
            }
            .navigationTitle("Hall Details")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing: Button("Done") {
                    dismiss()
                }
            )
        }
    }
}

// Lab Info View
struct LabInfoView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image(systemName: "desktopcomputer")
                    .font(.system(size: 80))
                    .foregroundColor(.primaryGreen)
                
                Text("Lab Info")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text("Detailed information about the computer lab will be displayed here")
                    .font(.subheadline)
                    .foregroundColor(.secondaryGray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top, 5)
                
                Spacer()
            }
            .navigationTitle("Lab Details")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing: Button("Done") {
                    dismiss()
                }
            )
        }
    }
}

// Schedule Info View
struct ScheduleInfoView: View {
    let schedule: Schedule
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 15) {
                    Text(schedule.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    HStack {
                        Image(systemName: "clock.fill")
                            .foregroundColor(.primaryGreen)
                        Text(schedule.hours)
                            .font(.headline)
                    }
                    
                    HStack {
                        Image(systemName: "location.fill")
                            .foregroundColor(.primaryGreen)
                        Text(schedule.location)
                            .font(.headline)
                    }
                }
                .padding()
                .background(Color.backgroundGray)
                .cornerRadius(12)
                
                Text("Additional details about this class will be displayed here")
                    .font(.body)
                    .foregroundColor(.secondaryGray)
                    .padding()
                
                Spacer()
            }
            .padding()
            .navigationTitle("Schedule Details")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing: Button("Done") {
                    dismiss()
                }
            )
        }
    }
}

// Lecture Hall Page View (View All)
struct LectureHallPageView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image(systemName: "building.2.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.primaryGreen)
                
                Text("All Lecture Halls")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text("Complete list of all lecture halls in the university will be displayed here")
                    .font(.subheadline)
                    .foregroundColor(.secondaryGray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top, 5)
                
                Spacer()
            }
            .navigationTitle("Lecture Halls")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing: Button("Done") {
                    dismiss()
                }
            )
        }
    }
}

// Labs Page View (View All)
struct LabsPageView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image(systemName: "desktopcomputer")
                    .font(.system(size: 80))
                    .foregroundColor(.primaryGreen)
                
                Text("All Labs")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text("Complete list of all computer labs in the university will be displayed here")
                    .font(.subheadline)
                    .foregroundColor(.secondaryGray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top, 5)
                
                Spacer()
            }
            .navigationTitle("Labs")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing: Button("Done") {
                    dismiss()
                }
            )
        }
    }
}

#Preview {
    PlaceholderView(title: "Sample Page")
}
