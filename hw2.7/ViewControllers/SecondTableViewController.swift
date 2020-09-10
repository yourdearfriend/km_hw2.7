//
//  SecondTableViewController.swift
//  hw2.7
//
//  Created by Konstantin on 09.09.2020.
//  Copyright © 2020 Konstantin. All rights reserved.
//
//protocol dataDelegate {
//    func passPersons()
//}

import UIKit

class SecondTableViewController: UITableViewController {
    
    var personsCurrent: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        let person = personsCurrent[indexPath.row]
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = person.email
            cell.imageView?.image = UIImage(systemName: "message")
        case 1:
            cell.textLabel?.text = person.phone
            cell.imageView?.image = UIImage(systemName: "phone")
        default:
            break
        }
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        personsCurrent.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "\(personsCurrent[section].name ?? "Name") \(personsCurrent[section].surname ?? "Surname")"
    }
}
