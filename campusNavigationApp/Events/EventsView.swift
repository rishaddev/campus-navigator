//
//  EventsView.swift
//  campusNavigationApp
//
//  Created by Rishad 009 on 2025-06-11.
//

import SwiftUI

struct EventsView: View {
    var body: some View {
        VStack {
            Text("Events")
                .font(.largeTitle)
                .padding()
            
            Text("Events content will go here")
                .foregroundColor(.gray)
        }
        .navigationTitle("Events")
        .navigationBarTitleDisplayMode(.large)
    }
}

