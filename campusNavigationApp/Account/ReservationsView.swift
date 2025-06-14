import SwiftUI

struct ReservationsView: View {
    @State private var searchText = ""
    
    let reservations = [
        Reservation(id: 1, name: "Code Camp", location: "Jubilee Hall", date:"06 June 2025 | 10:00 AM Onwards", imageName: "Code-Camp"),
        Reservation(id: 2, name: "Code Camp", location: "Jubilee Hall", date:"06 June 2025 | 10:00 AM Onwards", imageName: "Code-Camp"),
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Tickets & Reservations")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.vertical, 20)
                .foregroundColor(.primaryGreen)
            
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(reservations) { reservation in
                        ReservationRowView(reservation: reservation)
                            .buttonStyle(PlainButtonStyle())
                        
                        if reservation.id != reservations.last?.id {
                            Divider()
                                .padding(.leading, 80)
                        }
                    }
                }
            }
            
            Spacer()
        }
        .navigationTitle("Tickets & Reservations")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
    }
}

struct Reservation: Identifiable {
    let id: Int
    let name: String
    let location: String
    let date: String
    let imageName: String
}

struct ReservationRowView: View {
    let reservation: Reservation
    
    var body: some View {
        HStack(spacing: 15) {
            Image(reservation.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.1))
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(reservation.name)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.primaryGreen)
                
                Text(reservation.date)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(.horizontal) 
        .padding(.vertical, 12)
        .contentShape(Rectangle())
    }
}

#Preview {
    ReservationsView()
}
