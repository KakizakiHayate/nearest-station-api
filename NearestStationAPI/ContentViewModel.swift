//
//  ContentViewModel.swift
//  NearestStationAPI
//
//  Created by 柿崎逸 on 2023/11/11.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published private(set) var stations = [Station]()
}

extension ContentViewModel {
    @MainActor
    func fetchAPI(lat: String, lon: String) async {
        guard let baseURL = URL(string: "https://express.heartrails.com/api/json?method=getStations&x=\(lat)&y=\(lon)") else { return
        }
        let request = URLRequest(url: baseURL)

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                print("HTTPURLResponse::::: キャストエラー")
                return
            }
            guard (200...299).contains(response.statusCode) else {
                print("Response status code does not indicate success::::: \(response.statusCode)")
                return
            }
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(StationAPI.self, from: data)
            self.stations = decodedResponse.response.station
        } catch {
            print(error)
        }
    }
}
