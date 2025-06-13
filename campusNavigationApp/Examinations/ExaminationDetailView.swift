import SwiftUI

struct ExaminationDetailView: View {
    let examination: Examination
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                
                VStack(alignment: .leading, spacing: 20) {
                    // Title
                    Text(examination.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top, 20)
                    
                    // Date & Time Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Date & Time")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text(examination.hours)
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    .padding(.horizontal)
                    
                    // Venue Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Venue")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text(examination.location)
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    .padding(.horizontal)
                    
                    // Navigate Button
                    Button(action: {
                        // Navigation action
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
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    // Description Section
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Description")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eius mod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eius mod tempor incididunt ut labore et dolore magna aliqua.")
                            .font(.body)
                            .lineSpacing(4)
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    // Terms & Condition Section
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Terms & Condition")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            HStack(alignment: .top) {
                                Text("1.")
                                    .font(.body)
                                    .fontWeight(.medium)
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eius mod tempor incididunt ut labore et dolore magna")
                                    .font(.body)
                                    .lineSpacing(2)
                            }
                            
                            HStack(alignment: .top) {
                                Text("2.")
                                    .font(.body)
                                    .fontWeight(.medium)
                                Text("liqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eius mod tempor incididunt ut labore et dolore magna aliqua")
                                    .font(.body)
                                    .lineSpacing(2)
                            }
                            
                            HStack(alignment: .top) {
                                Text("3.")
                                    .font(.body)
                                    .fontWeight(.medium)
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eius mod tempor incididunt ut labore et dolore magna")
                                    .font(.body)
                                    .lineSpacing(2)
                            }
                            
                            HStack(alignment: .top) {
                                Text("4.")
                                    .font(.body)
                                    .fontWeight(.medium)
                                Text("liqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eius mod tempor incididunt ut labore et dolore magna aliqua.")
                                    .font(.body)
                                    .lineSpacing(2)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    Spacer(minLength: 100)
                }
            }
        }
        .navigationTitle(examination.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
        
    }
}

//#Preview {
//    NavigationView {
//        ExaminationDetailView(examination: Examination(
//            id: 1,
//            name: "Web Application Development",
//            location: "Hall 24",
//            hours: "06 June 2025 | 09:00 AM - 12:00 PM"
//        ))
//    }
//}
