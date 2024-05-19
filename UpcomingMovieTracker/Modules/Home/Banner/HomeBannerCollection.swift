//
//  HomeBanner.swift
//  UpcomingMovieTracker
//
//  Created by Ömer Bayrak on 12.05.2024.
//

import UIKit

protocol HomeBannerCollectionDelegate {
    func homeBannerPageDidChange(current page: Int)
}


class HomeBannerCollection: UICollectionView {
    
    
    let discoverMovies = DiscoverMovies()
    
     var movies: [Movie] = []
     var currentPage: Int = 0
    var bannerDelegate: HomeBannerCollectionDelegate?

    
    var cellWidth: Int {
        (Int(self.contentSize.width) / movies.count)
    }
    

    func configure() async {
        dataSource = self
        delegate = self
        
        
        self.movies = Array(try! (await discoverMovies.getList())[0...2])
        reloadData()
        
        startTimer()
    }
    
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) { (_) in
            let nextPage = (self.currentPage + 1) % (self.movies.count)
            self.setContentOffset(.init(x: nextPage * self.cellWidth, y: 0), animated: true)
        }
    }
}

extension HomeBannerCollection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: Int(collectionView.bounds.width), height: Int(collectionView.bounds.height))
    }
    

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = Int(contentOffset.x) / cellWidth
        if currentPage != self.currentPage {
            self.currentPage = currentPage
            bannerDelegate?.homeBannerPageDidChange(current: self.currentPage)
        }
    }
}

extension HomeBannerCollection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: "HomeBannerCell", for: indexPath) as! HomeBannerCell
        let movie = self.movies[indexPath.row]
        cell.configure(posterPath: movie.fullBackdropPath)
        return cell;
    }
}
