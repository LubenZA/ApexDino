//
//  ContentView.swift
//  JPApexDinos
//
//  Created by Luben Ivanchev on 2025/05/11.
//

import SwiftUI

struct ContentView: View {
    let dinos = Dinosaurs()
    
    @State var searchText = ""
    @State var alphabetical = false
    @State var currentSelection = ADType.all
    
    var filteredDinos: [ApexDino] {
        dinos.filter(by: currentSelection)
        dinos.sort(by: alphabetical)
        
        return dinos.search(for: searchText)
    }
    
    var body: some View {
        NavigationStack {
            List(filteredDinos) { dinos in
                NavigationLink {
                    Image(dinos.image)
                        .resizable()
                        .scaledToFit()
                } label: {
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
