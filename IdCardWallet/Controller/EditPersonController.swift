//
//  EditPersonController.swift
//  IdCardWallet
//
//  Created by Billbert Pohandy on 29/07/23.
//

import UIKit

class EditPersonController: UIViewController, textFieldIDDelegate {
    func getValue(value: String?) {
        print(value)
    }
    
  
//    @IBOutlet weak var UsernameProfiles: TextFieldID!
//    @IBOutlet weak var EmailProfiles: TextFieldID!
//    @IBOutlet weak var PhoneNumberProfiles: TextFieldID!
//    @IBOutlet weak var AddressProfiles: TextFieldID!
//    @IBOutlet weak var JobProfiles: TextFieldID!
//    @IBOutlet weak var CompanyProfiles: TextFieldID!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let cancelAttributes: [NSAttributedString.Key: Any] = [
                   .foregroundColor: UIColor.gray, // Set the desired color for Cancel button
                   .font: UIFont.systemFont(ofSize: 17) // Set the desired font for Cancel button
               ]
               let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(ngecancel))
               cancelButton.setTitleTextAttributes(cancelAttributes, for: .normal)
               self.navigationItem.leftBarButtonItem = cancelButton
   
        let saveAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.init(red: 9/255.0, green: 44/255.0, blue: 76/255.0, alpha: 1), // Set the desired color for Save button
                    .font: UIFont.boldSystemFont(ofSize: 17) // Set the desired font for Save button
                ]
                let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(ngesave))
                saveButton.setTitleTextAttributes(saveAttributes, for: .normal)
                self.navigationItem.rightBarButtonItem = saveButton

                // ... (your existing code)
            
        
        
            navigationController?.navigationBar.prefersLargeTitles = true
            title = "Edit Person"
        
//  UsernameProfiles.setupView(placeholders: "e.g. Shawn Mendes", labels: "Fullname", delegates: self)
//        EmailProfiles.setupView(placeholders: "e.g. shawnmendes@gmail.com", labels: "Email", delegates: self)
//        PhoneNumberProfiles.setupView(placeholders: "e.g. 081234567890", labels: "Phone Number", delegates: self)
//        AddressProfiles.setupView(placeholders: "e.g. Ontario, Canada", labels: "Address", delegates: self)
//        JobProfiles.setupView(placeholders: "e.g. Singer", labels: "Job", delegates: self)
//        CompanyProfiles.setupView(placeholders: "e.g. Universal Music Canada", labels: "Company", delegates: self)

        
        
        
    }
    
    @objc func ngecancel() {
        print("udah cancel")
        navigationController?.popViewController(animated: true)
    }
    @objc func ngesave() {
        print("udah save")
    }
//    func getValue(value: String?) {
//        print(value)
//    }
    @objc func showEditPersonController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editPersonController = storyboard.instantiateViewController(withIdentifier: "EditPersonControllerID") as! EditPersonController
        navigationController?.pushViewController(editPersonController, animated: false)
    }
}
