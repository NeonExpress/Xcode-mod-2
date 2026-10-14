import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!

    var studentName: String = "Student"
    var notificationsEnabled: Bool = false
    var selectedRole: String = "Student"
    var preferredEventDate: Date = Date()
    var numberOfGuests: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Campus Events"

        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        let notificationStatus = notificationsEnabled ? "on" : "off"
        messageLabel.text = "Welcome, \(studentName)! (\(selectedRole))\nNotifications: \(notificationStatus)\nEvent date: \(formatter.string(from: preferredEventDate))\nGuests: \(numberOfGuests)"
    }
}
