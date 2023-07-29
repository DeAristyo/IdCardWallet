//
//  DetailPersonViewController.swift
//  IdCardWallet
//
//  Created by Billbert Pohandy on 28/07/23.
//

import UIKit

struct Forms {
    let title: String
    let value: Any
}

class DetailPersonViewController: UIViewController {
    @IBOutlet weak var buttonSementara: UIBarButtonItem!
    
    let labels: [String] = ["Contacts", "Fullname", "Email", "Phone Number", "Address", "Job", "Company"]
    
    let contacts = [
        Forms(title: "Fullname", value: "Michelle"),
        Forms(title: "Email", value: "michelle@gmail.com"),
        Forms(title: "Phone Number", value: "081234567890"),
        Forms(title: "Address", value: "Address 123"),
        Forms(title: "Job", value: "Ios Dev"),
        Forms(title: "Company", value: "ABC Corp")
    ]
    
    let socialMedia: [Forms] = [
            Forms(title: "LinkedIn", value: "https://www.linkedin.com/in/michelle"),
            Forms(title: "Instagram", value: "https://www.instagram.com/michelle"),
        ]
    
    let note: Forms = Forms(title: "", value: "View All Notes")
    let reminder: Forms = Forms(title: "", value: "View All Reminder")

    private let tableView: UITableView = {
        let tableView = UITableView()
//        tableView.separatorStyle = .none
        tableView.backgroundColor = .red
        tableView.register(DetailTableCell.self, forCellReuseIdentifier: DetailTableCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false

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
            self.navigationController?.pushViewController(editPersonController, animated: false)
        }

        
        let actionNote = UIAction(title: "Add Note", image: UIImage(named: "addNoteImage")) { action in
            print("action add clicked")
            
        }
        let actionReminder = UIAction(title: "Add Reminder", image: UIImage(named: "reminderImage")) { action in
            print("action add clicked")
            
        }
        let actionDelete = UIAction(title: "Delete", image: UIImage(named: "deleteImage")) { action in
            print("action add clicked")
            
        }
        let menu = UIMenu(title: "", children: [actionEditDetail,actionNote, actionReminder, actionDelete])
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(named: "detailIcon"), primaryAction: nil, menu: menu)
        
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationController?.navigationBar.isHidden = false
        
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
            cell.setupView(titleName: contacts[indexPath.row].title, subtitleName: contacts[indexPath.row].value as! String)
        case 1:
            cell.setupView(titleName: socialMedia[indexPath.row].title, subtitleName: socialMedia[indexPath.row].value as! String)
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
        // Here you can present a new view controller or perform any action you want.
    }
    @objc func reminderCellTapped() {
        // Handle the tap action for the Note cell
        print("Reminder cell tapped!")
        // Here you can present a new view controller or perform any action you want.
    }
}