//
//  AddPersonViewController.swift
//  IdCardWallet
//
//  Created by Billbert Pohandy on 20/07/23.
//

import UIKit

class AddPersonViewController: UIViewController{
    
    @IBOutlet weak var FullnameField: TextFieldID!
    @IBOutlet weak var PhoneNumberField: TextFieldID!
    @IBOutlet weak var EmailField: TextFieldID!
    @IBOutlet weak var AddressField: TextFieldID!
    @IBOutlet weak var BirthdayField: TextFieldID!
    @IBOutlet weak var SocialMedia: UIButton!
    @IBOutlet weak var Note: UIButton!
    @IBOutlet weak var Reminder: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appearance =  UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0.035, green: 0.173, blue: 0.298, alpha: 1)
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance

        let textAttributes: [NSAttributedString.Key: Any] = [
                   .foregroundColor: UIColor.white,
               ]
               appearance.titleTextAttributes = textAttributes
               appearance.largeTitleTextAttributes = textAttributes // For large titles

               // Apply the appearance to the navigation bar
               navigationController?.navigationBar.standardAppearance = appearance
               navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance

               // Ensure the appearance is not affected by the system's appearance
               navigationController?.navigationBar.compactAppearance = appearance
               navigationController?.navigationBar.scrollEdgeAppearance = appearance
               navigationController?.navigationBar.compactScrollEdgeAppearance = appearance
        
        FullnameField.setupView(placeholders: "e.g. Mark Lee", labels: "Fullname", delegates: self)
        
        PhoneNumberField.setupView(placeholders: "e.g. 081234567890", labels: "Phone Number", delegates: self)
        
        EmailField.setupView(placeholders: "e.g. mark@sment.kr", labels: "Email", delegates: self)
        
        AddressField.setupView(placeholders: "e.g. Korea, Seoul", labels: "Address", delegates: self)

        BirthdayField
            .setupView(placeholders: "Pick to choose", labels: "Birthday", delegates: self)
                               
        
            
    }
  
}

//protocol SocialMediaSelectionDelegate: AnyObject {
//    func didSelectSocialMedia(platform: String)
//}

extension AddPersonViewController: textFieldIDDelegate{
    func getValue(value: String?) {
        print(value)
    }
}
