//
//  ApexDino.swift
//  JPApexDinos
//
//  Created by Luben Ivanchev on 2025/05/11.
//
import SwiftUI

struct ApexDino: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: ADType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    struct MovieScene: Decodable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
    
    enum ADType: String, Decodable {
        case air
        case land
        case sea
        
        var background: Color {
            switch self {
                case .air:
                    .teal
                case .land:
                    .brown
                case .sea:
                    .blue
            }
        }
    }
}
