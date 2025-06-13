import SwiftUI

struct ParkingDetailView: View {
    let parking: Parking
    @State private var selectedVehicleType = "Car"
    @State private var vehicleNumber = ""
    @State private var contactNumber = ""
    @State private var selectedDate = Date()
    @State private var showingDatePicker = false
    @State private var showNavigationPopup = false
    
    let vehicleTypes = ["Car", "Bike"]
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(parking.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top, 20)
                    
                    
                    HStack(spacing: 12) {
                        Button(action: {
                        }) {
                            HStack {
                                Image(systemName: "phone.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                Text("Call")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Color.primaryGreen)
                            .cornerRadius(8)
                        }
                        
                        Button(action: {
                            showNavigationPopup = true
                        }) {
                            HStack {
                                Image(systemName: "location.north.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                Text("Navigate")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Color.primaryGreen)
                            .cornerRadius(8)
                        }
                        
                        Button(action: {
                            
                        }) {
                            HStack {
                                Image(systemName: "ellipsis")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                Text("More")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Color.primaryGreen)
                            .cornerRadius(8)
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    HStack {
                        Text("Hours")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text(parking.hours)
                            .font(.body)
                            .fontWeight(.medium)
                    }
                    .padding(.horizontal)
                    
                    
                    VStack(spacing: 20) {
                        HStack {
                            Text("Today")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Button(action: {
                                showingDatePicker.toggle()
                            }) {
                                HStack {
                                    Text(dateFormatter.string(from: selectedDate))
                                        .font(.body)
                                        .foregroundColor(.gray)
                                    Image(systemName: "chevron.down")
                                        .font(.system(size: 12))
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        VStack(spacing: 10) {
                            Text("20 Slots Available")
                                .font(.title)
                                .fontWeight(.medium)
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 30)
                    }
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Reserve Parking")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                        
                        VStack(spacing: 0) {
                            HStack {
                                Text("Vehicle Type")
                                    .font(.body)
                                    .foregroundColor(.gray)
                                
                                Spacer()
                                
                                Menu {
                                    ForEach(vehicleTypes, id: \.self) { type in
                                        Button(type) {
                                            selectedVehicleType = type
                                        }
                                    }
                                } label: {
                                    HStack {
                                        Text(selectedVehicleType)
                                            .font(.body)
                                            .foregroundColor(.primary)
                                        Image(systemName: "chevron.down")
                                            .font(.system(size: 12))
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 16)
                            .background(Color.gray.opacity(0.1))
                            
                            Divider()
                                .background(Color.gray.opacity(0.3))
                            
                            HStack {
                                Text("Vehicle Number")
                                    .font(.body)
                                    .foregroundColor(.gray)
                                
                                Spacer()
                                
                                TextField("CAB - 1234", text: $vehicleNumber)
                                    .font(.body)
                                    .multilineTextAlignment(.trailing)
                                    .textFieldStyle(PlainTextFieldStyle())
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 16)
                            .background(Color.gray.opacity(0.1))
                            
                            Divider()
                                .background(Color.gray.opacity(0.3))
                            
                            HStack {
                                Text("Contact Number")
                                    .font(.body)
                                    .foregroundColor(.gray)
                                
                                Spacer()
                                
                                TextField("+94 77 123 4567", text: $contactNumber)
                                    .font(.body)
                                    .multilineTextAlignment(.trailing)
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .keyboardType(.phonePad)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 16)
                            .background(Color.gray.opacity(0.1))
                        }
                        .cornerRadius(8)
                        .padding(.horizontal)
                        
                        // Reserve Button
                        Button(action: {
                            // Reserve parking action
                        }) {
                            Text("Reserve Parking")
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
                    
                    // Terms & Conditions
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Terms & Conditions")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eius mod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eius mod tempor incididunt ut labore et dolore magna aliqua.")
                            .font(.body)
                            .lineSpacing(4)
                    }
                    .padding(.horizontal)
                    .padding(.top, 30)
                    
                    Spacer(minLength: 100)
                }
            }
        }
        .navigationTitle("Main Parking")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
        .sheet(isPresented: $showingDatePicker) {
            NavigationView {
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())
                    .navigationTitle("Select Date")
                    .navigationBarTitleDisplayMode(.inline)
                    
            }
        }
        
        if showNavigationPopup {
            NavigationPopup(
                isPresented: $showNavigationPopup,
                destination: "Gate No. 01",
                distance: "150m",
                imageName: "Gate-1"
            )
            .animation(.easeInOut(duration: 0.3), value: showNavigationPopup)
        }
    }
}

//#Preview {
//    ParkingDetailView(parking: Parking(
//        id: 1, name: "Main Parking", location: "Ground Floor Harrison Building", contactNumber: "123-456-789", hours:"Open | Closes 04 PM", imageName: "MainParking"
//    ))
//}
