//
//  MovieSectionTable.swift
//  UpcomingMovieTracker
//
//  Created by Ömer Bayrak on 14.05.2024.
//

import UIKit

class MovieSectionTable: UITableView, UITableViewDataSource, UITableViewDelegate {

    
    
    let upcomingMovies = UpcomingMovies()
    let popularMovies = PopularMovies()
    let nowPlayingMovies = NowPlayingMovies()
    let topRatedMovies = TopRatedMovies()
    
    var sectionedMovies: [MovieSection: [Movie]] = [:]


    func configure() {
        dataSource = self
        delegate =  self
        
        Task {
            sectionedMovies[.nowPlaying] = try! await nowPlayingMovies.getList()
            sectionedMovies[.popular] = try! await popularMovies.getList()
            sectionedMovies[.topRated] = try! await topRatedMovies.getList()
            sectionedMovies[.upcoming] = try! await upcomingMovies.getList()
            reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return MovieSection.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: .init(x: 0, y: 0, width: self.bounds.width, height: 50))
        header.backgroundColor = .white.withAlphaComponent(0.85)
        
        // add title
        let title = UILabel(frame: .init(x: 8, y: 0, width: self.bounds.width, height: 50))
        title.text = MovieSection(rawValue: section)?.title
        title.font = .systemFont(ofSize: 20, weight: .semibold)
        title.textColor = .black
        header.addSubview(title)
        
        // add see all button
        
        let seeAllButton = UIButton(frame: .init(x: self.bounds.width - 120, y: 0, width: 120, height:  50))
        seeAllButton.setTitle("See All", for: .normal)
        seeAllButton.setImage(UIImage(systemName: "chevron.forward.circle"), for: .normal)
        seeAllButton.setTitleColor(.darkGray, for: .normal)
        seeAllButton.tag = section
        seeAllButton.tintColor = .darkGray
        seeAllButton.configuration = UIButton.Configuration.plain()
        seeAllButton.configuration?.imagePlacement = .trailing
        seeAllButton.configuration?.imagePadding = 5
        seeAllButton.addTarget(self, action: #selector(seeAllButtonClicked(_:)), for: .touchUpInside)
        header.addSubview(seeAllButton)
        
        return header
    }
    
    @objc func seeAllButtonClicked(_ sender: UIButton?) {
        print(sender?.tag)
    }

    
    override func headerView(forSection section: Int) -> UITableViewHeaderFooterView? {
        print("hellow orld")
        let header = UITableViewHeaderFooterView(frame: .init(x: 0, y: 0, width: self.bounds.width, height: 50))
        
        let title = UILabel()
        title.text = MovieSection(rawValue: section)?.title
        header.addSubview(title)
        return header
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.textColor = .black
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: "MovieSectionTableCell", for: indexPath) as! MovieSectionTableCell
        
        let movieSection = MovieSection(rawValue: indexPath.section)
        
        let movies = sectionedMovies[movieSection!]!
        
        cell.configure(movies: movies)
        
        return cell
    }
}
