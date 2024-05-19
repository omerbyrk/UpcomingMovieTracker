//
//  MovieSectionTableCell.swift
//  UpcomingMovieTracker
//
//  Created by Ömer Bayrak on 14.05.2024.
//

import UIKit

class MovieSectionTableCell: UITableViewCell {
    @IBOutlet weak var movieSectionCollection: MovieSectionCollection!
    
    func configure(movies: [Movie]) {
        movieSectionCollection.configure(movies: movies)
    }

}
