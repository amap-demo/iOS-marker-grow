//
//  growAnnotationView.swift
//  iOS-marker-grow
//
//  Created by shaobin on 16/12/6.
//  Copyright © 2016年 Autonavi. All rights reserved.
//

import UIKit

class growAnnotationView: MAAnnotationView, CAAnimationDelegate {
    
    override init!(annotation: MAAnnotation!, reuseIdentifier: String!) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        if(newSuperview?.bounds.contains(self.center))! {
            let growAnimation = CABasicAnimation.init(keyPath: "transform.scale")
            growAnimation.delegate = self
            growAnimation.duration = 1.5;
            growAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
            growAnimation.fromValue = 0
            growAnimation.toValue = 1.0
            
            
            self.layer.add(growAnimation, forKey: "growAnimation")
        }
    }

}
