//
//  CustomTableCell.swift
//  IdCardWallet
//
//  Created by Auliya Michelle Adhana on 25/07/23.
//

import UIKit

class CustomTableView: UITableView {
    static let identifier = "CustomTableView"
    let reminders: [String] = ["halo", "Kamu"]
    let tableCell = CustomTableCell()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(CustomTableCell.self, forCellReuseIdentifier: CustomTableCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

        return tableView
    }()

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)

        setupAddSubView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupAddSubView()
    }

//    func setupView(titleName: String, subtitleName: String){
//        title.text = titleName
//        subtitle.text = subtitleName
//    }

    func setupAddSubView() {
        addSubview(tableView)
        addSubview(tableCell)

        setupLayout()
    }

    func setupLayout(isCheckboxVisible: Bool = true) {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50 )
//            tableCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])

    }
}

extension CustomTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: CustomTableCell.identifier,
            for: indexPath
        ) as? CustomTableCell
        cell?.backgroundColor = UIColor(named: "BackgroundColor")
        cell?.setupView(titleName: reminders[indexPath.row], subtitleName: "Section" )

        return cell!
    }
}
