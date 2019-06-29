//
//  TableViewCell.swift
//  Ixigo
//
//  Created by Krishana on 27/06/19.
//  Copyright © 2019 ApostekBlr. All rights reserved.
//

import UIKit

class FlightTableViewCell: UITableViewCell {

    @IBOutlet var classLabel: UILabel!
    @IBOutlet var originLabel: UILabel!
    @IBOutlet var departureTimeLabel: UILabel!
    @IBOutlet var destinationLabel: UILabel!
    @IBOutlet var arrivalTimeLabel: UILabel!
    @IBOutlet var airlineLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(flight: FlightDetails){
        originLabel.text = Maps.maps.airportMap[flight.originCode]
        destinationLabel.text = Maps.maps.airportMap[flight.destinationCode]
        classLabel.text = flight.seatClass.rawValue
        airlineLabel.text = Maps.maps.airlineMap[flight.airlineCode]
        priceLabel.text = "₹" + "\(flight.price)"
        let takeoffDate = Date(timeIntervalSince1970: Double(flight.takeoffTime)!/1000)
        let arrivalDate = Date(timeIntervalSince1970: Double(flight.landingTime)!/1000)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .none
        let takeOffTime = dateFormatter.string(from: takeoffDate)
        let arrivalTime = dateFormatter.string(from: arrivalDate)
        departureTimeLabel.text = takeOffTime
        arrivalTimeLabel.text = arrivalTime
    }

}
