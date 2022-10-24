//
//  DetailViewController.swift
//  Invio_Movie_World
//
//  Created by MAC on 24.10.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: UI Elements
    @IBOutlet var imageMovie: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var releasedLabel: UILabel!
    @IBOutlet var runtimeLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var directorLabel: UILabel!
    @IBOutlet var writerLabel: UILabel!
    @IBOutlet var actorsLabel: UILabel!
    @IBOutlet var plotLabel: UILabel!
    @IBOutlet var languageLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var awardsLabel: UILabel!
    @IBOutlet var imdbRatingLabel: UILabel!
    @IBOutlet var imdbIDLabel: UILabel!
    
    var imdbID = ""
    var omdbApi = OmdbApi(apiKey: "31dd4179")
    var selectedMovie : MovieDetail!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("Detail viewdidload \(imdbID)")
        
        omdbApi.getMovieDetail(imdbID: imdbID) { (movieDetail) in
            if let movieDetail = movieDetail {
                print("movieDetail : \(movieDetail)")
                self.selectedMovie = movieDetail
            }
        }
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
            self.imageMovie.load(urlString: self.selectedMovie.poster)
            self.titleLabel.text = self.selectedMovie.title
            self.yearLabel.text = self.selectedMovie.year
            self.releasedLabel.text = self.selectedMovie.released
            self.runtimeLabel.text = self.selectedMovie.runtime
            self.genreLabel.text = self.selectedMovie.genre
            self.directorLabel.text = self.selectedMovie.director
            self.writerLabel.text = self.selectedMovie.writer
            self.actorsLabel.text = self.selectedMovie.actors
            self.plotLabel.text = self.selectedMovie.plot
            self.languageLabel.text = self.selectedMovie.language
            self.countryLabel.text = self.selectedMovie.country
            self.self.awardsLabel.text = self.selectedMovie.awards
            self.imdbRatingLabel.text = self.selectedMovie.imdbRating
            self.imdbIDLabel.text = self.selectedMovie.imdbID
            
        }
    }
}
