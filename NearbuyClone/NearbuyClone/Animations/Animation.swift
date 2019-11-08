//
//  Animation.swift
//  NearbuyClone
//
//  Created by Himshikhar Gayan on 17/10/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import UIKit

class Animation : NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
       // let from = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let to = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        transitionContext.containerView.addSubview(to?.view ?? UIView())
        to?.view.alpha = 0.0
        
        UIView.animate(withDuration: 0.3, animations: {
            to?.view.alpha = 1.0
        }) { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
