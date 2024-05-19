//
//  UpcomingMovies.swift
//  UpcomingMovieTracker
//
//  Created by Ömer Bayrak on 14.05.2024.
//

class UpcomingMovies: APIService<APIServiceParameters<Movie>, Movie> {
     init() {
        super.init(parameters: .init(endPoint: "movie/upcoming"))
    }
}
