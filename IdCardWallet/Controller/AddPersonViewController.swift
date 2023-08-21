//
//  AddPersonViewController.swift
//  IdCardWallet
//
//  Created by Billbert Pohandy on 20/07/23.
//

import UIKit

class AddPersonViewController: UIViewController, SocialMediaDelegate, TextFieldIDDelegate {
    func getValue(value: String?) {
        print(value ?? "No Value")
    }

    @IBOutlet weak var fullnameField: TextFieldID!
    @IBOutlet weak var phoneNumberField: TextFieldID!
    @IBOutlet weak var emailField: TextFieldID!
    @IBOutlet weak var addressField: TextFieldID!
    @IBOutlet weak var birthdayField: TextFieldID!
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    @IBOutlet weak var linkedInField: TextFieldID!
    @IBOutlet weak var instagramField: TextFieldID!
    @IBOutlet weak var note: UIButton!
    @IBOutlet weak var reminder: UIButton!
    @IBOutlet weak var selectedSocialMediaLabel: UILabel!
    @IBOutlet weak var socialMediaTextField: UITextField!

    func didSelectSocialMedia(_ socialMedia: String) {
        print("Selected social m: \(socialMedia)")
        print(socialMedia)
        selectedSocialMediaLabel.text = socialMedia
        socialMediaTextField.placeholder = "Enter your \(socialMedia) handle"
    }

    @IBAction func addSocialMediaButtonTapped(_ sender: UIButton) {
        // Navigate to the SocialMediaController
        let socialMediaNavigationView = UIStoryboard(
            name: "AddPersonView",
            bundle: nil
        ).instantiateViewController(
            withIdentifier: "SocialMediaController"
        )

        guard let socialMediaController = socialMediaNavigationView.children.first as? SocialMediaController else {
            return
        }

        socialMediaController.delegate = self
        socialMediaNavigationView.modalPresentationStyle = .pageSheet

        self.present(socialMediaNavigationView, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let backButton = UIBarButtonItem()
        backButton.title = "Person"
        backButton.tintColor = .white

        let appearance =  UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0.035, green: 0.173, blue: 0.298, alpha: 1)
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance =
            navigationController?.navigationBar.standardAppearance

        let textAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
        appearance.titleTextAttributes = textAttributes
        appearance.largeTitleTextAttributes = textAttributes // For large titles

        // Apply the appearance to the navigation bar
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance =
            navigationController?.navigationBar.standardAppearance

        // Ensure the appearance is not affected by the system's appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactScrollEdgeAppearance = appearance

        fullnameField.setupView(placeholders: "e.g. Mark Lee", labels: "Fullname", delegates: self)
        phoneNumberField.setupView(placeholders: "e.g. 081234567890", labels: "Phone Number", delegates: self)
        emailField.setupView(placeholders: "e.g. mark@sment.kr", labels: "Email", delegates: self)
        addressField.setupView(placeholders: "e.g. Korea, Seoul", labels: "Address", delegates: self)
        birthdayField
            .setupView(placeholders: "Pick to choose", labels: "Birthday", delegates: self)
        linkedInField
            .setupView(placeholders: "e.g. https://id.linkedin.com/marklee", labels: "LinkedIn", delegates: self)
        instagramField
            .setupView(placeholders: "e.g. https://id.instagram.com/marklee", labels: "Instagram", delegates: self)

        fullnameField.delegate = self
        phoneNumberField.delegate = self
        emailField.delegate = self
        addressField.delegate = self
        birthdayField.delegate = self

    }

    @IBAction func saveAction(_ sender: UIBarButtonItem) {
        let occupations = "Software Developer"
        let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext

        let newPeople = PersonData(context: managedContext)
        newPeople.setValue(fullnameField.textInput.text, forKey: #keyPath(PersonData.fullName))
        newPeople.setValue(occupations, forKey: #keyPath(PersonData.occupation))

        let newPeopleDetail = PersonDetail(context: managedContext)
        newPeopleDetail.setValue(fullnameField.textInput.text, forKey: #keyPath(PersonDetail.personFullName))
        newPeopleDetail.setValue(addressField.textInput.text, forKey: #keyPath(PersonDetail.address))
        newPeopleDetail.setValue(emailField.textInput.text, forKey: #keyPath(PersonDetail.email))
        newPeopleDetail.setValue(phoneNumberField.textInput.text, forKey: #keyPath(PersonDetail.phoneNumber))
        newPeopleDetail.setValue(Date(), forKey: #keyPath(PersonDetail.birthday))

       AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
       self.navigationController?.popViewController(animated: true)
    }

    @IBAction func addReminderAction(_ sender: Any) {
        let remiderSheet = ReminderSheet(title: "Add Reminder")
        let navigationController = UINavigationController(rootViewController: remiderSheet)
        present(navigationController, animated: true)
    }
    @IBAction func addNoteAction(_ sender: Any) {
        let noteSheet = AddNoteSheet(title: "Add Note")
        let navigationController = UINavigationController(rootViewController: noteSheet)
        present(navigationController, animated: true)
    }
}
