//
//  Astronaut.swift
//  Space-Launch-Now
//
//  Created by EAPPLE on 19/05/2023.
//

import Foundation
import SwiftUI

struct Astronaut: Codable, Identifiable {
    
    // MARK: - Instance Properties
    var id: Int
    var name: String
    var nationality: String
    var birthday: String
    var bio: String
    var profileImageThumbnailURL: String
    var profileImageURL: String
    
    // MARK: - Enums
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case nationality
        case bio
        case birthday = "date_of_birth"
        case profileImageURL = "profile_image"
        case profileImageThumbnailURL = "profile_image_thumbnail"
    }
    
}
