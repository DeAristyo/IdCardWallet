//
//  ContactList.swift
//  IdCardWallet
//
//  Created by Auliya Michelle Adhana on 26/07/23.
//

import UIKit

class Profile: UIViewController {
    
    private var cardView : IdCardView = {
        let view = IdCardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        return view
    }()
    
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
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        
        tableView.register(DetailTableCell.self, forCellReuseIdentifier: DetailTableCell.identifier)
     
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBarAppearace.configureWithOpaqueBackground()
        navigationBarAppearace.backgroundColor = UIColor(named: "PrimaryColor")
        navigationBarAppearace.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppearace.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = navigationBarAppearace;
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem?.tintColor = .white
        
        tableView.dataSource = self
        tableView.tableHeaderView = cardView
        tableView.backgroundColor = .white
        
        view.addSubview(tableView)
        view.backgroundColor = UIColor(named: "BackgroundColor")
  
        
        setupLayout()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func setupLayout(){
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 16)
            
        ])
    }
}




extension Profile: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return x.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableCell.identifier, for: indexPath) as! DetailTableCell
        
        cell.backgroundColor = .clear
        cell.setupView(titleName: x[indexPath.row].title, subtitleName: x[indexPath.row].value as! String)
        
        return cell
    }
    
}
