import SwiftUI

struct SchedulePageView: View {
    @State private var showScheduleInfo = false
    @State private var selectedSchedule: ScheduleItem?
    
    let scheduleItems = [
        ScheduleItem(title: "iOS Application Development", time: "8:00 AM - 9:00 AM", location: "Hall 10"),
        ScheduleItem(title: "Software Engineering", time: "9:00 AM - 10:00 AM", location: "Hall 12"),
        ScheduleItem(title: "Database Management", time: "10:00 AM - 11:00 AM", location: "Lab 2"),
        ScheduleItem(title: "Web Development", time: "11:00 AM - 12:00 PM", location: "Lab 1"),
        ScheduleItem(title: "Mobile App Development", time: "1:00 PM - 2:00 PM", location: "Hall 5"),
        ScheduleItem(title: "Software Testing", time: "2:00 PM - 3:00 PM", location: "Lab 3"),
        ScheduleItem(title: "System Analysis", time: "3:00 PM - 4:00 PM", location: "Hall 2")
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                // Header with search
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.secondaryGray)
                        Text("Find a schedule...")
                            .foregroundColor(.secondaryGray)
                        Spacer()
                    }
                    .padding()
                    .background(Color.backgroundGray)
                    .cornerRadius(8)
                }
                .padding()
                
                // Schedule List
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(scheduleItems) { item in
                            ScheduleCard(item: item) {
                                selectedSchedule = item
                                showScheduleInfo = true
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 100)
                }
            }
            .navigationTitle("Schedule")
            .navigationBarTitleDisplayMode(.large)
        }
        .sheet(isPresented: $showScheduleInfo) {
            if let schedule = selectedSchedule {
                ScheduleInfoView(schedule: schedule)
            }
        }
    }
}

struct ScheduleItem: Identifiable {
    let id = UUID()
    let title: String
    let time: String
    let location: String
}

struct ScheduleCard: View {
    let item: ScheduleItem
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                // Time indicator
                Rectangle()
                    .fill(Color.primaryGreen)
                    .frame(width: 4)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(item.title)
                        .font(.headline)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    
                    HStack {
                        Image(systemName: "clock")
                            .font(.caption)
                            .foregroundColor(.secondaryGray)
                        Text(item.time)
                            .font(.caption)
                            .foregroundColor(.secondaryGray)
                    }
                    
                    HStack {
                        Image(systemName: "location")
                            .font(.caption)
                            .foregroundColor(.secondaryGray)
                        Text(item.location)
                            .font(.caption)
                            .foregroundColor(.secondaryGray)
                    }
                }
                
                Spacer()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
        }
    }
}

#Preview {
    SchedulePageView()
}
