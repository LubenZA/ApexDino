//
//  ContentView.swift
//  JPApexDinos
//
//  Created by Luben Ivanchev on 2025/05/11.
//

import SwiftUI
import MapKit

struct ContentView: View {
    let dino = Dinosaurs()
    
    @State var searchText = ""
    @State var alphabetical = false
    @State var currentSelection = ADType.all
    
    var filteredDinos: [ApexDino] {
        dino.filter(by: currentSelection)
        dino.sort(by: alphabetical)
        
        return dino.search(for: searchText)
    }
    
    var body: some View {
        NavigationStack {
            List(filteredDinos) { dino in
                NavigationLink {
                    DinoDetail(dino: dino, position: .camera(
                        MapCamera(
                            centerCoordinate: dino.location,
                            distance: 30000
                        )))
                } label: {
                    HStack {
                        Image(dino.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .shadow(color: .white, radius: 2)
                        
                        VStack(alignment: .leading) {
                            Text(dino.name)
                                .fontWeight(.bold)
                            
                            Text(dino.type.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 5)
                                .background(dino.type.background)
                                .clipShape(.capsule)
                        }
                        .padding(.leading, 5)
                    }
                }
            }
            .navigationTitle("Apex Dinosaurs")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            alphabetical.toggle()
                        }
                    } label: {
                        Image(systemName: alphabetical ? "film" : "textformat")
                            .symbolEffect(.bounce, value: alphabetical)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $currentSelection.animation()) {
                            ForEach(ADType.allCases) { type in
                                Label(type.rawValue.capitalized, systemImage: type.icon)
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
