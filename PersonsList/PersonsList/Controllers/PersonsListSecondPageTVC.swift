//
//  PersonsListSecondPageTVC.swift
//  PersonsList
//
//  Created by Alexandr Filovets on 13.09.23.
//

import UIKit

class PersonsListSecondPageTVC: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Persons list"
    }

    override func numberOfSections(in tableView: UITableView) -> Int { 1 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { PersonsTVC.persons.count }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        let person = PersonsTVC.persons[indexPath.row]

        cell.namePersonLbl.text = person.name
        cell.emailPersonLbl.text = person.email
        cell.phonePersonLbl.text = person.phoneNumber

        return cell
    }
}
