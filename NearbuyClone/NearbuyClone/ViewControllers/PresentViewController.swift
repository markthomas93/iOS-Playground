//
//  PresentViewController.swift
//  NearbuyClone
//
//  Created by Himshikhar Gayan on 17/10/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import UIKit

class PresentViewController: UIViewController ,UINavigationControllerDelegate{

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var rechargeLabel: UILabel!
    @IBOutlet weak var rechargeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        self.navigationController?.navigationBar.isHidden = false
        rechargeView.customView(cornerRadius: 20, shadowColor: .systemGray3)
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Animation()
    }

}
