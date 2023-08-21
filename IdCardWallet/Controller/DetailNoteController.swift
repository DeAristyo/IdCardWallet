//
//  DetailNoteController.swift
//  IdCardWallet
//
//  Created by Dimas Aristyo Rahadian on 30/07/23.
//

import UIKit

class DetailNoteController: UIViewController {
    
    let noteField = [
        Form(title: "Title", value: "Disscuss New Feature"),
        Form(title: "Contact Date", value: "05 June 2023"),
        Form(title: "Meeting Place", value: "Starduck Coffee"),
        Form(
            title: "Note",
            value: "He got that James Dean daydream look in his eyes, long hair, slicked back, white T-shirt")
    ]
    
    
    private var vStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        return view
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(DetailTableCell.self, forCellReuseIdentifier: DetailTableCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Detail Note"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.sizeToFit()
        self.navigationController?.navigationBar.backgroundColor = UIColor(named: "PrimaryColor")
        let backButton = UIBarButtonItem()
        backButton.title = "Notes"
        backButton.tintColor = .white
        
        view.backgroundColor = .white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        tableView.dataSource = self
        
        let actionDelete = UIAction(title: "Delete", image: UIImage(named: "deleteImage")) { _ in
            print("action Delete clicked")
        }
        
        let actionEditNote = UIAction(title: "Edit Note", image: UIImage(named: "editProfileImage")) { _ in
            let vc = AddNoteSheet(title: "Edit Note")
            let navVc = UINavigationController(rootViewController: vc)
            self.present(navVc, animated: true)
            print("action Edit Note clicked")
        }
        
        let menu = UIMenu(title: "", children: [actionEditNote, actionDelete])
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: nil,
            image: UIImage(named: "detailIcon"),
            primaryAction: nil,
            menu: menu)
        navigationItem.rightBarButtonItem?.tintColor = .white
        setupAddSubView()
    }
    
    func setupAddSubView() {
        view.addSubview(tableView)
        
        setupLayout()
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}

extension DetailNoteController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteField.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: DetailTableCell.identifier,
            for: indexPath)
        as! DetailTableCell
        
        cell.setupView(titleName: noteField[indexPath.row].value, subtitleName: noteField[indexPath.row].title)
        
        return cell
    }
    
}
