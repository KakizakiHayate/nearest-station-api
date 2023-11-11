//
//  ContentView.swift
//  NearestStationAPI
//
//  Created by 柿崎逸 on 2023/11/11.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var contentViewModel = ContentViewModel()
    var body: some View {
        VStack {
            List(contentViewModel.stations) {
                Text("\($0.name)")
            }
        }.padding()
        .onAppear {
            Task {
                await contentViewModel.fetchAPI(lat: "139.9342237591793",
                                                lon: "35.83270107269758")
            }
        }
    }
}

#Preview {
    ContentView()
}

#Preview {
    ContentView()
}
