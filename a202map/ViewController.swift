//
//  ViewController.swift
//  a202map
//
//  Created by 申潤五 on 2022/3/20.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var myMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myMapView.isScrollEnabled = false
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let latitude:CLLocationDegrees = 25.0444032
            let longitude:CLLocationDegrees = 121.5141468
            let location:CLLocationCoordinate2D =
            CLLocationCoordinate2DMake(latitude, longitude)
            let xScale:CLLocationDegrees = 0.01
            let yScale:CLLocationDegrees = 0.01
            let span:MKCoordinateSpan =
            MKCoordinateSpan(latitudeDelta: yScale, longitudeDelta: xScale)
            let region:MKCoordinateRegion =
            MKCoordinateRegion.init(center: location, span: span)
            self.myMapView.setRegion(region, animated: true)
            

        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            let latitude:CLLocationDegrees = 25.0444032
            let longitude:CLLocationDegrees = 121.5141468
            let location:CLLocationCoordinate2D =
            CLLocationCoordinate2DMake(latitude, longitude)
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = "譯智"
            annotation.subtitle = "教育訓練中心"
            self.myMapView.addAnnotation(annotation)
        }
        
    }
    
    @IBAction func setMapType(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        case 0:
            
            myMapView.mapType = .standard
        case 1:
            
            myMapView.mapType = .satellite
        case 2:
            
            myMapView.mapType = .hybrid
        default:
            break
        }
    }
    
    
    @IBAction func mapLongPress(_ sender: UILongPressGestureRecognizer) {
        print("Long Press")
        
        let touchPoint = sender.location(in: myMapView)
        let location = myMapView.convert(touchPoint, toCoordinateFrom: myMapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "自選點"
        self.myMapView.addAnnotation(annotation)
        
    }
    
    
}

