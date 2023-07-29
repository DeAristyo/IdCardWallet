//
//  DetailTextField.swift
//  IdCardWallet
//
//  Created by Billbert Pohandy on 28/07/23.
//

import UIKit

class DetailTextField: UIView{
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 11)
        view.textColor = .gray
        view.text = "Labela"
        return view
    }()
    
    lazy var detailLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 17)
        view.textColor = .black
        view.text = "Label"
        
        return view
    }()
    
//    lazy var divider: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .black
//        return view
//    }()
    
    func setupView(titleName: String, subtitleName: String){
        titleLabel.text = titleName
        detailLabel.text = subtitleName
    }
 
    
    var delegate: textFieldIDDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAddSubView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupAddSubView()
    }
    
    func setupAddSubView(){
        addSubview(titleLabel)
        addSubview(detailLabel)
//        addSubview(divider)
        
        setupLayout()
    }
    
    func setupLayout(){
        NSLayoutConstraint.activate([
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            detailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            detailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            detailLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
//            divider.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor),
//            divider.heightAnchor.constraint(equalToConstant: 1),
//            divider.trailingAnchor.constraint(equalTo: detailLabel.trailingAnchor),
//            divider.widthAnchor.constraint(equalTo: detailLabel.widthAnchor),
//            divider.topAnchor.constraint(equalTo: detailLabel.bottomAnchor),
//            divider.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}


