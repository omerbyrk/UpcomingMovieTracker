//
//  HomeBannerCell.swift
//  UpcomingMovieTracker
//
//  Created by Ömer Bayrak on 12.05.2024.
//

import UIKit

class HomeBannerCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImage: UIImageView!
    var posterPath: String = ""
    
    func configure(posterPath: String){
        self.posterPath = posterPath
        posterImage.loadFromInternet(url: URL(string: posterPath)!)
        posterImage.layer.cornerRadius = 10
    }
}
