//
//  NoteList.swift
//  IdCardWallet
//
//  Created by Auliya Michelle Adhana on 29/07/23.
//

import UIKit

class NoteList: UIViewController {

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
        self.navigationItem.title = "Notes"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.sizeToFit()
        self.navigationController?.navigationBar.backgroundColor = UIColor(named: "PrimaryColor")
        let backButton = UIBarButtonItem()
        backButton.title = "Detail Person"
        backButton.tintColor = .white
        view.backgroundColor = .white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

        searchController.searchBar.searchTextField.backgroundColor = .white

        navigationItem.rightBarButtonItem = UIBarButtonItem(
                                                image: UIImage(named: "plusIcon"),
                                                style: .plain,
                                                target: self,
                                                action: #selector(openModal)
                                            )
        navigationItem.rightBarButtonItem?.tintColor = .white
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
        let noteSheet = AddNoteSheet(title: "Add Note")
        let navigationController = UINavigationController(rootViewController: noteSheet)
        self.present(navigationController, animated: true)
        print("action Add Note clicked")
    }
}

extension NoteList: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailNoteController(), animated: true)
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
