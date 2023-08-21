//
//  AddPersonViewController.swift
//  IdCardWallet
//
//  Created by Billbert Pohandy on 20/07/23.
//

import UIKit

class AddPersonViewController: UIViewController, SocialMediaDelegate {
    
    @IBOutlet weak var fullNameField: TextFieldID!
    @IBOutlet weak var phoneNumberField: TextFieldID!
    @IBOutlet weak var emailField: TextFieldID!
    @IBOutlet weak var addressField: TextFieldID!
    @IBOutlet weak var birthdayField: TextFieldID!
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    @IBOutlet weak var linkedInField: TextFieldID!
    @IBOutlet weak var instagramField: TextFieldID!
    @IBOutlet weak var Note: UIButton!
    @IBOutlet weak var Reminder: UIButton!
    
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
            bundle: nil).instantiateViewController(withIdentifier: "SocialMediaController")
        
        let socialMediaController = socialMediaNavigationView.children.first as! SocialMediaController
        
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
        
        fullNameField.setupView(placeholders: "e.g. Mark Lee", labels: "Fullname", delegates: self)
        
        phoneNumberField.setupView(placeholders: "e.g. 081234567890", labels: "Phone Number", delegates: self)
        
        emailField.setupView(placeholders: "e.g. mark@sment.kr", labels: "Email", delegates: self)
        
        addressField.setupView(placeholders: "e.g. Korea, Seoul", labels: "Address", delegates: self)
        
        birthdayField
            .setupView(placeholders: "Pick to choose", labels: "Birthday", delegates: self)
        
        linkedInField
            .setupView(placeholders: "e.g. https://id.linkedin.com/marklee", labels: "LinkedIn", delegates: self)
        
        instagramField
            .setupView(placeholders: "e.g. https://id.instagram.com/marklee", labels: "Instagram", delegates: self)
        
        fullNameField.delegate = self
        phoneNumberField.delegate = self
        emailField.delegate = self
        addressField.delegate = self
        birthdayField.delegate = self
        
    }
    
    @IBAction func SaveAction(_ sender: UIBarButtonItem) {
        
        let occupations = "Software Developer"
        let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        
        let newPeople = PersonData(context: managedContext)
        newPeople.setValue(fullNameField.textInput.text, forKey: #keyPath(PersonData.fullName))
        newPeople.setValue(occupations, forKey: #keyPath(PersonData.occupation))
        
        let newPeopleDetail = PersonDetail(context: managedContext)
        newPeopleDetail.setValue(fullNameField.textInput.text, forKey: #keyPath(PersonDetail.personFullName))
        newPeopleDetail.setValue(addressField.textInput.text, forKey: #keyPath(PersonDetail.address))
        newPeopleDetail.setValue(emailField.textInput.text, forKey: #keyPath(PersonDetail.email))
        newPeopleDetail.setValue(phoneNumberField.textInput.text, forKey: #keyPath(PersonDetail.phoneNumber))
        newPeopleDetail.setValue(Date(), forKey: #keyPath(PersonDetail.birthday))
        
        do {
            try AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
            print("Dah ke save bang bismillahirohmanirohim ya allah tolong kami ya allah")
            self.navigationController?.popViewController(animated: true)
        } catch {
            fatalError()
            print("Astaghfirullahaladzim \(error.localizedDescription)")
        }
        
    }
    
    
    @IBAction func addReminderAction(_ sender: Any) {
        let vc = ReminderSheet(title: "Add Reminder")
        let navVc = UINavigationController(rootViewController: vc)
        present(navVc, animated: true)
    }
    @IBAction func addNoteAction(_ sender: Any) {
        let vc = AddNoteSheet(title: "Add Note")
        let navVc = UINavigationController(rootViewController: vc)
        present(navVc, animated: true)
    }
}

// protocol SocialMediaSelectionDelegate: AnyObject {
//    func didSelectSocialMedia(platform: String)
// }

extension AddPersonViewController: TextFieldIDDelegate {
    func getValue(value: String?) {
        print(value as Any)
    }
}
