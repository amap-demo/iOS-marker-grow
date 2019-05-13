//
//  ViewController.swift
//  iOS-marker-grow-swift
//
//  Created by shaobin on 16/12/6.
//  Copyright © 2016年 Autonavi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MAMapViewDelegate {
    
    var mapView : MAMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.mapView = MAMapView(frame: self.view.bounds)
        self.mapView.delegate = self
        self.mapView.allowsAnnotationViewSorting = false
        
        self.view.addSubview(self.mapView)
        
        let button = UIButton(frame: CGRect(x: CGFloat(10), y: CGFloat(100), width: CGFloat(120), height: CGFloat(32)))
        button.backgroundColor = UIColor.white
        button.layer.borderWidth = 1.0
        button.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(12))
        button.layer.borderColor = UIColor.red.cgColor
        button.setTitleColor(UIColor.red, for: .normal)
        button.setTitle("addAnnotation", for: .normal)
        button.addTarget(self, action: #selector(self.actionAddAnnotation), for: .touchUpInside)
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func actionAddAnnotation() {
        var randomPoint = CGPoint.zero
        randomPoint.x = CGFloat(Int(arc4random()) % Int(self.view.bounds.width - 100))
        randomPoint.y = CGFloat(Int(arc4random()) % Int(self.view.bounds.height - 200))
        let randomCoordinate: CLLocationCoordinate2D = mapView.convert(randomPoint, toCoordinateFrom: self.view)
        let annotation = MAPointAnnotation()
        annotation.coordinate = randomCoordinate
        mapView.addAnnotation(annotation)
    }
    
    //-MARK: mapview delegate
    
    func mapView(_ mapView: MAMapView!, viewFor annotation: MAAnnotation!) -> MAAnnotationView! {
        if(annotation.isKind(of: MAPointAnnotation.self)) {
            let reuseIdentifier = "yourReuseIdentifier"
            var annotationView:growAnnotationView! = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier) as! growAnnotationView!
            
            if(annotationView == nil) {
                annotationView = growAnnotationView.init(annotation: annotation, reuseIdentifier: "yourReuseIdentifier")
                
                annotationView.image = UIImage(named: "CYAN")
                annotationView.centerOffset = CGPoint(x: 0, y: -(annotationView.image.size.height / 2.0))
            }
            
            
            return annotationView
        }
        
        return nil
    }
}

