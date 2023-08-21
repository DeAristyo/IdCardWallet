//
//  CustomTableCell.swift
//  IdCardWallet
//
//  Created by Auliya Michelle Adhana on 25/07/23.
//

import UIKit

class CustomTableCell: UITableViewCell {
    static let identifier = "CustomTableCell"
    
    let checkBox = Checkbox()
    
    lazy var card: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.gray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var subtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var iconButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "rightButts"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupAddSubView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupAddSubView()
    }
    
    func setupView(titleName: String, subtitleName: String) {
        title.text = titleName
        subtitle.text = subtitleName
    }

    
    func setupAddSubView() {
        addSubview(card)
        addSubview(checkBox)
        addSubview(iconButton)
        addSubview(title)
        addSubview(subtitle)
        
        checkBox.isChecked = false
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        
        setupLayout()
    }

    
    func setupLayout(isCheckboxVisible: Bool = true) {
        
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            card.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            card.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            card.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            checkBox.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            checkBox.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            checkBox.widthAnchor.constraint(equalToConstant: 24),
            checkBox.heightAnchor.constraint(equalToConstant: 24),
    
            
            title.topAnchor.constraint(equalTo: card.topAnchor, constant: 12),
            title.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: isCheckboxVisible ? 72: 16),

              
            subtitle.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -12),
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            subtitle.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: isCheckboxVisible ? 72: 16),

            
            iconButton.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            iconButton.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16)
        ])

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: CustomTableCell.identifier,
            for: indexPath)
        as! CustomTableCell
        
        cell.backgroundColor = UIColor(named: "BackgroundColor")
        
        cell.setupView(titleName: "hehe", subtitleName: "Section" )
        cell.setupLayout(isCheckboxVisible: true)
        
        
        return cell
    }
    
}
