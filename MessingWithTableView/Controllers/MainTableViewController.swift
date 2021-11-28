//
//  MainTableViewController.swift
//  MessingWithTableView
//
//  Created by Ravil on 27.11.2021.
//

import UIKit

class MainTableViewController: UITableViewController {

    var cafes = Cafe.getCafes()
    
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
        let place = cafes[indexPath.row]
        
        cell.nameOfCafeLabel.text = place.name
        cell.locationOfCafeLabel.text = place.location
        cell.typeOfCafeLabel.text = place.type
        
        if place.image == nil {
            cell.imageOfCafe.image = UIImage(named: place.cafeImage!)
        } else {
            cell.imageOfCafe.image = place.image
        }
        
        cell.imageOfCafe.layer.cornerRadius = cell.imageOfCafe.frame.size.height / 2
        
        // cell.contentConfiguration = content
        return cell
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard let addCafeVC = segue.source as? AddCafeTableViewController else { return }
        
        addCafeVC.saveNewCafe()
        cafes.append(addCafeVC.newCafe!)
        tableView.reloadData()
    }
}
