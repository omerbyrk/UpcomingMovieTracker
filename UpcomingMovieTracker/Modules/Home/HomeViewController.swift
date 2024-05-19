//
//  ViewController.swift
//  UpcomingVideoTracker
//
//  Created by Ömer Bayrak on 11.05.2024.
//

import UIKit



class HomeViewController: UIViewController {

    @IBOutlet weak var bannerCollection: HomeBannerCollection!

    @IBOutlet weak var movieSectionTable: MovieSectionTable!
    @IBOutlet weak var bannerDotCollection: HomeBannerDotCollection!
    @IBOutlet weak var userAvatar: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        userAvatar.layer.cornerRadius = userAvatar.frame.height / 2
        
        Task {
            await bannerCollection.configure()
            bannerDotCollection.configure(homeBannerCollection:  bannerCollection)
            
            movieSectionTable.configure()
            

        }
    }
}

