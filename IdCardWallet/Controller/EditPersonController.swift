//
//  EditPersonController.swift
//  IdCardWallet
//
//  Created by Billbert Pohandy on 29/07/23.
//

import UIKit

struct Formss {
    let title: String
    let value: Any
//    var isEditable: Bool
}

class EditPersonController: UIViewController, textFieldIDDelegate {
    func getValue(value: String?) {
        print(value)
    }
    
    let labels: [String] = ["Contacts", "Fullname", "Email", "Phone Number", "Address", "Job", "Company"]
    
    let contacts = [
        Formss(title: "Fullname", value: "Michelle"),
        Formss(title: "Email", value: "michelle@gmail.com"),
        Formss(title: "Phone Number", value: "081234567890"),
        Formss(title: "Address", value: "Address 123"),
        Formss(title: "Job", value: "Ios Dev"),
        Formss(title: "Company", value: "ABC Corp")
    ]
    
    let socialMedia: [Formss] = [
            Formss(title: "LinkedIn", value: "https://www.linkedin.com/in/michelle"),
            Formss(title: "Instagram", value: "https://www.instagram.com/michelle"),
        ]
    
    let note: Formss = Formss(title: "", value: "View All Notes")
    let reminder: Formss = Formss(title: "", value: "View All Reminder")

  
    private let tableView: UITableView = {
        let tableView = UITableView()
//        tableView.separatorStyle = .none
        tableView.backgroundColor = .red
        tableView.register(EditTableCell.self, forCellReuseIdentifier: EditTableCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()
    
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

            
        
        
        let appearance =  UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0.035, green: 0.173, blue: 0.298, alpha: 1)
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        
        
        let textAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
        ]
        appearance.titleTextAttributes = textAttributes
        appearance.largeTitleTextAttributes = textAttributes
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactScrollEdgeAppearance = appearance
        
        self.navigationItem.title = "Edit Person"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.dataSource = self
//        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        setupLayout()
    }
    func setupLayout(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
//            tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        let contactsLabel = UILabel()
            contactsLabel.text = "Contacts"
            contactsLabel.font = UIFont.boldSystemFont(ofSize: 24)
            contactsLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(contactsLabel)
    
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

extension EditPersonController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4 // Three sections: Contacts, Social Media, and Note
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return contacts.count
        case 1:
            return socialMedia.count
        case 2:
            return 1
        case 3 :
            return 1
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EditTableCell.identifier, for: indexPath) as! EditTableCell
        cell.backgroundColor = .white

        switch indexPath.section {
        case 0:
            cell.setupView(placeholder: contacts[indexPath.row].value as! String, label: contacts[indexPath.row].title, delegates: self)
        case 1:
            cell.setupView(placeholder: socialMedia[indexPath.row].value as! String, label: socialMedia[indexPath.row].title, delegates: self)
        case 2:
            cell.setupView(placeholder: note.value as! String, label: note.title, delegates: self)
            cell.accessoryType = .disclosureIndicator // Add a disclosure indicator to the Note cell
            cell.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(noteCellTapped))
                       cell.addGestureRecognizer(tapGesture)
        case 3:
            cell.setupView(placeholder: reminder.value as! String, label: reminder.title, delegates: self)
            cell.accessoryType = .disclosureIndicator // Add a disclosure indicator to the Note cell
            cell.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(reminderCellTapped))
                       cell.addGestureRecognizer(tapGesture)
        default:
            break
        }

        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Contacts"
        case 1:
            return "Social Media"
        case 2:
            return "Note"
        case 3:
            return "Reminder"
        default:
            return nil
        }
    }
    
    @objc func noteCellTapped() {
        // Handle the tap action for the Note cell
        print("Note cell tapped!")
        // Here you can present a new view controller or perform any action you want.
    }
    @objc func reminderCellTapped() {
        // Handle the tap action for the Note cell
        print("Reminder cell tapped!")
        // Here you can present a new view controller or perform any action you want.
    }
}

extension EditPersonController: EditTextFieldDelegate{
    func getValueEditField(value: String?){
        print(value)
    }
}
