//
//  SquareImage.swift
//  Space-Launch-Now
//
//  Created by EAPPLE on 19/05/2023.
//

import SwiftUI

struct SquareImage: View {
    
    var image = Image("default_image")
    
    var body: some View {
        image
            .resizable()
            .frame(width: 50, height: 50)
            .clipShape(RoundedRectangle(cornerRadius: 7.0, style: .circular))
            .overlay {
                RoundedRectangle(cornerRadius: 7.0, style: .circular).stroke(.gray, lineWidth: 2)
            }
            .shadow(radius: 4)
    }
}

struct SquareImage_Previews: PreviewProvider {

    static var previews: some View {
        SquareImage()
    }
}
