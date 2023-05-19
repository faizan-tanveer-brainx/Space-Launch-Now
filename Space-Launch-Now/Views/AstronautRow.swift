//
//  AstronautRow.swift
//  Space-Launch-Now
//
//  Created by EAPPLE on 19/05/2023.
//

import SwiftUI

struct AstronautRow: View {
   
    var astronaut: Astronaut
    
    var body: some View {
        HStack(alignment: .bottom) {
            
            let url = URL(string: astronaut.profileImageThumbnailURL)!
            AsyncImage(url: url) { image in
                
                image
                    .resizable()
                    .frame(width: 50, height: 50)
                
            } placeholder: {
                ProgressView()
            }
         
            VStack(alignment: .leading) {
                Text(astronaut.name)
                    .font(.headline)
                Text(astronaut.nationality)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding()
    }
    
}

struct AstronautRow_Previews: PreviewProvider {
    
    static var astronauts = ModelData().astronautList
    
    static var previews: some View {
        AstronautRow(astronaut: astronauts[0])
            .previewLayout(.fixed(width: 300, height: 70))
            .environmentObject(ModelData())
    }
}
