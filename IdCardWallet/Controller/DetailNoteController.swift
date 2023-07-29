//
//  DetailNoteController.swift
//  IdCardWallet
//
//  Created by Dimas Aristyo Rahadian on 29/07/23.
//

import Foundation
import UIKit

class DetailNoteController: UIViewController{
    
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
        
        return tableView
    }()
    
    override func viewDidLoad() {
        self.navigationItem.title = "Detail Note"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.sizeToFit()
        self.navigationController?.navigationBar.backgroundColor = UIColor(named: "PrimaryColor")
        let backButton = UIBarButtonItem()
        backButton.title = "Notes"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}
