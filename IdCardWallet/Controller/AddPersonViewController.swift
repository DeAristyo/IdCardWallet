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
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.navigationBar.barTintColor = .blue
//        navigationController?.navigationBar.isTranslucent = false
//        
        let appearance =  UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        
        FullnameField.setupView(placeholders: "e.g. Mark Lee", labels: "Fullname", delegates: self)
        
        PhoneNumberField.setupView(placeholders: "e.g. 081234567890", labels: "Phone Number", delegates: self)
        
        EmailField.setupView(placeholders: "e.g. mark@sment.kr", labels: "Email", delegates: self)
        
        AddressField.setupView(placeholders: "e.g. Korea, Seoul", labels: "Address", delegates: self)

        BirthdayField
            .setupView(placeholders: "Pick to choose", labels: "Birthday", delegates: self)
                               
        
            
    }
}

extension AddPersonViewController: textFieldIDDelegate{
    func getValue(value: String?) {
        print(value)
    }
}


