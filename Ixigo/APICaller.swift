//
//  APICaller.swift
//  Ixigo
//
//  Created by Krishana on 27/06/19.
//  Copyright © 2019 ApostekBlr. All rights reserved.
//

import Foundation

import SwiftyJSON

class APICaller {
    
    static let apiCaller = APICaller()
    
    private init() {
    }
    
    func getResponse() {
        let URLString = "https://www.ixigo.com/sampleFlightData"
        if let url = URL(string: URLString) {
            if let data = try? Data(contentsOf: url){
                //call parse data here
                do {
                    let json = try JSON(data: data)
                    print(json)
                    for airline in json["airlineMap"] {
                        Maps.maps.airlineMap[airline.0] = airline.1.rawString()!
                    }
                    for airport in json["airportMap"] {
                        Maps.maps.airportMap[airport.0] = airport.1.rawString()!
                    }
                    for i in 0..<json["flightsData"].count {
                        var seat : SeatClass
                        let seatClass = json["flightsData"][i]["class"].string!
                        if seatClass == "Business" {
                            seat = .Business
                        }
                        else
                        {
                            seat = .Economy
                        }
                        let flightDetails = FlightDetails(originCode: json["flightsData"][i]["originCode"].rawString()!, destinationCode: json["flightsData"][i]["destinationCode"].rawString()!, takeoffTime: json["flightsData"][i]["takeoffTime"].rawString()!, landingTime: json["flightsData"][i]["landingTime"].rawString()!, price: Int(json["flightsData"][i]["price"].string!)!, airlineCode: json["flightsData"][i]["airlineCode"].rawString()!, seatClass: seat )
                        FlightsData.flightsData.flights.append(flightDetails)
                    }
                    
                }
                catch let error {
                    print("Error",error)
                }
            }
        }
    }
}
