import SwiftUI

struct SchedulePageView: View {
    @State private var searchText = ""
    
    let schedules = [
        Schedule(id:1, name: "iOS Application Development", location: "Hall 10", hours: "8:00 AM - 9:00 AM", lecturer: "Mr. John"),
        Schedule(id:2, name: "Software Engineering", location: "Hall 12", hours: "9:00 AM - 10:00 AM", lecturer: "Mr. John"),
        Schedule(id:3, name: "Database Management", location: "Lab 2", hours: "10:00 AM - 11:00 AM", lecturer: "Mr. John"),
        Schedule(id:4, name: "Web Development",  location: "Lab 1",hours: "11:00 AM - 12:00 PM", lecturer: "Mr. John"),
        Schedule(id:5, name: "Mobile App Development", location: "Hall 5", hours: "1:00 PM - 2:00 PM", lecturer: "Mr. John"),
        Schedule(id:6, name: "Software Testing", location: "Lab 3", hours: "2:00 PM - 3:00 PM", lecturer: "Mr. John"),
        Schedule(id:7, name: "System Analysis", location: "Hall 2", hours: "3:00 PM - 4:00 PM", lecturer: "Mr. John")
    ]
    
    var filteredSchedules: [Schedule] {
        if searchText.isEmpty {
            return schedules
        } else {
            return schedules.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.secondaryGray)
                        TextField("Find schedules...", text: $searchText)
                            .textFieldStyle(PlainTextFieldStyle())
                        
                        if !searchText.isEmpty {
                            Button(action: {
                                searchText = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color.backgroundGray)
                    .cornerRadius(8)
                }
                .padding()
                
                
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(filteredSchedules) { schedule in
                            NavigationLink(destination: ScheduleDetailView(schedule: schedule)) {
                                ScheduleRowView(schedule: schedule)
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            if schedule.id != filteredSchedules.last?.id {
                                Divider()
                                    .padding(.leading, 90)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
            .navigationTitle("Schedule")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct Schedule: Identifiable {
    let id: Int
    let name: String
    let location: String
    let hours: String
    let lecturer: String
}

struct ScheduleRowView: View {
    let schedule: Schedule
    
    var body: some View {
        HStack(spacing: 15) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(red: 0.93, green: 0.97, blue: 0.96))
                    .frame(width: 75, height: 75)
                
                VStack(spacing: 12) {
                    Image(systemName: "text.book.closed")
                        .font(.system(size: 25))
                        .foregroundColor(Color(red: 0.35, green: 0.64, blue: 0.58))
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(schedule.name)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.primaryGreen)
                
                Text(schedule.hours)
                    .font(.caption)
                    .foregroundColor(.primaryGreen)
                
                Text(schedule.location)
                    .font(.caption)
                    .foregroundColor(.mediumGreen)
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
    SchedulePageView()
}
