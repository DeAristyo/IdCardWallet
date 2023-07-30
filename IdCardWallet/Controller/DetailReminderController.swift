//
//  DetailReminderController.swift
//  IdCardWallet
//
//  Created by Dimas Aristyo Rahadian on 29/07/23.
//

import Foundation
import UIKit

class DetailReminderController: UIViewController{
    
    let noteField = [
        Form(title: "Title", value: "Disscuss New Feature"),
        Form(title: "Note", value: "He will release new album called “rose ” that was inspired by his mom name"),
        Form(title: "Date", value: "Tuesday, 07 June 2023"),
        Form(title: "Time", value: "08:00"),
        Form(title: "Location", value: "Zoom"),
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
        self.navigationItem.title = "Detail Note"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.sizeToFit()
        self.navigationController?.navigationBar.backgroundColor = UIColor(named: "PrimaryColor")
        let backButton = UIBarButtonItem()
        backButton.title = "Notes"
        view.backgroundColor = .white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        tableView.dataSource = self
        
        setupAddSubView()
    }
    
    func setupAddSubView(){
        view.addSubview(tableView)
        
        setupLayout()
    }
    
    func setupLayout(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
}

extension DetailReminderController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteField.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableCell.identifier, for: indexPath) as! DetailTableCell
        
        cell.setupView(titleName: noteField[indexPath.row].value, subtitleName: noteField[indexPath.row].title)
        
        return cell
    }
    
}
