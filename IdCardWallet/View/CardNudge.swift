//
//  CardNudge.swift
//  IdCardWallet
//
//  Created by Dimas Aristyo Rahadian on 21/07/23.
//

import UIKit

class CardNudge: UIView{
    
    lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "SFProText-Semibold", size: 15)
        view.textColor = .black
        view.text = "Label"
        return view
    }()
    
    lazy var compLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 13)
        view.textColor = .black
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView(labelName: String, labelComp: String){
        nameLabel.text = labelName
        compLabel.text = labelComp
    }
    
    func setupAddSubView(){
        addSubview(nameLabel)
        addSubview(compLabel)
        
        setupLayout()
    }
    
    func setupLayout(){
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            compLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            compLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 16),
            compLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            compLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
        ])
    }
}
