//
//  ParkingDetailView.swift
//  campusNavigationApp
//
//  Created by Rishad 009 on 2025-06-11.
//

import SwiftUI

struct ParkingDetailView: View {
    var body: some View {
        VStack {
            Text("Main Parking")
                .font(.largeTitle)
                .padding()
            
            Text("Main parking details will go here")
                .foregroundColor(.gray)
        }
        .navigationTitle("Main Parking")
        .navigationBarTitleDisplayMode(.large)
    }
}


