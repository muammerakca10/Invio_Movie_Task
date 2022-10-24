//
//  ViewController.swift
//  Invio_Movie_World
//
//  Created by MAC on 23.10.2022.
//
import UIKit
import Alamofire

class SearchViewController: UIViewController, UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var imageInTableView : UIImage?

        
    let searchController = UISearchController()
        
    var findedMovies = [MovieShortInfo]()
    var omdbApi = OmdbApi(apiKey: "31dd4179")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Invio Movie World"
        
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Enter name of movie you want search"
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
        cell.movieNameLabel!.text = self.findedMovies[indexPath.row].title
        cell.yearLabel!.text = "Year : \(findedMovies[indexPath.row].year)"
        
        
        cell.posterImage.load(urlString: self.findedMovies[indexPath.row].poster)
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return findedMovies.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        
        omdbApi.search(text: text) { (searchResults) in
            if let searchResults = searchResults {
                //print(searchResults)
                self.findedMovies = searchResults.search
                self.tableView.reloadData()
            }
        }
        print(text)
    }
}
