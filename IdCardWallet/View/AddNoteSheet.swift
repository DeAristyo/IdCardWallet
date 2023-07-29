//
//  AddNoteSheet.swift
//  IdCardWallet
//
//  Created by Billbert Pohandy on 27/07/23.
//

import Foundation
import UIKit

class AddNoteSheet: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Add Note"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        
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
    }
    @objc func ngecancel() {
        print("udah cancel")
    }
    @objc func ngesave() {
        print("udah save")
    }
}
