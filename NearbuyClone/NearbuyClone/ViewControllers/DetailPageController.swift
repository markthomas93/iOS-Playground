//
//  DetailPageController.swift
//  NearbuyClone
//
//  Created by Himshikhar Gayan on 18/10/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import UIKit

class DetailPageController: UIViewController {

    @IBOutlet weak var backButtonView: UIView!
    @IBOutlet weak var shopButtonView: UIView!
    @IBOutlet weak var itemDetailView: UIView!
    @IBOutlet weak var wishListView: UIView!
    @IBOutlet weak var plusView: UIView!
    @IBOutlet weak var wishLabelView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    backButtonView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(popView)))
        priceLabel.sizeToFit()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        backButtonView.roundCorners(corners: [.topRight,.bottomRight], radius: 10)
        shopButtonView.roundCorners(corners: [.topLeft,.bottomLeft,.topRight,.bottomRight], radius: shopButtonView.frame.size.height/2)
        itemDetailView.roundCorners(corners: [.topRight,.bottomRight], radius: itemDetailView.frame.size.height/6)
        plusView.roundCorners(corners: [.topLeft,.bottomLeft], radius: 10)
        wishLabelView.roundCorners(corners: [.topRight,.bottomRight], radius: 10)
    }
    
    @objc func popView(){
        self.navigationController?.popViewController(animated: true)
    }

}

extension UIView {
    
    func roundCorners(corners : UIRectCorner, radius : CGFloat){
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize.init(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
