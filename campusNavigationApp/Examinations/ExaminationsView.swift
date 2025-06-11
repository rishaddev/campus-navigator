//
//  ExaminationsView.swift
//  campusNavigationApp
//
//  Created by Rishad 009 on 2025-06-11.
//
import SwiftUI

struct ExaminationsView: View {
    var body: some View {
        VStack {
            Text("Examinations")
                .font(.largeTitle)
                .padding()
            
            Text("Examination content will go here")
                .foregroundColor(.gray)
        }
        .navigationTitle("Examinations")
        .navigationBarTitleDisplayMode(.large)
    }
}
