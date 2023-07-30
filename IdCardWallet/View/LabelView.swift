//
//  LabelView.swift
//  IdCardWallet
//
//  Created by Dimas Aristyo Rahadian on 29/07/23.
//

import Foundation
import UIKit

class LabelView: UIView{

    lazy var divider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var outputLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "E.g"
        view.font = .systemFont(ofSize: 16)
        view.textColor = .gray
        view.lineBreakMode = .byCharWrapping
        view.numberOfLines = 0
        
        return view
    }()
    
    lazy var inputLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 12)
        view.textColor = .black
        view.text = "Label"
        return view
    }()
    
    var delegate: TextFieldIDDelegateNoImage?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAddSubView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupAddSubView()
    }
    
    func setupView(titleName:String,  subtitleName: String){
        outputLabel.text = titleName
        inputLabel.text = subtitleName
        
    }
    
    func setupAddSubView(){
        addSubview(inputLabel)
        addSubview(outputLabel)
        addSubview(divider)
        
        setupLayout()
    }
    
    func setupLayout(){
        NSLayoutConstraint.activate([
            
            inputLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            inputLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            inputLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            outputLabel.topAnchor.constraint(equalTo: inputLabel.bottomAnchor, constant: 12),
            outputLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            outputLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            outputLabel.bottomAnchor.constraint(equalTo: divider.topAnchor, constant: -12),
            
            //            divider.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 0.5),
            divider.trailingAnchor.constraint(equalTo: outputLabel.trailingAnchor),
            divider.widthAnchor.constraint(equalTo: outputLabel.widthAnchor),
            divider.topAnchor.constraint(equalTo: outputLabel.bottomAnchor),
            divider.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
