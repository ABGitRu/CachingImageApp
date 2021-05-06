//
//  DataProvider.swift
//  CachingImageApp
//
//  Created by Mac on 06.05.2021.
//
import UIKit

class DataGiver {
    var imageCache = NSCache<NSString, UIImage>()
    
    func downloadImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage)
        } else {
            let request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 10)
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard error == nil,
                      data != nil,
                      response != nil else { return }
                
                guard let image = UIImage(data: data!) else { return }
                self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                
                DispatchQueue.main.async {
                    completion(image)
                }
            }
            dataTask.resume()
            }
        }
    }

