//
//  ViewController.swift
//  获取路线
//
//  Created by goofygao on 8/18/15.
//  Copyright (c) 2015 goofyy. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    var locationManger:CLLocationManager = CLLocationManager()
    var location:CLLocation!
    var ann:MKPointAnnotation = MKPointAnnotation()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.distanceFilter = kCLLocationAccuracyKilometer
        
        locationManger.requestAlwaysAuthorization()
        locationManger.startUpdatingLocation()
 
        if ((location) != nil) {

        }
        
        mapView.delegate = self
        mapView.mapType = MKMapType.Satellite
        
        ann.title = "定位的位置"
        ann.subtitle = "广州"
        
        mapView.addAnnotation(ann)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
    
    重写 - 更改大头针颜色
    :param: mapView
    :param: annotation
    
    :returns: MKAnnotationView
    */
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView!
    {
        var view:MKPinAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        view.pinColor = MKPinAnnotationColor.Red
        //view.image = UIImage(named: "localtion.png")
        var viewLeft = UIView(frame: CGRectMake(0, 0, 50, 50))
        viewLeft.backgroundColor = UIColor.redColor()
        var viewRight = UIView(frame: CGRectMake(0, 0, 50, 50))
        viewRight.backgroundColor = UIColor.greenColor()
        view.leftCalloutAccessoryView = viewLeft
        view.rightCalloutAccessoryView = viewRight
        view.draggable = true
        view.canShowCallout = true
        return view
    }
    
   
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        location = locations.last as! CLLocation
        if((location) == nil) {
            locationManger.startUpdatingLocation()
        }
        println("\(location.coordinate.longitude)")
        mapView.region = MKCoordinateRegion(center: CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude), span: MKCoordinateSpanMake(20, 20))
        ann.coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
    }

}

