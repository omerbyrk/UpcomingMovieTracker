//
//  HomeBannerDotCollection.swift
//  UpcomingMovieTracker
//
//  Created by Ömer Bayrak on 12.05.2024.
//

import UIKit


class HomeBannerDotCollection: UICollectionView, HomeBannerCollectionDelegate {

    
    
    var homeBannerCollection: HomeBannerCollection?
    
    var totalDots: Int = 0
    var currentDot: Int = 0
    var dotSize: Int = 15
    

    
    func configure(homeBannerCollection: HomeBannerCollection) {
        self.homeBannerCollection = homeBannerCollection
        
        self.homeBannerCollection?.bannerDelegate = self
        dataSource = self

 
        
        self.totalDots = homeBannerCollection.movies.count
        self.currentDot = homeBannerCollection.currentPage
        
        contentInset.top = max((frame.height - CGFloat(dotSize)) / 2, 0)
        let contentWidth = Int(Double((dotSize + 3)) * 0.75) * (totalDots - 1) + (dotSize + 3)
        let emptyHorizontalSpace = frame.width - CGFloat(contentWidth)
        contentInset.left = emptyHorizontalSpace / 2
    }
    
    func homeBannerPageDidChange(current page: Int) {
        self.currentDot = page
        reloadData()
    }
}

extension HomeBannerDotCollection: UICollectionViewDataSource {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalDots
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: "HomeBannerDotCell", for: indexPath) as! HomeBannerDotCell
        cell.configure(isActive: currentDot == indexPath.row, dotSize: dotSize)
        return cell;
    }
    
    
}




