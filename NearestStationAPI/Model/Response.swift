//
//  Response.swift
//  NearestStationAPI
//
//  Created by 柿崎逸 on 2023/11/11.
//

import Foundation

// MARK: - Response
struct Response: Decodable {
    let station: [Station]
}
