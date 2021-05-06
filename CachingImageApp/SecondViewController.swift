//
//  SecondViewController.swift
//  CachingImageApp
//
//  Created by Mac on 06.05.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var image: UIImage? {
        didSet{
            imageView.image = image
            activityIndicator.hidesWhenStopped = true
            activityIndicator.stopAnimating()
        }
    }

    var dataProvider: DataGiver!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        
        let urlString = "https://cdn.wallscloud.net/converted/1546591598-mashina-pod-nebom-RJMO-7680x4320-MM-100.jpg"
        guard let urlImage = URL(string: urlString) else { return }
        
        dataProvider.downloadImage(url: urlImage) { image in
            self.image = image
        }
    }
    



}
