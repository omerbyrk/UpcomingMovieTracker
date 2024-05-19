//
//  ViewController.swift
//  UpcomingVideoTracker
//
//  Created by Ömer Bayrak on 11.05.2024.
//

import UIKit



class HomeViewController: UIViewController {

    @IBOutlet weak var bannerCollection: HomeBannerCollection!

    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var movieSectionTable: MovieSectionTable!
    @IBOutlet weak var bannerDotCollection: HomeBannerDotCollection!
    @IBOutlet weak var userAvatar: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        userAvatar.layer.cornerRadius = userAvatar.frame.height / 2
        designSearchField()
        Task {
            await bannerCollection.configure()
            bannerDotCollection.configure(homeBannerCollection:  bannerCollection)
            
            movieSectionTable.configure()
            

        }
    }
    
    func designSearchField() {
        let search = UIButton(type: .custom)
        search.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        search.tintColor = .darkGray
        search.configuration = UIButton.Configuration.plain()
        search.configuration?.imagePadding = 2.5
        
        searchField.leftView = search
        searchField.leftViewMode = .always
        
        
        let filter = UIButton(type: .custom)
        filter.setImage(UIImage(systemName: "line.3.horizontal.decrease.circle"), for: .normal)
        filter.tintColor = .darkGray
        filter.configuration = UIButton.Configuration.plain()
        filter.configuration?.imagePadding = 2.5
        
        searchField.rightView = filter
        searchField.rightViewMode = .always
    }
}

