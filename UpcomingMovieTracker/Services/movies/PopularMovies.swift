//
//  PopularMovies.swift
//  UpcomingVideoTracker
//
//  Created by Ömer Bayrak on 11.05.2024.
//

import Foundation

class PopularMovies: APIService<APIServiceParameters<Movie>, Movie> {
     init() {
        super.init(parameters: .init(endPoint: "movie/popular"))
    }
}
