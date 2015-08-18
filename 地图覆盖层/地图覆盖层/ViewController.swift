//
//  ViewController.swift
//  地图覆盖层
//
//  Created by goofygao on 8/18/15.
//  Copyright (c) 2015 goofyy. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var po:CLLocationCoordinate2D = CLLocationCoordinate2D()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.region = MKCoordinateRegion(center: CLLocationCoordinate2DMake(23, 113), span: MKCoordinateSpanMake(1, 1))
        mapView.delegate = self
        //画线
//        var coor = [CLLocationCoordinate2D]()
//        for (var i=0; i<5; i++) {
//         po = CLLocationCoordinate2DMake(CLLocationDegrees(23 + i), 113)
//            coor.append(po)
//        }
//        var line = MKPolyline(coordinates: &coor, count: 5)
//        mapView.addOverlay(line)
        
      //画圆
        var cicle:MKCircle = MKCircle(centerCoordinate: CLLocationCoordinate2DMake(23, 113), radius: 500)
        mapView.addOverlay(cicle)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //画线
//    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
//        var render = MKPolylineRenderer(overlay: overlay)
//        render.lineWidth = 3
//        render.strokeColor = UIColor.redColor()
//        return render
//        
//    }
    
    //画圆
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        var render = MKCircleRenderer(overlay: overlay)
        
        render.lineWidth = 3
        render.strokeColor = UIColor.greenColor()
        render.fillColor = UIColor.redColor()
        return render
        
        
    }

}

