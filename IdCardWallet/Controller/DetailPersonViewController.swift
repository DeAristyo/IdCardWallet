//
//  DetailPersonViewController.swift
//  IdCardWallet
//
//  Created by Billbert Pohandy on 28/07/23.
//

import UIKit



class DetailPersonViewController: UIViewController {
    @IBOutlet weak var buttonSementara: UIBarButtonItem!
    
    let labels: [String] = ["Contacts", "Fullname", "Email", "Phone Number", "Address", "Job", "Company"]
    
    let contacts = [
        Form(title: "Fullname", value: "Michelle"),
        Form(title: "Email", value: "michelle@gmail.com"),
        Form(title: "Phone Number", value: "081234567890"),
        Form(title: "Address", value: "Address 123"),
        Form(title: "Job", value: "Ios Dev"),
        Form(title: "Company", value: "ABC Corp")
    ]
    
    let socialMedia: [Form] = [
            Form(title: "LinkedIn", value: "https://www.linkedin.com/in/michelle"),
            Form(title: "Instagram", value: "https://www.instagram.com/michelle"),
        ]
    
    let note: Form = Form(title: "", value: "View All Notes")
    let reminder: Form = Form(title: "", value: "View All Reminder")

    private let tableView: UITableView = {
        let tableView = UITableView()
//        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(named: "BackgroundColor")
        tableView.register(DetailTableCell.self, forCellReuseIdentifier: DetailTableCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none

        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let actionEditDetail = UIAction(title: "Edit Detail", image: UIImage(named: "editProfileImage")) { [weak self] action in
            guard let self = self else { return }

            // Instantiate your EditPersonController from the storyboard
            let storyboard = UIStoryboard(name: "DetailPersonView", bundle: nil)
            let editPersonController = storyboard.instantiateViewController(withIdentifier: "EditPersonControllerID") as! EditPersonController

            // Set the presentation style to full screen
            editPersonController.modalPresentationStyle = .fullScreen

            // Instead of presenting from self, present the EditPersonController from the navigation controller
            self.navigationController?.pushViewController(editPersonController, animated: true)
        }

        
        let actionNote = UIAction(title: "Add Note", image: UIImage(named: "addNoteImage")) { action in
            let vc = AddNoteSheet(title: "Add Note")
            let navVc = UINavigationController(rootViewController: vc)
            self.present(navVc, animated: true)
            print("action Add Note clicked")
        }
        
        let actionReminder = UIAction(title: "Add Reminder", image: UIImage(named: "reminderImage")) { action in
            let vc = ReminderSheet(title: "Add Reminder")
            let navVc = UINavigationController(rootViewController: vc)
            self.present(navVc, animated: true)
            print("action Ad Reminder clicked")
        }
        let actionDelete = UIAction(title: "Delete", image: UIImage(named: "deleteImage")) { action in
            print("action Delete clicked")
            
        }
        let menu = UIMenu(title: "", children: [actionEditDetail, actionNote, actionReminder, actionDelete])
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(named: "detailIcon"), primaryAction: nil, menu: menu)
        navigationItem.rightBarButtonItem?.tintColor = .white
        
        self.navigationItem.title = "Detail Person"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.sizeToFit()
        self.navigationController?.navigationBar.backgroundColor = UIColor(named: "PrimaryColor")
        let backButton = UIBarButtonItem()
        backButton.title = "Person"
        backButton.tintColor = .white
        view.backgroundColor = .white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        view.backgroundColor = .white
        
        self.navigationItem.title = "Detail Person"
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
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
//            tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        let contactsLabel = UILabel()
            contactsLabel.text = "Contacts"
            contactsLabel.font = UIFont.boldSystemFont(ofSize: 24)
            contactsLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(contactsLabel)
    }
}


extension DetailPersonViewController: UITableViewDataSource {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableCell.identifier, for: indexPath) as! DetailTableCell
        cell.backgroundColor = .white

        switch indexPath.section {
        case 0:
            cell.setupView(titleName: contacts[indexPath.row].value, subtitleName: contacts[indexPath.row].title as! String)
        case 1:
            cell.setupView(titleName: socialMedia[indexPath.row].value, subtitleName: socialMedia[indexPath.row].title as! String)
        case 2:
            cell.setupView(titleName: note.title, subtitleName: note.value as! String)
            cell.accessoryType = .disclosureIndicator // Add a disclosure indicator to the Note cell
            cell.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(noteCellTapped))
                       cell.addGestureRecognizer(tapGesture)
        case 3:
            cell.setupView(titleName: reminder.title, subtitleName: reminder.value as! String)
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
        navigationController?.pushViewController(NoteList(), animated: true)
        // Here you can present a new view controller or perform any action you want.
    }
    @objc func reminderCellTapped() {
        // Handle the tap action for the Note cell
        print("Reminder cell tapped!")
        navigationController?.pushViewController(ReminderList(), animated: true)
        // Here you can present a new view controller or perform any action you want.
    }
}
