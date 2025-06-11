//
//  LibraryDetailView.swift
//  campusNavigationApp
//
//  Created by Rishad 009 on 2025-06-11.
//

import SwiftUI

struct LibraryDetailView: View {
    var body: some View {
        VStack {
            Text("Main Library")
                .font(.largeTitle)
                .padding()
            
            Text("Main library details will go here")
                .foregroundColor(.gray)
        }
        .navigationTitle("Main Library")
        .navigationBarTitleDisplayMode(.large)
    }
}
