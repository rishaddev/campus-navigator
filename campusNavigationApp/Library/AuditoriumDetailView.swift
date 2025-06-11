//
//  AuditoriumDetailView.swift
//  campusNavigationApp
//
//  Created by Rishad 009 on 2025-06-11.
//

import SwiftUI

struct AuditoriumDetailView: View {
    var body: some View {
        VStack {
            Text("Main Auditorium")
                .font(.largeTitle)
                .padding()
            
            Text("Main auditorium details will go here")
                .foregroundColor(.gray)
        }
        .navigationTitle("Main Auditorium")
        .navigationBarTitleDisplayMode(.large)
    }
}
