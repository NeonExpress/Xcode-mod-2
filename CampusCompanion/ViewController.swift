//
//  ViewController.swift
//  CampusCompanion
//
//  Created by JAYMAR DELOS SANTOS on 10/1/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var notifySwitch: UISwitch!
    @IBOutlet weak var roleSegmentedControl: UISegmentedControl!
    @IBOutlet weak var eventDatePicker: UIDatePicker!
    @IBOutlet weak var guestStepper: UIStepper!
    @IBOutlet weak var guestCountLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Campus Companion"
        guestCountLabel.text = "Guests: 1"
    }

    @IBAction func getStartedTapped(_ sender: UIButton) {
        subtitleLabel.text = "Let's get Started!"
    }

    @IBAction func exploreButtonTapped(_ sender: UIButton) {
        nameTextField.resignFirstResponder()
        performSegue(withIdentifier: "ShowDetailSegue", sender: self)
    }

    @IBAction func guestStepperChanged(_ sender: UIStepper) {
        guestCountLabel.text = "Guests: \(Int(sender.value))"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowDetailSegue" else {
            return
        }

        let destination: DetailViewController?
        if let navigationController = segue.destination as? UINavigationController {
            destination = navigationController.topViewController as? DetailViewController
        } else {
            destination = segue.destination as? DetailViewController
        }
        guard let destination else { return }

        let enteredName = nameTextField.text ?? ""
        destination.studentName = enteredName.isEmpty ? "Student" : enteredName
        destination.notificationsEnabled = notifySwitch.isOn
        destination.selectedRole = roleSegmentedControl.selectedSegmentIndex == 0 ? "Student" : "Faculty"
        destination.preferredEventDate = eventDatePicker.date
        destination.numberOfGuests = max(Int(guestStepper.value), 1)
    }

}

