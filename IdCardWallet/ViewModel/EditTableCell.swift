//
//  EditTableCell.swift
//  IdCardWallet
//
//  Created by Billbert Pohandy on 29/07/23.
//

import Foundation
import UIKit

protocol cellTextDelegate{
    func getCellText(value: String?)
}

class EditTableCell: UITableViewCell {
    static let identifier = "DetailTableCell"
    
    let textField = EditTextField()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupAddSubView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupAddSubView()
    }
    
    func setupView(placeholder: String, label: String, delegates: EditTextFieldDelegate){
        textField.setupView(placeholders: placeholder, labels: label, delegates: delegates)
    }

    
    func setupAddSubView(){
        addSubview(textField)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        setupLayout()
    }

    
    func setupLayout(isCheckboxVisible:Bool = true){
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor, constant: -5),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
//            checkBox.centerYAnchor.constraint(equalTo: card.centerYAnchor),
//            checkBox.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
//            checkBox.widthAnchor.constraint(equalToConstant: 24),
//            checkBox.heightAnchor.constraint(equalToConstant: 24),
//
//
//            title.topAnchor.constraint(equalTo: card.topAnchor, constant: 12),
//            title.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: isCheckboxVisible ? 72: 16),
//
//
//            subtitle.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -12),
//            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
//            subtitle.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: isCheckboxVisible ? 72: 16),
//
//
//            iconButton.centerYAnchor.constraint(equalTo: card.centerYAnchor),
//            iconButton.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16)
        ])

    }
    
    
}

