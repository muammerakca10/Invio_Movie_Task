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
    private var omdbApi = OmdbApi(apiKey: "31dd4179")
    private var selectedMovie : MovieDetail!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    
    func getMovieDetails(completion : @escaping (_ movieDetail: MovieDetail) ->()) {
        self.omdbApi.getMovieDetail(imdbID: self.imdbID) { (movieDetail) in
            if let movieDetail = movieDetail {
                completion(movieDetail)
                self.selectedMovie = movieDetail
                print("getmoviedetails ici \(self.selectedMovie!)")
            }
        }
    }
    
    func loadImage (completion : @escaping ()->()){
        self.imageMovie.load(urlString: self.selectedMovie.poster)
    }
    
    func updateUI(){
        getMovieDetails { (movieDetail) in
            self.loadImage {
                self.titleLabel.text = "\(self.selectedMovie.title)"
                self.yearLabel.text = "Year : \(self.selectedMovie.year)"
                self.releasedLabel.text = "Released : \(self.selectedMovie.released)"
                self.runtimeLabel.text = "Runtime : \(self.selectedMovie.runtime)"
                self.genreLabel.text = "Genre : \(self.selectedMovie.genre)"
                self.directorLabel.text = "Director : \(self.selectedMovie.director)"
                self.writerLabel.text = "Writer : \(self.selectedMovie.writer)"
                self.actorsLabel.text = "Actors : \(self.selectedMovie.actors)"
                self.plotLabel.text = "Plot : \(self.selectedMovie.plot)"
                self.languageLabel.text = "Language : \(self.selectedMovie.language)"
                self.countryLabel.text = "Country : \(self.selectedMovie.country)"
                self.self.awardsLabel.text = "Awards : \(self.selectedMovie.awards)"
                self.imdbRatingLabel.text = "IMDB Rating : \(self.selectedMovie.imdbRating)"
                self.imdbIDLabel.text = "IMDB ID : \(self.selectedMovie.imdbID)"
            }
        }
    }
}
