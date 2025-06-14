import SwiftUI

struct ExaminationsView: View {
    @State private var searchText = ""
    
    let examinations = [
        Examination(id: 1, name: "PDSA", location: "2nd Floor Harrison Building", hours:"06 June 2025 | 09:00 AM - 12:00 PM"),
        Examination(id: 2, name: "PDSA", location: "2nd Floor Harrison Building", hours:"06 June 2025 | 09:00 AM - 12:00 PM"),
        Examination(id: 3, name: "PDSA", location: "2nd Floor Harrison Building", hours:"06 June 2025 | 09:00 AM - 12:00 PM"),
        Examination(id: 4, name: "PDSA", location: "2nd Floor Harrison Building", hours:"06 June 2025 | 09:00 AM - 12:00 PM")
    ]
    
    var filteredExaminations: [Examination] {
        if searchText.isEmpty {
            return examinations
        } else {
            return examinations.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Examinations")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top, 20)
                .foregroundColor(.primaryGreen)
            
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Find examinations...", text: $searchText)
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
                    ForEach(filteredExaminations) { examination in
                        NavigationLink(destination: ExaminationDetailView(examination: examination)) {
                            ExaminationRowView(examination: examination)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if examination.id != filteredExaminations.last?.id {
                            Divider()
                                .padding(.leading, 90)
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            Spacer()
            
        }
        .navigationTitle("Examinations")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
    }
}

struct Examination: Identifiable {
    let id: Int
    let name: String
    let location: String
    let hours: String
}

struct ExaminationRowView: View {
    let examination: Examination
    
    var body: some View {
        HStack(spacing: 15) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(red: 0.93, green: 0.97, blue: 0.96))
                    .frame(width: 75, height: 75)
                
                VStack(spacing: 12) {
                    Image(systemName: "checklist")
                        .font(.system(size: 25))
                        .foregroundColor(Color(red: 0.35, green: 0.64, blue: 0.58))
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(examination.name)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.primaryGreen)
                
                Text(examination.hours)
                    .font(.caption)
                    .foregroundColor(.mediumGreen)
                
                Text(examination.location)
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

//#Preview {
//    ExaminationsView()
//}
