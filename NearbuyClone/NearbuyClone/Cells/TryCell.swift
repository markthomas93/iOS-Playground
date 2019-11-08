//
//  TryCell.swift
//  NearbuyClone
//
//  Created by Himshikhar Gayan on 15/10/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import UIKit

class TryCell: UITableViewCell {

    @IBOutlet weak var mainText: UILabel!
    @IBOutlet weak var subText: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var tryView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.tryView.customView(cornerRadius: 8, shadowColor: .systemGray3)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setData(tryData : TryData){
        self.mainText.text = tryData.mainText
        self.subText.text = tryData.subText
        self.mainImage.image = UIImage(named: tryData.imageName)
    }
    
}
