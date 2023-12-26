//
//  ViewController.swift
//  NetflixChafa
//
//  Created by Diplomado on 04/11/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        }
    }
    
    var model = movieTableViewModel(moviesPerGenre: moviesData)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        model.getSectionsPerGenre()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MovieTableViewCell else {return UITableViewCell()}
        var movies: [Movie]
        switch indexPath.section {
        case 0:
            movies = moviesData[indexPath.section].movies
        case 1: movies = moviesData[indexPath.section].movies
        case 2: movies = moviesData[indexPath.section].movies
        default:
            movies = moviesData[0].movies
        }
        let collectionModel = movieCollectionViewModel(movies: movies)
        cell.setData(collectionModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title:String = String()
        print(section)
        switch section {
        case 0:
            title = model.getSectionTitle(at: 0)
        case 1:
            title = model.getSectionTitle(at: 1)
        case 2:
            title = model.getSectionTitle(at: 2)
        default: title = "error"
        }
        return title
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160.0
    }
}
