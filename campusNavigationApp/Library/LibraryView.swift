//
//  LibraryView.swift
//  campusNavigationApp
//
//  Created by Rishad 009 on 2025-06-11.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        VStack {
            Text("Library")
                .font(.largeTitle)
                .padding()
            
            Text("Library content will go here")
                .foregroundColor(.gray)
        }
        .navigationTitle("Library")
        .navigationBarTitleDisplayMode(.large)
    }
}
