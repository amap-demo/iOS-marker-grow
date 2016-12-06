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
        
        self.mapView = MAMapView.init(frame: self.view.bounds)
        self.mapView.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
        self.mapView.delegate = self
        self.mapView.centerCoordinate = CLLocationCoordinate2DMake(39.916049, 116.399792)
        self.view.addSubview(self.mapView)
        
        let annotation = MAPointAnnotation.init()
        annotation.coordinate = CLLocationCoordinate2DMake(39.916049, 116.399792)
        self.mapView.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //-MARK: mapview delegate
    
    func mapView(_ mapView: MAMapView!, viewFor annotation: MAAnnotation!) -> MAAnnotationView! {
        if(annotation.isKind(of: MAPointAnnotation.self)) {
            let reuseIdentifier = "yourReuseIdentifier"
            var view:growAnnotationView! = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier) as! growAnnotationView!
            
            if(view == nil) {
                view = growAnnotationView.init(annotation: annotation, reuseIdentifier: "yourReuseIdentifier")
            }
            
            view.image = UIImage.init(named: "CYAN")
            
            return view
        }
        
        return nil
    }
}

