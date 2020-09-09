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
        persons = processingDataV2(data: data)
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
}

extension FirstTableViewController {
    private func processingDataV2(data: DataManager) -> [Person] {
        var person: [Person] = []
        
        var names: Set<String> = Set(data.names)
        var surnames: Set<String> = Set(data.surnames)
        var phones: Set<String> = Set(data.phones)
        var emails: Set<String> = Set(data.emails)
        
        for _ in 0 ..< names.count {
            person.append(Person(name: names.removeFirst(), surname: surnames.removeFirst(), phone: phones.removeFirst(), email: emails.removeFirst()))
        }
        return person
    }
}
