//
//  XibView.swift
//  BannerView
//
//  Created by Himshikhar Gayan on 10/10/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import UIKit

public class XibView : UIView {
    
    var view:UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    private func xibSetup() {
        view = loadViewFromXib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        sendSubviewToBack(view)
    }
    
    private func loadViewFromXib() -> UIView {
        let className = type(of: self)
        let nib = UINib(nibName: String(describing: className), bundle: Bundle(for: className))
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return UIView() }
        return view
    }
    
}
