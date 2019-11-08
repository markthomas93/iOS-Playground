//
//  GiftCardCell.swift
//  NearbuyClone
//
//  Created by Himshikhar Gayan on 15/10/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import UIKit

class GiftCardCell: UITableViewCell,UICollectionViewDelegateFlowLayout{
   
    @IBOutlet weak var collectionView: UICollectionView!
    let collectionIdentifier = "GiftCollectionCell"
    
    @IBOutlet weak var asa: UICollectionViewFlowLayout!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.register(UINib.init(nibName: collectionIdentifier, bundle: nil), forCellWithReuseIdentifier: collectionIdentifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    
}
