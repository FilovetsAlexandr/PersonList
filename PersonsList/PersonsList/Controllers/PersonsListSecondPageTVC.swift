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

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        let person = PersonsTVC.persons[indexPath.section]
        
        cell.emailPersonLbl.text = person.email
        cell.phonePersonLbl.text = person.phoneNumber

        return cell
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return PersonsTVC.persons.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? { PersonsTVC.persons[section].name }
    
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
            let header = view as! UITableViewHeaderFooterView
            header.textLabel?.textColor = .white
            header.backgroundConfiguration?.backgroundColor = .darkGray
            header.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 17)
        }
}
