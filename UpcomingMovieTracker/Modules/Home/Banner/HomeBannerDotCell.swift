//
//  HomeBannerCell.swift
//  UpcomingMovieTracker
//
//  Created by Ömer Bayrak on 12.05.2024.
//

import UIKit


class HomeBannerDotCell: UICollectionViewCell {
    
    
    @IBOutlet weak var dotImage: UIImageView!
    
    func configure(isActive: Bool, dotSize: Int) {
        
        let newDotSize: Int = Int( !isActive ? Double(dotSize) * 0.75 : Double(dotSize))
        
        dotImage.image = UIImage(systemName: "moonphase.full.moon.inverse")?.imageResized(to: CGSize(width: newDotSize, height: newDotSize))
        
        if isActive {
            dotImage.image = dotImage.image?.withTintColor(.red)
        }
        
        
    
        
    }
    
    
}

