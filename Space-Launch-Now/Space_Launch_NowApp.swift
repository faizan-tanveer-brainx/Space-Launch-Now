//
//  Space_Launch_NowApp.swift
//  Space-Launch-Now
//
//  Created by EAPPLE on 19/05/2023.
//

import SwiftUI

@main
struct Space_Launch_NowApp: App {
    
    @StateObject
    private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
