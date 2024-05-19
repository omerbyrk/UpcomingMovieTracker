//
//  Movie.swift
//  UpcomingVideoTracker
//
//  Created by Ömer Bayrak on 11.05.2024.
//


struct Movie: Codable {
    let id: Int
    let title: String
    let backdropPath: String?
    let posterPath: String
    let genreIds: [Int]
    let overview: String
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int

    
    var fullPosterPath: String {
            "\(TMDBAssetBasePath)\(posterPath)"
    }
    
    var fullBackdropPath: String {
        backdropPath != nil ?  "\(TMDBAssetBasePath)\(backdropPath!)" : fullPosterPath
    }
}
