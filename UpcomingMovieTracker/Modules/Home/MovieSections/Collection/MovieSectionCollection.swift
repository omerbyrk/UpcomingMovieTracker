//
//  MovieSectionCellCollection.swift
//  UpcomingMovieTracker
//
//  Created by Ömer Bayrak on 14.05.2024.
//

import UIKit

class MovieSectionCollection: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var movies: [Movie] = []
    
    func configure(movies: [Movie]) {
        delegate = self
        dataSource = self
        self.movies = movies
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: "MovieSectionCollectionCell", for: indexPath) as! MovieSectionCollectionCell
        
        
        let movie = movies[indexPath.row]
            
        cell.configure(movie: movie)
        
        return cell
    }
    
}
