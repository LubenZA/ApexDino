//
//  ApexDino.swift
//  JPApexDinos
//
//  Created by Luben Ivanchev on 2025/05/11.
//

struct ApexDino {
    let id: Int
    let name: String
    let type: String
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    struct MovieScene {
        let id: Int
        let movie: String
        let screanDescription: String
    }
}
