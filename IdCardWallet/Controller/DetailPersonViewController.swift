//
//  DetailPersonViewController.swift
//  IdCardWallet
//
//  Created by Billbert Pohandy on 28/07/23.
//

import UIKit
import CoreData

class DetailPersonViewController: UIViewController {
    @IBOutlet weak var buttonSementara: UIBarButtonItem!

    var detailPerson = [PersonDetail]()

    var fullNamePersonDetail: String = ""

    var contacts = [
        Form(title: "Fullname", value: "Michelle"),
        Form(title: "Email", value: "michelle@gmail.com"),
        Form(title: "Phone Number", value: "081234567890"),
        Form(title: "Address", value: "Address 123"),
        Form(title: "Job", value: "Ios Dev"),
        Form(title: "Company", value: "ABC Corp")
    ]

    let socialMedia: [Form] = [
        Form(title: "LinkedIn", value: "https://www.linkedin.com/in/michelle"),
        Form(title: "Instagram", value: "https://www.instagram.com/michelle")
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

    func setupNavigation() {
        let actionEditDetail = UIAction(
            title: "Edit Detail",
            image: UIImage(named: "editProfileImage")
        ) {[weak self] _ in
            guard let self = self else { return }
            // Instantiate your EditPersonController from the storyboard
            let storyboard = UIStoryboard(name: "DetailPersonView", bundle: nil)
            guard let editPersonController =
                    storyboard.instantiateViewController(withIdentifier: "EditPersonControllerID")
                    as? EditPersonController
            else {
                return
            }

            // Set the presentation style to full screen
            editPersonController.modalPresentationStyle = .fullScreen

            // Instead of presenting from self, present the EditPersonController from the navigation controller
            self.navigationController?.pushViewController(editPersonController, animated: true)
        }

        let actionNote = UIAction(title: "Add Note", image: UIImage(named: "addNoteImage")) {_ in
            let noteSheet = AddNoteSheet(title: "Add Note")
            let dataSender = AddNoteSheet()
            dataSender.rightButtonAction(fullName: self.fullNamePersonDetail)
            let navigationController = UINavigationController(rootViewController: noteSheet)
            self.present(navigationController, animated: true)
            print("action Add Note clicked")
        }

        let actionReminder = UIAction(title: "Add Reminder", image: UIImage(named: "reminderImage")) { _ in
            let reminderSheet = ReminderSheet(title: "Add Reminder")
            let navigationController = UINavigationController(rootViewController: reminderSheet)
            self.present(navigationController, animated: true)
            print("action Ad Reminder clicked")
        }
        let actionDelete = UIAction(title: "Delete", image: UIImage(named: "deleteImage")) { _ in
            print("action Delete clicked")
        }
        let menu = UIMenu(title: "", children: [actionEditDetail, actionNote, actionReminder, actionDelete])

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: nil,
            image: UIImage(named: "detailIcon"),
            primaryAction: nil,
            menu: menu
        )
        navigationItem.rightBarButtonItem?.tintColor = .white

        self.navigationItem.title = "Detail Person"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.sizeToFit()
        self.navigationController?.navigationBar.backgroundColor = UIColor(named: "PrimaryColor")
        let backButton = UIBarButtonItem()
        backButton.title = "Person"
        backButton.tintColor = .white

        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

        self.navigationItem.title = "Detail Person"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

       setupNavigation()

        view.backgroundColor = .white
        tableView.dataSource = self

        view.addSubview(tableView)

        setupLayout()
    }

    func getPeopleList(fullName: String) {
        print("id", fullName)
        fullNamePersonDetail = fullName
        let personDetailFetch: NSFetchRequest<PersonDetail> = PersonDetail.fetchRequest()
        personDetailFetch.predicate = NSPredicate(format: "personFullName == %@", fullName )
        //   let sortByDate = NSSortDescriptor(key: #keyPath(PersonDetail.dateAdded), ascending: false)
        //   personDataFetch.sortDescriptors = [sortByDate]
        do {
            let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let results = try managedContext.fetch(personDetailFetch)
            detailPerson = results

            let detailPersonData = detailPerson[0]

            contacts = [
                Form(title: "Fullname", value: detailPersonData.personFullName  ?? "fullname"),
                Form(title: "Email", value: detailPersonData.email ?? "email"),
                Form(title: "Phone Number", value: detailPersonData.phoneNumber ?? "phone number"),
                Form(title: "Address", value: detailPersonData.address ?? "address"),
                Form(title: "Job", value: detailPersonData.occupation ?? "job")
                //                Form(title: "Company", value: detailPersonData. ?? "phone number")
            ]

            print("person list", detailPerson[0].personFullName ?? "test")
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")
        }
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
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
        case 3:
            return 1
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: DetailTableCell.identifier,
            for: indexPath
        ) as? DetailTableCell
        cell?.backgroundColor = .white

        switch indexPath.section {
        case 0:
            cell?.setupView(
                titleName: contacts[indexPath.row].value,
                subtitleName: String(contacts[indexPath.row].title)
            )
        case 1:
            cell?.setupView(
                titleName: socialMedia[indexPath.row].value,
                subtitleName: String(socialMedia[indexPath.row].title)
            )
        case 2:
            cell?.setupView(titleName: note.title, subtitleName: String(note.value))
            cell?.accessoryType = .disclosureIndicator // Add a disclosure indicator to the Note cell
            cell?.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(noteCellTapped))
            cell?.addGestureRecognizer(tapGesture)
        case 3:
            cell?.setupView(titleName: reminder.title, subtitleName: String(reminder.value))
            cell?.accessoryType = .disclosureIndicator // Add a disclosure indicator to the Note cell
            cell?.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(reminderCellTapped))
            cell?.addGestureRecognizer(tapGesture)
        default:
            break
        }

        return cell!
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
