//
//  AstronautDetail.swift
//  Space-Launch-Now
//
//  Created by EAPPLE on 19/05/2023.
//

import SwiftUI

struct AstronautDetail: View {
    
    var astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    
                    let url = URL(string: astronaut.profileImageThumbnailURL)!
                    AsyncImage(url: url) { image in
                        SquareImage(image: image)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    VStack(alignment: .leading) {
                        Text(astronaut.name)
                            .font(.headline)
                        Text(astronaut.nationality)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("Born: \(astronaut.birthday)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                }
                
                Divider()
                
                Text("About:\n")
                    .font(.title2)
                Text(astronaut.bio)
            }
            .padding()
        }
    }
}

struct AstronautDetail_Previews: PreviewProvider {
    
    static var previews: some View {
        AstronautDetail(astronaut: ModelData().astronautList[0])
    }
}
