//
//  LocationModel.swift
//  Africa
//
//  Created by Sree Sai Raghava Dandu on 01/12/20.
//

import Foundation
import MapKit
//Create a DataModel for locations

struct NationalParkLocation: Codable,Identifiable {
    var id: String
    var name:String
    var image:String
    var latitude:Double
    var longitude:Double
    //Computed Property
    var location:CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
