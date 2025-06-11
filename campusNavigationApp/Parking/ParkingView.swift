//
//  ParkingView.swift
//  campusNavigationApp
//
//  Created by Rishad 009 on 2025-06-11.
//

import SwiftUI

struct ParkingView: View {
    var body: some View {
        VStack {
            Text("Parking")
                .font(.largeTitle)
                .padding()
            
            Text("Parking content will go here")
                .foregroundColor(.gray)
        }
        .navigationTitle("Parking")
        .navigationBarTitleDisplayMode(.large)
    }
}
