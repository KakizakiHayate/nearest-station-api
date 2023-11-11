//
//  Station.swift
//  NearestStationAPI
//
//  Created by 柿崎逸 on 2023/11/11.
//

import Foundation

// MARK: - Station
struct Station: Decodable, Identifiable {
    var id = UUID()
    let name: String
    let prefecture: String
    let line: String
    let x: Double
    let y: Double
    let postal: String
    let distance: String
    let prev: String
    let next: String

    enum CodingKeys: String, CodingKey {
        case name
        case prefecture
        case line
        case x
        case y
        case postal
        case distance
        case prev
        case next
    }
}
