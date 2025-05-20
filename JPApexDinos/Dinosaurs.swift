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
    
    func search(for searchText: String) -> [ApexDino] {
        if searchText.isEmpty {
            return apexDinos
        } else {
            return apexDinos.filter {
                dino in
                dino.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    func sort(by alphabetical: Bool) {
        apexDinos.sort {
            dino1, dino2 in
            if alphabetical {
                dino1.name < dino2.name
            } else {
                dino1.id < dino2.id
            }
        }
    }
    
    func filter(by type: ADType) {
        if type == .all {
            
        } else {
            apexDinos = apexDinos.filter { dino in
                dino.type == type
            }
        }
    }
}
