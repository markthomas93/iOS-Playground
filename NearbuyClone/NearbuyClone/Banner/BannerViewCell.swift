//
//  BannerViewCell.swift
//  NearbuyClone
//
//  Created by Himshikhar Gayan on 15/10/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import UIKit

class BannerViewCell: UITableViewCell, BannerDelegate {
    
    @IBOutlet weak var banner: Banner!
    
    let bannerData : [BannerData] = [
        BannerData.init(id: 1, image: "amazon", text: ""),
        BannerData.init(id: 2, image: "amazon", text: ""),
        BannerData.init(id: 3, image: "amazon", text: "")
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        banner.delegate = self
        banner.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func numberOfItemsInBanner(banner: Banner) -> Int {
        self.bannerData.count
    }
    
    func imageForItemInBanner(banner: Banner, at index: Int) -> String {
        return bannerData[index].image
    }
    
    func didSelectBannerAt(index: Int) {
         print("clicked at \(index)")
    }
    
    func primaryTintColor() -> UIColor {
        return .blue
    }
    
    func shouldAutoChange() -> Bool {
        return true
    }
    
    func timeIntervalForChangingBanner() -> Int {
        return 3
    }

    
}
