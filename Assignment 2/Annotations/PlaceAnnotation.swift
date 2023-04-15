//
//  PlaceAnnotation.swift
//  Assignment 2
//
//  Created by Prajjwal Bhandari on 15/04/2023.
//

import Foundation
import MapKit

class PlaceAnnotation: MKPointAnnotation {
    
    let mapItem: MKMapItem
    let id = UUID()
    var isSelected: Bool = false
    
    init(mapItem: MKMapItem){
        self.mapItem = mapItem
        super.init()
        self.coordinate = mapItem.placemark.coordinate
    }
    
    var name: String {
        mapItem.name ?? ""
    }
    
    var phone: String {
        mapItem.phoneNumber ?? ""
    }
    
    var address: String {
        let placemark = mapItem.placemark
        var addressString = ""
        
        if let subThoroughfare = placemark.subThoroughfare {
            addressString += subThoroughfare + " "
        }
        
        if let thoroughfare = placemark.thoroughfare {
            addressString += thoroughfare + ", "
        }
        
        if let locality = placemark.locality {
            addressString += locality + ", "
        }
        
        if let administrativeArea = placemark.administrativeArea {
            addressString += administrativeArea + " "
        }
        
        if let postalCode = placemark.postalCode {
            addressString += postalCode + ", "
        }
        
        if let country = placemark.country {
            addressString += country
        }
        
        return addressString
    }

    
    var location: CLLocation {
        mapItem.placemark.location ?? CLLocation.default
    }
}
