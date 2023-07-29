//
//  OnboardingController.swift
//  IdCardWallet
//
//  Created by Dimas Aristyo Rahadian on 17/07/23.
//

import UIKit

class OnboardingController: UIViewController{
//    let navbar = NavbarComp()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .gray
        tableView.register(CustomTableCell.self, forCellReuseIdentifier: CustomTableCell.identifier)
        return tableView
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad() 
//        tableView.dataSource = self
//        view.addSubview(tableView)
//        view.addSubview(navbar)
//        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        tableView.frame = view.bounds
//        navbar.frame = view.bounds
    }
}

extension OnboardingController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableCell.identifier, for: indexPath) as! CustomTableCell
        cell.checkBox.isHidden = true
        cell.title.leadingAnchor.constraint(equalTo: cell.card.leadingAnchor, constant: 24)
        
        return cell
    }
}

