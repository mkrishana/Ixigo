//
//  TableViewController.swift
//  Ixigo
//
//  Created by Krishana on 27/06/19.
//  Copyright © 2019 ApostekBlr. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        APICaller.apiCaller.getResponse()
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        refreshControl?.attributedTitle = NSAttributedString(string: "Fetching Flights Details...")
        refreshControl?.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return FlightsData.flightsData.flights.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlightCell", for: indexPath) as! FlightTableViewCell
        cell.configureCell(flight: FlightsData.flightsData.flights[indexPath.row])
        return cell
    }

    @objc func refreshData() {
        APICaller.apiCaller.getResponse()
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    @IBAction func onClickSortBy(_ sender: UIBarButtonItem) {
        let alertView = UIAlertController(title: "Sort By", message: nil, preferredStyle: .actionSheet)
        let priceAction = UIAlertAction(title: "Price", style: .default, handler: { action in
            FlightsData.flightsData.flights.sort(by: {$0.price < $1.price} )
            self.tableView.reloadData()
            })
        let takeOffAction = UIAlertAction(title: "Take Off Time", style: .default, handler: { action in
            FlightsData.flightsData.flights.sort(by: {$0.takeoffTime < $1.takeoffTime} )
            self.tableView.reloadData()
        })
        let landingAction = UIAlertAction(title: "Landing Time", style: .default, handler: { action in
            FlightsData.flightsData.flights.sort(by: {$0.landingTime < $1.landingTime} )
            self.tableView.reloadData()
        })
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil )
        alertView.addAction(priceAction)
        alertView.addAction(takeOffAction)
        alertView.addAction(landingAction)
        alertView.addAction(dismissAction)
        self.present(alertView,animated: true)
    }
    
}
