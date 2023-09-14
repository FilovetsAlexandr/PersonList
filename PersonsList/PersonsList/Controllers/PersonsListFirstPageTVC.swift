import UIKit
    
class PersonsListFirstPageTVC: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Persons list"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { PersonsTVC.getPersons().count }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let person =  PersonsTVC.persons[indexPath.row]
        cell.textLabel?.text = person.name
        return cell
    }
}
