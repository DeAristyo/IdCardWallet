//
//  EditProfileController.swift
//  IdCardWallet
//
//  Created by Billbert Pohandy on 27/07/23.
//

import UIKit

class EditProfileController: UIViewController, TextFieldIDDelegate {
    func getValue(value: String?) {
        print(value ?? "No Value")
    }

    @IBOutlet weak var usernameProfile: TextFieldID!
    @IBOutlet weak var emailProfile: TextFieldID!
    @IBOutlet weak var phoneNumberProfile: TextFieldID!
    @IBOutlet weak var addressProfile: TextFieldID!
    @IBOutlet weak var jobProfile: TextFieldID!
    @IBOutlet weak var companyProfile: TextFieldID!

    override func viewDidLoad() {

        super.viewDidLoad()

        let cancelAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray, // Set the desired color for Cancel button
            .font: UIFont.systemFont(ofSize: 17) // Set the desired font for Cancel button
        ]
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(ngecancel))
        cancelButton.setTitleTextAttributes(cancelAttributes, for: .normal)
        self.navigationItem.leftBarButtonItem = cancelButton

        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(ngesave))
        saveButton.setTitleTextAttributes(cancelAttributes, for: .normal)
        self.navigationItem.rightBarButtonItem = saveButton

        self.navigationItem.title = "Edit Profile"
        self.navigationController?.navigationBar.prefersLargeTitles = true

        usernameProfile.setupView(placeholders: "e.g. Shawn Mendes", labels: "Fullname", delegates: self)
        emailProfile.setupView(placeholders: "e.g. shawnmendes@gmail.com", labels: "Email", delegates: self)
        phoneNumberProfile.setupView(placeholders: "e.g. 081234567890", labels: "Phone Number", delegates: self)
        addressProfile.setupView(placeholders: "e.g. Ontario, Canada", labels: "Address", delegates: self)
        jobProfile.setupView(placeholders: "e.g. Singer", labels: "Job", delegates: self)
        companyProfile.setupView(placeholders: "e.g. Universal Music Canada", labels: "Company", delegates: self)
    }

    @objc func ngecancel() {
        print("udah cancel")
        self.dismiss(animated: true)
    }
    @objc func ngesave() {
        print("udah save")
    }
    //    func getValue(value: String?) {
    //        print(value)
    //    }
}
