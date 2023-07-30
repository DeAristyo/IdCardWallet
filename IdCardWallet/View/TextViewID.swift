//
//  TextViewID.swift
//  IdCardWallet
//
//  Created by Dimas Aristyo Rahadian on 30/07/23.
//

import UIKit

protocol textViewIDDelegate{
    func getValue(value: String?)
}

class TextViewID: UIView {
    
    lazy var longTextInput: UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "e.g. He will release new album called 'rose' that was inspired by his mom name"
        view.textColor = UIColor.lightGray
        view.font = .systemFont(ofSize: 16)
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
    
    var delegate: textViewIDDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAddSubView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupAddSubView()
    }
    
    func setupView(placeholders:String, labels: String, delegates: textViewIDDelegate){
        self.delegate = delegates
        longTextInput.text = placeholders
        inputLabel.text = labels
    }
    
    func setupAddSubView(){
        longTextInput.delegate = self
        addSubview(inputLabel)
        addSubview(longTextInput)
        addSubview(divider)
        
        
        setupLayout()
    }
    
    func setupLayout(){
        NSLayoutConstraint.activate([
            
            inputLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            inputLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            inputLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            longTextInput.topAnchor.constraint(equalTo: inputLabel.bottomAnchor, constant: 12),
            longTextInput.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            longTextInput.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            longTextInput.bottomAnchor.constraint(equalTo: divider.topAnchor, constant: -12),
            longTextInput.heightAnchor.constraint(equalToConstant: 66),
            
            //            divider.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 0.5),
            divider.trailingAnchor.constraint(equalTo: longTextInput.trailingAnchor),
            divider.widthAnchor.constraint(equalTo: longTextInput.widthAnchor),
            divider.topAnchor.constraint(equalTo: longTextInput.bottomAnchor),
            divider.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension TextViewID: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == ""{
            textView.text = "e.g. He will release new album called 'rose' that was inspired by his mom name"
            textView.textColor = UIColor.lightGray
        }
    }
}
