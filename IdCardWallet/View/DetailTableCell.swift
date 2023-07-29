//
//  DetailTableCell.swift
//  IdCardWallet
//
//  Created by Auliya Michelle Adhana on 25/07/23.
//

import UIKit

class DetailTableCell: UITableViewCell {
    static let identifier = "DetailTableCell"
    
    let textField = DetailTextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupAddSubView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupAddSubView()
    }
    
    func setupView(titleName: String, subtitleName: String){
        textField.setupView(titleName: titleName, subtitleName: subtitleName)
    }

    
    func setupAddSubView(){
        addSubview(textField)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        setupLayout()
    }

    
    func setupLayout(isCheckboxVisible:Bool = true){
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])

    }
    
    
}

