//
//  HomeExtensions.swift
//  UpcomingMovieTracker
//
//  Created by Ömer Bayrak on 14.05.2024.
//

import Foundation

extension MovieSection {
    var title: String {
        switch self {
        case .popular: "Popular"
        case .topRated: "Top Rated"
        case .upcoming: "Upcomings"
        case .nowPlaying: "Now Playing"
        }
    }
}
