//
//  APIServiceParameter.swift
//  UpcomingVideoTracker
//
//  Created by Ömer Bayrak on 11.05.2024.
//

import Foundation

class APIServiceParameters<T: Codable> {
    var endPoint: String
    
    init(endPoint: String) {
        self.endPoint = endPoint
    }
}
