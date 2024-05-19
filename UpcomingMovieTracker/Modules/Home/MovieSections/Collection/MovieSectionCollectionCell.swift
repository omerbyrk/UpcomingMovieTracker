//
//  MovieSectionCell.swift
//  UpcomingMovieTracker
//
//  Created by Ömer Bayrak on 14.05.2024.
//

import UIKit


class MovieSectionCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var footerField: UIView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var titleField: UIView!
    @IBOutlet weak var heartField: UIView!
    var movie: Movie?
    var titleGradientLayer: CAGradientLayer?

    func configure(movie: Movie) {
        self.movie = movie
        posterImage.loadFromInternet(url: URL(string: movie.fullPosterPath)!)
        posterImage.layer.cornerRadius = 10
        heartField.layer.cornerRadius = 7.5
        title.text = movie.title
        addGradientToTitleField()
        addVote()
        addVoteCount()
    }
    
    func addVote() {
        if let starRate = footerField.viewWithTag(101) {
            starRate.removeFromSuperview()
        }
        
        let starRate = SwiftyStarRatingView(frame: .init(x: 8, y: 0, width: 80, height: 20))
        
        starRate.tag = 101
        starRate.tintColor = .red
        starRate.value = CGFloat(movie!.voteAverage / 2)
        starRate.isEnabled = false

        footerField.insertSubview(starRate, at: 0)
    }
    
    func addVoteCount() {
        
        if let label = footerField.viewWithTag(100) {
            label.removeFromSuperview()
        }

        let label = UILabel(frame: .init(x: 92, y: 0, width: 50, height: 20))
        label.text = movie!.voteCount >= 1000 ?  "(\(movie!.voteCount / 1000)K)" : "(\(movie!.voteCount))"
        label.textColor = .red
        label.tag = 100
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        footerField.insertSubview(label, at: 1)
       

    }
    
    func addGradientToTitleField() {
        // Create a new gradient layer
        if titleGradientLayer == nil {
            titleGradientLayer = CAGradientLayer()
            
            // Set the colors and locations for the gradient layer
            titleGradientLayer!.colors = [UIColor.black.withAlphaComponent(0.01).cgColor, UIColor.black.withAlphaComponent(0.55).cgColor]
            titleGradientLayer!.locations = [0.0, 0.8, 1.0]
            
            // Set the start and end points for the gradient layer
            titleGradientLayer!.startPoint = CGPoint(x: 0.0, y: 0.0)
            titleGradientLayer!.endPoint = CGPoint(x: 0.0, y: 1.0)
            
            // Set the frame to the layer
            titleGradientLayer!.frame = titleField.bounds
            
            titleField.layer.insertSublayer(titleGradientLayer!, at: 0)

        }
    }

}
