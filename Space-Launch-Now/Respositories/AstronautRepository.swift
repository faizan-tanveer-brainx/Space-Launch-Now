//
//  AstronautRepository.swift
//  Space-Launch-Now
//
//  Created by EAPPLE on 19/05/2023.
//

import Foundation

class AstronautRepository: Codable {
    
    // MARK: - Instance Properties
    
    var astronautList = [Astronaut]()
    
    // MARK: - Enums
    
    enum CodingKeys: String, CodingKey {
        case astronautList = "results"
    }
    
}
