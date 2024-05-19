//
//  TMDBResponse.swift
//  UpcomingVideoTracker
//
//  Created by Ömer Bayrak on 11.05.2024.
//

import Foundation

struct TMDBListResponse<M: Codable>: Codable {
    let page: Int
    let results: [M]
    let totalPages: Int
    let totalResults: Int
}
