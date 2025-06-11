//
//  CafeteriaDetailView.swift
//  campusNavigationApp
//
//  Created by Rishad 009 on 2025-06-11.
//

import SwiftUI

struct CafeteriaDetailView: View {
    var body: some View {
        VStack {
            Text("Main Cafeteria")
                .font(.largeTitle)
                .padding()
            
            Text("Main cafeteria details will go here")
                .foregroundColor(.gray)
        }
        .navigationTitle("Main Cafeteria")
        .navigationBarTitleDisplayMode(.large)
    }
}
