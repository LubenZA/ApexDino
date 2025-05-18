//
//  Dinosaurs.swift
//  JPApexDinos
//
//  Created by Luben Ivanchev on 2025/05/18.
//

import Foundation

class Dinosaurs {
    var apexDinos: [ApexDino] = []
    
    init() {
        decodeDinoData()
    }
    
    func decodeDinoData() {
        if let url = Bundle.main.url(forResource: "jpapexdinos", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexDinos = try decoder.decode([ApexDino].self, from: data)
            } catch {
                print("Error reading json file: \(error)")
            }
        }
    }
}
