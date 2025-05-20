//
//  ContentView.swift
//  JPApexDinos
//
//  Created by Luben Ivanchev on 2025/05/11.
//

import SwiftUI

struct ContentView: View {
    let dinos = Dinosaurs()
    
    var body: some View {
        List(dinos.apexDinos) { dinos in
            HStack {
                Image(dinos.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .shadow(color: .white, radius: 2)
                
                VStack(alignment: .leading) {
                    Text(dinos.name)
                        .fontWeight(.bold)
                    
                    Text(dinos.type.rawValue.capitalized)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 13)
                        .padding(.vertical, 5)
                        .background(dinos.type.background)
                        .clipShape(.capsule)
                }
                .padding(.leading, 5)
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
