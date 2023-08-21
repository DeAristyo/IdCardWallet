//
//  EditTextField.swift
//  IdCardWallet
//
//  Created by Billbert Pohandy on 29/07/23.
//

import Foundation
import UIKit

protocol EditTextFieldDelegate: AnyObject {
    func getValueEditField(value: String?)
}

class EditTextField: UIView {
    
    lazy var textInput: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = "E.g"
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
    
    var delegate: EditTextFieldDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAddSubView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupAddSubView()
    }
    
    func setupView(placeholders: String,  labels: String, delegates: EditTextFieldDelegate) {
        textInput.placeholder = placeholders
        inputLabel.text = labels
        self.delegate = delegates
    }
    
    func setupAddSubView() {
        textInput.delegate = self
        addSubview(inputLabel)
        addSubview(textInput)
        
        setupLayout()
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            inputLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            inputLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            inputLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textInput.topAnchor.constraint(equalTo: inputLabel.bottomAnchor, constant: 12),
            textInput.leadingAnchor.constraint(equalTo: leadingAnchor),
            textInput.trailingAnchor.constraint(equalTo: trailingAnchor),
            textInput.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension EditTextField: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.getValueEditField(value: textField.text)
        
    }
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String)
    -> Bool {
        delegate?.getValueEditField(value: textField.text)
        return true
    }
}
