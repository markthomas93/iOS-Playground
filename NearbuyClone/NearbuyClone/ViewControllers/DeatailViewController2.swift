//
//  DeatailViewController2.swift
//  NearbuyClone
//
//  Created by Himshikhar Gayan on 18/10/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import UIKit

class DeatailViewController2: UIViewController ,UIScrollViewDelegate{
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backButtonView: UIView!
    @IBOutlet weak var first: ProgressBarView!
    
    @IBOutlet weak var last: ProgressBarView!
    @IBOutlet weak var middle: ProgressBarView!
    @IBOutlet weak var detailView: UIView!
    
    @IBOutlet weak var circularView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self
        self.navigationController?.navigationBar.isHidden = true
        self.backButtonView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(back)))
        self.setCircleViews()
        setUI()
    }
    
    func setUI(){
        detailView.roundCorners(corners: [.allCorners], radius: 10)
        circularView.roundCorners(corners: [.allCorners], radius: 10)
    }
    
    @objc func back(){
        self.navigationController?.popViewController(animated: true)
    }

    func setCircleViews(){
        first.progress = 0.1
        middle.progress = 0.5
        last.progress = 1.0
    }
    

}
