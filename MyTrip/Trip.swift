//
//  Trip.swift
//  MyTrip
//
//  Created by Joseph, Ethan on 5/9/17.
//  Copyright © 2017 Joseph, Ethan. All rights reserved.
//

import Foundation
import GooglePlaces

class Trip {
    var name : String
    
    //can get around passing the param into the initializer by using optionals, could also set a default value, but this defaults to nil
    var location : GMSPlace?
    
    init(name: String){
        self.name = name
    }
}
