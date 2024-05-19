//
//  DiscoverMovies.swift
//  UpcomingMovieTracker
//
//  Created by Ömer Bayrak on 14.05.2024.
//


class DiscoverMovies: APIService<APIServiceParameters<Movie>, Movie> {
     init() {
        super.init(parameters: .init(endPoint: "discover/movie"))
    }
}
