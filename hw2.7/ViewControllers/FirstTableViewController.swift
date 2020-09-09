//
//  FirstTableViewController.swift
//  hw2.7
//
//  Created by Konstantin on 08.09.2020.
//  Copyright © 2020 Konstantin. All rights reserved.
//

import UIKit

class FirstTableViewController: UITableViewController {

    let data = DataManager()
    var persons: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        persons = processingData(data: data)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell",
                                                 for: indexPath)
        let person = persons[indexPath.row]
        cell.textLabel?.text = "\(person.name ?? "Name") \(person.surname ?? "Surname")"
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        guard let DetailPersonVS = segue.destination as? DetailPersonViewController
            else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        DetailPersonVS.person = persons[indexPath.row]
        
        
    }

    func processingData(data: DataManager) -> [Person] {
        var persons: [Person] = []

        for i in 0 ..< data.names.count {

            let name = data.names[i] 
            let surname = data.surnames[i]
            let email = data.emails[i]
            let phone = data.phones[i]

            persons.append(Person(name: name,
                                  surname: surname,
                                  phone: phone,
                                  email: email))
        }
        return persons
    }
}