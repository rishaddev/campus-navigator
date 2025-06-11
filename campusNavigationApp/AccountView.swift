import SwiftUI

struct AccountView: View {
    @State private var showTicketsReservations = false
    @State private var showFavorites = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                // Profile Header
                VStack(spacing: 15) {
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.primaryGreen)
                    
                    Text("John Abraham")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("john.abraham@student.campus.com")
                        .font(.subheadline)
                        .foregroundColor(.secondaryGray)
                }
                .padding(.top, 20)
                
                // Personal Information Section
                VStack(alignment: .leading, spacing: 15) {
                    Text("Personal Information")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    VStack(spacing: 12) {
                        InfoRow(label: "Name", value: "John Abraham")
                        InfoRow(label: "Email", value: "john.abraham@student.campus.com")
                        InfoRow(label: "Contact Number", value: "+94 77 231 6701")
                    }
                    .padding(.horizontal)
                }
                
                // Action Buttons
                VStack(spacing: 15) {
                    Button(action: {
                        showTicketsReservations = true
                    }) {
                        HStack {
                            Image(systemName: "ticket.fill")
                            Text("Tickets & Reservations")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.backgroundGray)
                        .cornerRadius(8)
                    }
                    
                    Button(action: {
                        showFavorites = true
                    }) {
                        HStack {
                            Image(systemName: "heart.fill")
                            Text("Favorites")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.backgroundGray)
                        .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationTitle("Account")
            .navigationBarTitleDisplayMode(.large)
        }
        .sheet(isPresented: $showTicketsReservations) {
            PlaceholderView(title: "Tickets & Reservations")
        }
        .sheet(isPresented: $showFavorites) {
            PlaceholderView(title: "Favorites")
        }
    }
}

struct InfoRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.secondaryGray)
            Spacer()
            Text(value)
                .fontWeight(.medium)
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(Color.backgroundGray)
        .cornerRadius(8)
    }
}

#Preview {
    AccountView()
}
