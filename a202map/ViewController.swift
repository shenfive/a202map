//
//  ViewController.swift
//  a202map
//
//  Created by 申潤五 on 2022/3/20.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var myMapView: MKMapView!
    
    var locationManager:CLLocationManager!
    var timer:Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        locationManager?.requestWhenInUseAuthorization()
        
        locationManager.delegate = self
        
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.activityType = .automotiveNavigation
        locationManager?.startUpdatingLocation()
        
        myMapView.userTrackingMode = .followWithHeading

        
        
//        print("=========")
//        print(locationManager.location)
//        print("=========")
//
//        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { timer in
//            print("location:\(self.locationManager.location)")
//        })
        

        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            let latitude:CLLocationDegrees = 25.0444032
//            let longitude:CLLocationDegrees = 121.5141468
//            let location:CLLocationCoordinate2D =
//            CLLocationCoordinate2DMake(latitude, longitude)
//            let xScale:CLLocationDegrees = 0.01
//            let yScale:CLLocationDegrees = 0.01
//            let span:MKCoordinateSpan =
//            MKCoordinateSpan(latitudeDelta: yScale, longitudeDelta: xScale)
//            let region:MKCoordinateRegion =
//            MKCoordinateRegion.init(center: location, span: span)
//            self.myMapView.setRegion(region, animated: true)
//
//
//        }
        
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
//            let latitude:CLLocationDegrees = 25.0444032
//            let longitude:CLLocationDegrees = 121.5141468
//            let location:CLLocationCoordinate2D =
//            CLLocationCoordinate2DMake(latitude, longitude)
//            let annotation = MKPointAnnotation()
//            annotation.coordinate = location
//            annotation.title = "譯智"
//            annotation.subtitle = "教育訓練中心"
//            self.myMapView.addAnnotation(annotation)
//        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let coordinate = locations[0].coordinate
    }
    
    
    @IBAction func setMapType(_ sender: UISegmentedControl) {
        
        
        if let coordinate = locationManager?.location?.coordinate{
            let xScale:CLLocationDegrees = 0.01
            let yScale:CLLocationDegrees = 0.01
            let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: yScale, longitudeDelta: xScale)
            
            let region = MKCoordinateRegion.init(center: coordinate, span: span)
            myMapView.setRegion(region, animated: true)
        }

        
        
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
//        print("Long Press")
//
//        let touchPoint = sender.location(in: myMapView)
//        let location = myMapView.convert(touchPoint, toCoordinateFrom: myMapView)
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = location
//        annotation.title = "自選點"
//        self.myMapView.addAnnotation(annotation)
        
    }
    
    
}

