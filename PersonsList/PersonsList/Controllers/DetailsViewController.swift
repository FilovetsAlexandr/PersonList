import UIKit

final class DetailsViewController: UIViewController {
    var detailPerson: PersonsTVC.Person?

    @IBOutlet var detailsEmailLbl: UILabel!
    @IBOutlet var detailsPhoneLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setDetail(person: detailPerson)
    }

    func setDetail(person: PersonsTVC.Person?) {
        if let person = person {
            detailsEmailLbl.text = person.email
            detailsPhoneLbl.text = person.phoneNumber
        }
    }
}
