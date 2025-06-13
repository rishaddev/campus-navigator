import SwiftUI

struct EventsView: View {
    @State private var searchText = ""
    
    let events = [
        Event(id: 1, name: "Code Camp", location: "Jubilee Hall", date:"06 June 2025 | 10:00 AM Onwards", imageName: "Code-Camp"),
    ]
    
    var filteredEvents: [Event] {
        if searchText.isEmpty {
            return events
        } else {
            return events.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Events")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top, 20)
                .foregroundColor(.primaryGreen)
            
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Find events...", text: $searchText)
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
                    ForEach(filteredEvents) { event in
                        NavigationLink(destination: EventDetailView(event: event)) {
                            EventRowView(event: event)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        
                        if event.id != filteredEvents.last?.id {
                            Divider()
                                .padding(.leading, 90)
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .navigationTitle("Events")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
    }
}

struct Event: Identifiable {
    let id: Int
    let name: String
    let location: String
    let date: String
    let imageName: String
}

struct EventRowView: View {
    let event: Event
    
    var body: some View {
        HStack(spacing: 15) {
            Image(event.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.1))
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(event.name)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.primaryGreen)
                
                Text(event.date)
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
    EventsView()
}
