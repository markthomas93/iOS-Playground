//
//  PurchasesController.swift
//  NearbuyClone
//
//  Created by Himshikhar Gayan on 15/10/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import UIKit

class PurchasesController: UIViewController,UINavigationControllerDelegate{

    @IBOutlet weak var progressBar: ProgressBarView!
    @IBOutlet weak var firstProgress: ProgressBarView!
    @IBOutlet weak var lastProgress: ProgressBarView!
    @IBOutlet weak var topCardView: UIView!
    @IBOutlet weak var discoverView: UIView!
    @IBOutlet weak var gradientView: GradientView!
    @IBOutlet weak var addView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var rechargeLabel: UILabel!
    @IBOutlet weak var rechargeView: UIView!
    @IBOutlet weak var rechargeNowView: UIView!
    
    
    let gradient = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        setContextMenu()
        setCircleViews()
        setUI()
        self.navigationController?.navigationBar.isHidden = true
        addView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(pushView)))
        discoverView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(presentView)))
    }
    
    func setContextMenu(){
        let interaction = UIContextMenuInteraction(delegate: self)
        let intercation2 = UIContextMenuInteraction(delegate: self)
        self.gradientView.addInteraction(intercation2)
        self.topCardView.addInteraction(interaction)
    }
    
    @objc func presentView(){
        self.present(PresentViewController(), animated: true, completion: nil)
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Animation()
    }
    
    func setUI(){
        self.topCardView.customView(cornerRadius: 8, shadowColor: .lightGray)
        self.rechargeView.customView(cornerRadius: 20, shadowColor: .lightGray)
        self.discoverView.customView(cornerRadius: 15, shadowColor: .lightGray)
        self.addView.customView(cornerRadius: 15, shadowColor: .lightGray)
    }
    
    func setCircleViews(){
        progressBar.progress = 0.1
        firstProgress.progress = 1.0
        lastProgress.progress = 0.0
    }
    
    @objc func pushView(){
        //self.present(PresentViewController(), animated: true, completion: nil)
        self.navigationController?.pushViewController(PresentViewController(), animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.delegate = self
        self.navigationController?.navigationBar.isHidden = true
    }
}

//context menu
extension PurchasesController : UIContextMenuInteractionDelegate {
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { (actions) -> UIMenu? in
            return self.makeContextMenu()
        }
    }
    
    func makeContextMenu() -> UIMenu {
        let share = UIAction.init(title: "Himshikhar Gayan") { (action) in
        }
        
        let duration = UIAction.init(title: "Ends in 3 days",identifier: nil, discoverabilityTitle: nil) { (action) in
        }
        let recharge = UIAction.init(title: "Recharge") { (action) in
            self.presentView()
        }
        return UIMenu.init(title: "Profile", children: [share,duration,recharge])
    }
}

extension UIView {
    func customView(cornerRadius: Double,shadowColor: UIColor){
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = .zero
        self.layer.shadowColor = shadowColor.cgColor
    }
}

//gradient view
@IBDesignable class GradientView: UIView {
    @IBInspectable var firstColor: UIColor = UIColor.systemRed
    @IBInspectable var secondColor: UIColor = UIColor.systemGray2

    @IBInspectable var vertical: Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyGradient()
    }
    
    func applyGradient() {
        let colors = [firstColor.cgColor, UIColor.black.cgColor]
        let layer = CAGradientLayer()
        layer.colors = colors
        layer.frame = self.bounds
        layer.locations = [0.0,0.8]
        layer.startPoint = CGPoint(x: 0.5, y: 0.5)
        layer.endPoint = vertical ? CGPoint(x: 1, y: 0.5) : CGPoint(x: 1, y: 0.5)
        self.layer.insertSublayer(layer, at: 0)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        applyGradient()
    }
}
