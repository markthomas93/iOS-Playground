//
//  FavouritesController.swift
//  NearbuyClone
//
//  Created by Himshikhar Gayan on 15/10/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import UIKit

class FavouritesController: UIViewController {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        
        self.navigationController?.navigationBar.barTintColor = .white
        let text = [NSAttributedString.Key.foregroundColor : UIColor.black,
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24)]
        self.navigationController?.navigationBar.titleTextAttributes = text
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.visibleViewController?.navigationItem.title = "Nearbuy"
    }
    
    func setData(){
        mainImage.image = UIImage(named: "amazon")
        mainLabel.text = "Main Label"
        subLabel.text = "Sub label"
    }

}
