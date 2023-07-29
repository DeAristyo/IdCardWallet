//
//  ProfileController.swift
//  IdCardWallet
//
//  Created by Billbert Pohandy on 28/07/23.
//

import Foundation
import UIKit

struct Form {
    let title: String
    let value: Any
}

class ProfileController: UIViewController {
    @IBOutlet weak var buttonSementara: UIBarButtonItem!
    
    
    let labels: [String] = ["Fullname", "Email", "Phone Number", "Address", "Job", "Company"]
    
    let x = [
        Form(title: "Fullname", value: "Michelle"),
        Form(title: "Email", value: "michelle@gmail.com"),
        Form(title: "Phone Number", value: "081234567890"),
        Form(title: "Address", value: "Address 123"),
        Form(title: "Job", value: "Ios Dev"),
        Form(title: "Company", value: "ABC Corp")
    ]
    
    var navigationBarAppearace = UINavigationBarAppearance()
//    let tableView = CustomTableView()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
//        tableView.separatorStyle = .none
        tableView.backgroundColor = .red
        tableView.register(DetailTableCell.self, forCellReuseIdentifier: DetailTableCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()
    
    private let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .magenta
        
        return containerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBarAppearace.configureWithOpaqueBackground()
        navigationBarAppearace.backgroundColor = UIColor(red: 0.035, green: 0.173, blue: 0.298, alpha: 1)
        navigationBarAppearace.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppearace.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        self.navigationController?.navigationBar.standardAppearance = navigationBarAppearace;
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let actionEditProfile = UIAction(title: "Edit Profile", image: UIImage(named: "editProfileImage")) { [weak self] action in
            guard let self = self else { return }

            // Instantiate your EditProfileController from the storyboard
            let storyboard = UIStoryboard(name: "AddPersonView", bundle: nil)
            let editProfileController = storyboard.instantiateViewController(withIdentifier: "EditProfileControllerID") as! EditProfileController

            // Present the EditProfileController modally
            let navigationController = UINavigationController(rootViewController: editProfileController)
            self.present(navigationController, animated: true, completion: nil)
        }

                let actionShare = UIAction(title: "Share", image: UIImage(named: "shareProfileImage")) { action in
                    print("action add clicked")
                    
                }
                let menu = UIMenu(title: "", children: [actionEditProfile, actionShare])
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(named: "detailIcon"), primaryAction: nil, menu: menu)
        
       
                

        
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationController?.navigationBar.isHidden = false
        
        tableView.dataSource = self
//        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        setupLayout()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    @objc private func openModal()  {
        print("Modal opened")
    }
    
    func setupLayout(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}

extension ProfileController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return x.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableCell.identifier, for: indexPath) as! DetailTableCell

        cell.backgroundColor = .white

        cell.setupView(titleName: x[indexPath.row].title, subtitleName: x[indexPath.row].value as! String)
//        cell.setupView(titleName: reminders[indexPath.row] , subtitleName: "Section" )
//        cell.setupLayout(isCheckboxVisible: true)


        return cell
    }

}

