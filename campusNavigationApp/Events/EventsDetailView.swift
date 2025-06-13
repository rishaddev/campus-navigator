import SwiftUI

struct EventDetailView: View {
    let event: Event
    @State private var participantName = ""
    @State private var contactNumber = ""
    @State private var index = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(event.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top, 20)
                        .foregroundColor(.primaryGreen)
                    
                    Image(event.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Date & Time")
                            .font(.subheadline)
                            .foregroundColor(.mediumGreen)
                        
                        Text(event.date)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.primaryGreen)
                    }
                    .padding(.horizontal)
                    
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Venue")
                            .font(.subheadline)
                            .foregroundColor(.mediumGreen)
                        
                        Text(event.location)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.primaryGreen)
                    }
                    .padding(.horizontal)
                    
                    
                    // Description Section
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Description")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eius mod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eius mod tempor incididunt ut labore et dolore magna aliqua.")
                            .font(.body)
                            .lineSpacing(4)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Reserve Seat")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                        
                        VStack(spacing: 0) {
                            HStack {
                                Text("Name")
                                    .font(.body)
                                    .foregroundColor(.primaryGreen)
                                
                                Spacer()
                                
                                TextField("John Abraham", text: $participantName)
                                    .font(.body)
                                    .multilineTextAlignment(.trailing)
                                    .textFieldStyle(PlainTextFieldStyle())
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 16)
                            .background(Color.lightGreen)
                            
                            Divider()
                                .background(Color.gray.opacity(0.3))
                            
                            HStack {
                                Text("Index")
                                    .font(.body)
                                    .foregroundColor(.primaryGreen)
                                
                                Spacer()
                                
                                TextField("bscccomp241p-009", text: $index)
                                    .font(.body)
                                    .multilineTextAlignment(.trailing)
                                    .textFieldStyle(PlainTextFieldStyle())
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 16)
                            .background(Color.lightGreen)
                            
                            Divider()
                                .background(Color.gray.opacity(0.3))
                            
                            HStack {
                                Text("Contact Number")
                                    .font(.body)
                                    .foregroundColor(.primaryGreen)
                                
                                Spacer()
                                
                                TextField("+94 77 211 5701", text: $contactNumber)
                                    .font(.body)
                                    .multilineTextAlignment(.trailing)
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .keyboardType(.phonePad)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 16)
                            .background(Color.lightGreen)
                        }
                        .cornerRadius(8)
                        .padding(.horizontal)
                        
                        // Reserve Button
                        Button(action: {
                            // Reserve seat action
                        }) {
                            Text("Reserve Seat")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(Color.primaryGreen)
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                    }
                    
                    Spacer(minLength: 100)
                }
            }
        }
        .navigationTitle(event.name).foregroundColor(.primaryGreen)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
    }
}

#Preview {
    EventDetailView(event: Event(
        id: 1,
        name: "Code Camp",
        location: "Jubilee Hall",
        date: "06 June 2025 | 10:00 AM Onwards",
        imageName: "Code-Camp"
    ))
}
