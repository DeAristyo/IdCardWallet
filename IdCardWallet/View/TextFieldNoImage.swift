//
//  TextFieldNoImage.swift
//  IdCardWallet
//
//  Created by Dimas Aristyo Rahadian on 27/07/23.
//

import Foundation
import UIKit

protocol TextFieldIDDelegateNoImage{
    func getValueNoImage(value: String?)
}

class TextFieldNoImage: UIView{
    
    lazy var textInput: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = "E.g"
        return view
    }()

    lazy var divider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
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
    
    func setupView(placeholders:String,  labels: String, delegates: TextFieldIDDelegateNoImage){
        textInput.placeholder = placeholders
        inputLabel.text = labels
        self.delegate = delegates
    }
    
    func setupAddSubView(){
        textInput.delegate = self
        addSubview(inputLabel)
        addSubview(textInput)
        addSubview(divider)
        
        setupLayout()
    }
    
    func setupLayout(){
        NSLayoutConstraint.activate([
            
            inputLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            inputLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            inputLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            textInput.topAnchor.constraint(equalTo: inputLabel.bottomAnchor, constant: 12),
            textInput.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textInput.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textInput.bottomAnchor.constraint(equalTo: divider.topAnchor, constant: -12),
            
//            divider.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 0.5),
            divider.trailingAnchor.constraint(equalTo: textInput.trailingAnchor),
            divider.widthAnchor.constraint(equalTo: textInput.widthAnchor),
            divider.topAnchor.constraint(equalTo: textInput.bottomAnchor),
            divider.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension TextFieldNoImage: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.getValueNoImage(value: textField.text)
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        delegate?.getValueNoImage(value: textField.text)
        return true
    }
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        delegate?.getValue(value: textField.text)
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        delegate?.getValue(value: textField.text)
//        return true
//    }
//
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        delegate?.getValue(value: textField.text)
//        return true
//    }
    

}
