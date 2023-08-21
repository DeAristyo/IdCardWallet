//
//  ContactList.swift
//  IdCardWallet
//
//  Created by Auliya Michelle Adhana on 26/07/23.
//

import UIKit

class UpcomingList: UIViewController {

    let reminders: [String] = ["halo", "Kamu"]

    var navigationBarAppearace = UINavigationBarAppearance()
    var searchController = UISearchController(searchResultsController: nil)

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.isUserInteractionEnabled = true
        tableView.backgroundColor = UIColor(named: "BackgroundColor")
        tableView.register(CustomTableCell.self, forCellReuseIdentifier: CustomTableCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        searchController.searchBar.searchTextField.backgroundColor = .white

        navigationBarAppearace.configureWithOpaqueBackground()
        navigationBarAppearace.backgroundColor = UIColor(named: "PrimaryColor")
        navigationBarAppearace.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppearace.titleTextAttributes = [.foregroundColor: UIColor.white]

        navigationItem.title = "Upcoming"
        navigationController?.navigationBar.standardAppearance = navigationBarAppearace
        navigationController?.navigationBar.scrollEdgeAppearance =
            navigationController?.navigationBar.standardAppearance
        navigationController?.navigationBar.prefersLargeTitles = true

        navigationItem.searchController = searchController

        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    @objc private func openModal() {
        print("Modal opened")
    }
}

extension UpcomingList: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailUpcomingController(), animated: true)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: CustomTableCell.identifier,
            for: indexPath
        ) as? CustomTableCell

        cell?.backgroundColor = UIColor(named: "BackgroundColor")

        cell?.setupView(titleName: reminders[indexPath.row], subtitleName: "Section" )
        cell?.setupLayout(isCheckboxVisible: false)
        cell?.checkBox.isHidden = true

        return cell!
    }
}

enum UpComingListError: Error {
    case noCustomTableCell
}
