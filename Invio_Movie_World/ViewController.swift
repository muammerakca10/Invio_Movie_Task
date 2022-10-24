//
//  ViewController.swift
//  Invio_Movie_World
//
//  Created by MAC on 23.10.2022.
//
import Alamofire
import UIKit
class ViewController: UIViewController, UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    let searchController = UISearchController()
        
    var findedMovies = [SearchResult]()
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
    
    /*
    @IBAction func searchButtonClicked(_ sender: Any) {
        omdbApi.search(text: searchTextField.text!) { (result) in
            guard let result = result else {
                print("Error")
                return}
            print(result)
        }
    }
     */
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
        cell.movieNameLabel!.text = "asd"
        cell.descriptionLabel!.text = "aaaaaaaaaakljkjbk kjbkbuibibiu kbiubiubiubkbkbi kbiubiubiubibiunn"
        cell.posterImage!.image = UIImage(named: "invioMovieLogo.png")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        /*
        omdbApi.search(text: text) { () in
            <#code#>
        }
        */
        
        print(text)
    }
}

