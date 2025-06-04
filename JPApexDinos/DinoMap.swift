//
//  DinoMap.swift
//  JPApexDinos
//
//  Created by Luben Ivanchev on 2025/06/04.
//

import SwiftUI
import MapKit

struct DinoMap: View {
    let dinos = Dinosaurs()
    
    
    @State var position: MapCameraPosition
    @State var satellite = false
    
    var body: some View {
        Map(position: $position) {
            ForEach(dinos.apexDinos) { dino in
                Annotation(dino.name, coordinate: dino.location) {
                    Image(dino.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .shadow(color: .white, radius: 3)
                        .scaleEffect(x: -1)
                }
            }
        }
        .mapStyle(satellite ? .imagery(elevation: .realistic) : .standard(elevation: .realistic))
        .overlay(alignment: .bottomTrailing) {
            Button {
                satellite.toggle()
            } label: {
                Image(systemName: satellite ? "globe.americas.fill" : "globe.americas")
                    .font(.largeTitle)
                    .imageScale(.large)
                    .padding(5)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 5))
                    .shadow(radius: 5)
                    .padding()
            }
        }
        .toolbarBackground(.automatic)
    }
}

#Preview {
    DinoMap(position: .camera(MapCamera(centerCoordinate: Dinosaurs().apexDinos[2].location, distance: 1000, heading: 250, pitch: 80)))
        .preferredColorScheme(.dark)
}
