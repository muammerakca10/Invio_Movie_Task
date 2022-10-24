//
//  omdb.swift
//  Invio_Movie_World
//
//  Created by MAC on 23.10.2022.
//

import Foundation
import Alamofire
import UIKit

class OmdbApi {
    
    var baseUrl: String
    var apiKey : String
    
    init(apiKey: String) {
        self.baseUrl = "https://www.omdbapi.com/"
        self.apiKey = apiKey
    }
    
    func search(text: String , completion : @escaping (SearchResult?) -> Void)  {
        //let response =
        AF.request(baseUrl, method: .get, parameters: ["apikey":apiKey, "s":text]).response{ (response) in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(SearchResult?.self, from: data)
                    completion(result)
                } catch {
                    print(error)
                    completion(nil)
                }
            }
        }
    }
}
