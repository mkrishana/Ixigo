//
//  FlightsModel.swift
//  Ixigo
//
//  Created by Krishana on 27/06/19.
//  Copyright © 2019 ApostekBlr. All rights reserved.
//

import Foundation


enum SeatClass : String {
    case Business
    case Economy
}

struct  FlightDetails {
    let originCode : String
    let destinationCode : String
    let takeoffTime : String
    let landingTime : String
    let price : Int
    let airlineCode : String
    let seatClass : SeatClass
}

struct FlightsData {
    static var flightsData = FlightsData()
    var flights = [FlightDetails]()
    
    private init() {
    }
}
