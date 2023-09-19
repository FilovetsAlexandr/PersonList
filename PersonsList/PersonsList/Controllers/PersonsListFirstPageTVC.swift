import UIKit

final class PersonsListFirstPageTVC: UITableViewController {
    private var isEditingEnabled = false

    @IBOutlet var buttonUI: UIButton!

    @IBAction func editButtonTapped(_ sender: UIButton) {
        isEditingEnabled = !isEditingEnabled
        tableView.setEditing(isEditingEnabled, animated: true)
        let buttonText = isEditingEnabled ? "Done" : "Edit"
        buttonUI.setTitle(buttonText, for: .normal)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        PersonsTVC.getPersons()
        navigationItem.title = "Persons list"
        isEditingEnabled = false
        tableView.isEditing = false
        buttonUI.setTitle("Edit", for: .normal)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { PersonsTVC.persons.count }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let person = PersonsTVC.persons[indexPath.row]
        cell.textLabel?.text = person.name
        return cell
    }

    // Перетаскивание ячеек
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool { isEditingEnabled }

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        guard isEditingEnabled else { return }
        let person = PersonsTVC.persons[sourceIndexPath.row]
        PersonsTVC.persons.remove(at: sourceIndexPath.row)
        PersonsTVC.persons.insert(person, at: destinationIndexPath.row)
    }

    // Удаление ячеек
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool { true }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            PersonsTVC.persons.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    // Переход на подробную информацию
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsViewController" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let detailsVC = segue.destination as! DetailsViewController
                detailsVC.detailPerson = PersonsTVC.persons[indexPath.row]
                // изменяем имя навигейшн бара
                detailsVC.navigationItem.title = PersonsTVC.persons[indexPath.row].name
            }
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { performSegue(withIdentifier: "DetailsViewController", sender: self) }
}
