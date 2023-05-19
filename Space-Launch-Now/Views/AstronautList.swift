//
//  AstronautList.swift
//  Space-Launch-Now
//
//  Created by EAPPLE on 19/05/2023.
//

import SwiftUI

struct AstronautList: View {
    
    @EnvironmentObject
    private var modelData: ModelData
    
    @State
    private var dataLoaded = false
    
    @State
    private var errorOccured = false
    
    @State
    private var showSorted = false
    
    @State
    private var buttonText = "Sort"
    
    
    private var sortedData: [Astronaut] {
        modelData.astronautList.sorted(by: { ($0.name < $1.name) && showSorted })
    }
    
    var body: some View {
        NavigationStack {
            if dataLoaded {
                List {
                    
                    Button(action: {
                        showSorted = true
                        buttonText = "Sorted"
                    }, label: {
                        Text(buttonText)
                    })
                    .opacity(showSorted ? 0.5 : 1.0)
                    .disabled(showSorted)
    
                    
                    ForEach(sortedData) { astronaut in
                        NavigationLink {
                            AstronautDetail(astronaut: astronaut)
                        } label: {
                            AstronautRow(astronaut: astronaut)
                        }
                    }
                }
                .navigationTitle("Astronauts")
                .navigationBarTitleDisplayMode(.inline)
            } else {
                ProgressView()
            }
        }
        .onAppear {
            fetchAstronautList()
        }
        .alert(isPresented: $errorOccured) {
            Alert(
                title: Text("Error"),
                message: Text("No Response from Server\n try again later"),
                dismissButton: .default(Text("Ok"))
            )
        }
    }
    
    func fetchAstronautList() {
        
        let urlString = AppConstants.Endpoints.astronautList
        
        APIManager.performGetRequest(
            urlString: urlString,
            success: { data in
                
                let decoder = JSONDecoder()
                
                guard let astronautRepository = try? decoder.decode(AstronautRepository.self, from: data) else {
                    return
                }
                
                self.dataLoaded = true
                self.modelData.astronautList = astronautRepository.astronautList
                
            },
            failure: { _ in
                self.errorOccured = true
            }
        )
        
    }
    
}

struct AstronautList_Previews: PreviewProvider {
    static var previews: some View {
        AstronautList()
            .environmentObject(ModelData())
    }
}
