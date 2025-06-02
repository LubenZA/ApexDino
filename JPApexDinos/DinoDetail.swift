//
//  DinoDetail.swift
//  JPApexDinos
//
//  Created by Luben Ivanchev on 2025/05/26.
//

import SwiftUI

struct DinoDetail: View {
    let dino: ApexDino
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    // bg image
                    Image(dino.type.rawValue)
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            LinearGradient(stops: [Gradient.Stop(color: .clear, location: 0.8), Gradient.Stop(color: .black, location: 1)], startPoint: .top, endPoint: .bottom)
                        }
                    //dino image
                    Image(dino.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1.5, height: geo.size.height/3.7)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y: 20)
                }
                
                VStack(alignment: .leading) {
                    //dino name
                    Text(dino.name)
                        .font(.largeTitle)
                    
                    //location

                    
                    //appears in
                    Text("Appears In:")
                        .font(.title3)
                    
                    ForEach(dino.movies, id: \.self) { movie in
                        Text("•" + movie)
                            .font(.subheadline)
                        
                    }
                    
                    //movie
                    Text("Movie Moments")
                        .font(.title)
                        .padding(.top, 15)
                    
                    ForEach(dino.movieScenes) { scene in
                        Text(scene.movie)
                            .font(.title2)
                            .padding(.vertical, 1)
                        
                        Text(scene.sceneDescription)
                            .padding(.bottom, 15)
                        
                        Text("Read More:")
                            .font(.caption)
                        
                        Link(dino.link, destination: URL(string: dino.link)!)
                            .font(.caption)
                            .foregroundStyle(.blue)
                    }
                    
                    //link
                    
                }
                .padding()
                .frame(width: geo.size.width, alignment: .leading)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    DinoDetail(dino: Dinosaurs().apexDinos[7])
        .preferredColorScheme(.dark)
}
