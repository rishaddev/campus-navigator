//
//  DiningView.swift
//  campusNavigationApp
//
//  Created by Rishad 009 on 2025-06-11.
//

import SwiftUI

struct DiningView: View {
    var body: some View {
        VStack {
            Text("Dining")
                .font(.largeTitle)
                .padding()
            
            Text("Dining content will go here")
                .foregroundColor(.gray)
        }
        .navigationTitle("Dining")
        .navigationBarTitleDisplayMode(.large)
    }
}
