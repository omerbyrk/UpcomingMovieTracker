//
//  Image.swift
//  UpcomingMovieTracker
//
//  Created by Ömer Bayrak on 12.05.2024.
//

import UIKit

extension UIImage {
    func imageResized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
