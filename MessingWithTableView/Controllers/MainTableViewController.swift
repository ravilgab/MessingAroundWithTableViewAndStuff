//
//  MainTableViewController.swift
//  MessingWithTableView
//
//  Created by Ravil on 27.11.2021.
//

import UIKit

class MainTableViewController: UITableViewController {

    let cafes = Cafe.getCafes()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //tableView.rowHeight = 100
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cafes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        // var content = cell.contentConfiguration
        // let cafe = cafeNames[indexPath.row]
        
        cell.nameOfCafeLabel.text = cafes[indexPath.row].name
        cell.locationOfCafeLabel.text = cafes[indexPath.row].location
        cell.typeOfCafeLabel.text = cafes[indexPath.row].type
        cell.imageOfCafe.image = UIImage(named: cafes[indexPath.row].image)
        cell.imageOfCafe.layer.cornerRadius = cell.imageOfCafe.frame.size.height / 2
        
        // cell.contentConfiguration = content
        return cell
    }
}
