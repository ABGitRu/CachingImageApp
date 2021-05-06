//
//  ViewController.swift
//  CachingImageApp
//
//  Created by Mac on 06.05.2021.
//

import UIKit

class FirstViewController: UIViewController {
    
    var dataProvider = DataGiver()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let SecondVC = segue.destination as? SecondViewController else { return }
        SecondVC.dataProvider = dataProvider
    }


}

