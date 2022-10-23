//
//  ViewController.swift
//  Invio_Movie_World
//
//  Created by MAC on 23.10.2022.
//
import Alamofire
import UIKit
class ViewController: UIViewController {
    
    var omdbApi = OmdbApi(apiKey: "31dd4179")

    @IBOutlet var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.placeholder = "Enter search"
        
    }
    
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        omdbApi.search(text: searchTextField.text!) { (result) in
            guard let result = result else {
                print("Error")
                return}
            print(result)
        }
    }
    
}

