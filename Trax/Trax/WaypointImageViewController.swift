//
//  WaypointImageViewController.swift
//  Trax
//
//  Created by Sayanee Basu on 21/1/16.
//  Copyright © 2016 Sayanee Basu. All rights reserved.
//

import UIKit

class WaypointImageViewController: ImageViewController {

    var waypoint: GPX.Waypoint! {
        didSet {
            imageURL = waypoint.imageURL
            title = waypoint.name
            updateEmbeddedMap()
        }
    }
    
    var smvc: SimpleMapViewController?
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Embed Map" {
            smvc = segue.destinationViewController as? SimpleMapViewController
            updateEmbeddedMap()
        }
    }
    
    func updateEmbeddedMap() {
        if let mapView = smvc?.mapView {
            mapView.mapType = .Hybrid
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotation(waypoint)
            mapView.showAnnotations(mapView.annotations, animated: true)
        }
    }

}
