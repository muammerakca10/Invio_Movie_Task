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
        omdbApi.getMovieDetail(imdbID: self.imdbID) { (movieDetail) in
            if let movieDetail = movieDetail {
                
                self.selectedMovie = movieDetail //Bu satir asagidaydi
//              Onceki gonderdigim projede, asagidaki satirla yukaridaki satirin
//              yerleri farkli oldugu icin hata veriyormus. Sorunu satirlarin
//              yerlerini degistirerek cozdum
                completion(movieDetail)  //Bu satir yukaridaydi
//              print("after getmoviedetails : \(self.selectedMovie!)")
            }
        }
    }
    
    func loadImage (for movieDetail: MovieDetail, completion : @escaping ()->Void) {
        imageMovie.load(urlString: movieDetail.poster)
    }
    
    func updateUI(){
        getMovieDetails { movieDetail in
            self.titleLabel.text = "\(movieDetail.title)"
            self.yearLabel.text = "Year : \(movieDetail.year)"
            self.releasedLabel.text = "Released : \(movieDetail.released)"
            self.runtimeLabel.text = "Runtime : \(movieDetail.runtime)"
            self.genreLabel.text = "Genre : \(movieDetail.genre)"
            self.directorLabel.text = "Director : \(movieDetail.director)"
            self.writerLabel.text = "Writer : \(movieDetail.writer)"
            self.actorsLabel.text = "Actors : \(movieDetail.actors)"
            self.plotLabel.text = "Plot : \(movieDetail.plot)"
            self.languageLabel.text = "Language : \(movieDetail.language)"
            self.countryLabel.text = "Country : \(movieDetail.country)"
            self.awardsLabel.text = "Awards : \(movieDetail.awards)"
            self.imdbRatingLabel.text = "IMDB Rating : \(movieDetail.imdbRating)"
            self.imdbIDLabel.text = "IMDB ID : \(movieDetail.imdbID)"
            
            self.loadImage(for: movieDetail) {
//          print("Image load")
            }
        }
    }
}
