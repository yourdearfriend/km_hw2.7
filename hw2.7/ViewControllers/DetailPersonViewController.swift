//
//  ViewController.swift
//  hw2.7
//
//  Created by Konstantin on 08.09.2020.
//  Copyright © 2020 Konstantin. All rights reserved.
//

import UIKit

class DetailPersonViewController: UIViewController {

    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    var person: Person!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(person.name ?? "Name") \(person.surname ?? "Surname")"
        phoneLabel.text = "Phone: \(person.phone ?? "empty")"
        emailLabel.text = "Email: \(person.email ?? "empty")"
    }
}
