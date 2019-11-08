//
//  CircularProgressView.swift
//  NearbuyClone
//
//  Created by Himshikhar Gayan on 16/10/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//
import UIKit

class ProgressBarView : UIView{
    var backgroundPath: UIBezierPath!
    var shapeLayer: CAShapeLayer!
    var progressLayer: CAShapeLayer!
    
    var progress: Float = 0 {
        willSet(newValue) {
            progressLayer.strokeEnd = CGFloat(newValue)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundPath = UIBezierPath()
        self.simpleShape()
    }
    
    required public init?(coder aDecoder : NSCoder) {
        super.init(coder: aDecoder)
        backgroundPath = UIBezierPath()
        self.simpleShape()
    }
    
    func simpleShape(){
           createCirclePath()
        
           shapeLayer = CAShapeLayer()
           shapeLayer.path = backgroundPath.cgPath
           shapeLayer.lineWidth = 3
           shapeLayer.fillColor = nil
           shapeLayer.strokeColor = UIColor.lightGray.cgColor
           
           progressLayer = CAShapeLayer()
           progressLayer.path = backgroundPath.cgPath
           progressLayer.lineCap = CAShapeLayerLineCap.round
           progressLayer.lineWidth = 3
           progressLayer.fillColor = nil
           progressLayer.strokeColor = UIColor.red.cgColor
           progressLayer.strokeEnd = 0.0
           progressLayer.lineCap = .round

           self.layer.addSublayer(shapeLayer)
           self.layer.addSublayer(progressLayer)
       }
       
       private func createCirclePath(){
        
           let x = self.frame.width/2
           let y = self.frame.height/2
           let center = CGPoint(x: x, y: y)
           print(x,y,center)
           backgroundPath.addArc(withCenter: center, radius: x/CGFloat(2), startAngle: CGFloat(0), endAngle: CGFloat(6.28), clockwise: true)
           backgroundPath.close()
       }
    
    
}
