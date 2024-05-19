//
//  ImageView.swift
//  UpcomingMovieTracker
//
//  Created by Ömer Bayrak on 12.05.2024.
//

import UIKit

var urlImagesCache: [URL: UIImage] = [:]

extension UIImageView {
    func loadFromInternet(url: URL) {
        self.image = nil
        
        if let image = urlImagesCache[url] {
            self.image = image
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        urlImagesCache[url] = image
                    }
                }
            }
        }
    }
}
