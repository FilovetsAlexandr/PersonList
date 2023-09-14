import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var namePersonLbl: UILabel!
    @IBOutlet var emailPersonLbl: UILabel!
    @IBOutlet var phonePersonLbl: UILabel!

    override func awakeFromNib() { super.awakeFromNib() }
    override func setSelected(_ selected: Bool, animated: Bool) { super.setSelected(selected, animated: animated) }
}
