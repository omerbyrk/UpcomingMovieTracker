//
//  NowPlayingMovies.swift
//  UpcomingMovieTracker
//
//  Created by Ömer Bayrak on 14.05.2024.
//

class NowPlayingMovies: APIService<APIServiceParameters<Movie>, Movie> {
     init() {
        super.init(parameters: .init(endPoint: "movie/now_playing"))
    }
}
