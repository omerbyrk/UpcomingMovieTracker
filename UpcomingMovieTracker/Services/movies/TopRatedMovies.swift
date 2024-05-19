//
//  TopRatedMovies.swift
//  UpcomingMovieTracker
//
//  Created by Ömer Bayrak on 14.05.2024.
//

class TopRatedMovies: APIService<APIServiceParameters<Movie>, Movie> {
     init() {
        super.init(parameters: .init(endPoint: "movie/top_rated"))
    }
}
