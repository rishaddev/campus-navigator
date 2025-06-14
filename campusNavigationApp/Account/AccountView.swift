import SwiftUI

struct AccountView: View {
    @State private var showTicketsReservations = false
    @State private var showFavorites = false
    
    @State private var name = "John Abraham"
    @State private var email = "johnabraham@student.campus.com"
    @State private var contactNumber = "+94 77 211 5701"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    VStack(spacing: 1) {
                        // Profile Image
                        Image("user")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .padding(.bottom, 16)
                        
                        Text(name)
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(.black)
                        
                        Text(email)
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 20)
                    
                    // Personal Information Section
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Personal Information")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.primaryGreen)
                            .padding(.horizontal, 20)
                        
                        VStack(spacing: 0) {
                            EditableInfoRow(label: "Name", value: $name)
                            
                            Divider()
                                .padding(.horizontal, 20)
                            
                            EditableInfoRow(label: "Email", value: $email)
                            
                            Divider()
                                .padding(.horizontal, 20)
                            
                            EditableInfoRow(label: "Contact Number", value: $contactNumber)
                        }
                        .background(Color.lightGreen.opacity(0.5))
                        .cornerRadius(12)
                        .padding(.horizontal, 20)
                    }
                    
                    // Action Buttons
                    VStack(spacing: 0) {
                        NavigationLink(destination: ReservationsView()) {
                            HStack(spacing: 12) {
                                Image(systemName: "ticket")
                                    .font(.system(size: 18))
                                    .foregroundColor(.gray)
                                    .frame(width: 24)
                                
                                Text("Tickets & Reservations")
                                    .font(.system(size: 16))
                                    .foregroundColor(.primaryGreen)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.gray)
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 16)
                            .background(Color.lightGreen.opacity(0.5))
                            .cornerRadius(12)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer(minLength: 100)
                }
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

struct EditableInfoRow: View {
    let label: String
    @Binding var value: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.system(size: 16))
                .foregroundColor(.gray)
                .frame(width: 120, alignment: .leading)
            
            Spacer()
            
            TextField("", text: $value)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.primaryGreen)
                .multilineTextAlignment(.trailing)
                .textFieldStyle(PlainTextFieldStyle())
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
    }
}


#Preview {
    AccountView()
}
