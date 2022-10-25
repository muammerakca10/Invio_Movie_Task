//
//  UIImage+load.swift
//  Invio_Movie_World
//
//  Created by Muammer_Akca on 24.10.2022.
//

import Foundation
import UIKit

extension UIImageView {
    func load(urlString : String) {
        guard let url = URL(string: urlString)else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        
                    }
                }
            }
        }
    }
}
