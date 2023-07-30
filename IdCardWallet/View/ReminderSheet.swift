//
//  ReminderSheet.swift
//  IdCardWallet
//
//  Created by Dimas Aristyo Rahadian on 30/07/23.
//

import Foundation
import UIKit

class ReminderSheet: UIViewController{
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isScrollEnabled = true
        view.isUserInteractionEnabled = true
        view.delaysContentTouches = true
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        return view
    }()
    
    var textFieldInput: TextFieldNoImage = {
        let view = TextFieldNoImage()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var textFieldInputLocation: TextFieldNoImage = {
        let view = TextFieldNoImage()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var longTextFieldInput: TextViewID = {
        let view = TextViewID()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var calendarFieldInput: CalendarPickerField = {
        let view = CalendarPickerField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    var timeFieldInput: TimePickerField = {
        let view = TimePickerField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    convenience init(title: String) {
        self.init(nibName: nil, bundle: nil)
        self.navigationItem.title = title
    }
    
    let textAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor.gray,
        .font: UIFont.systemFont(ofSize: 17)
    ]
    
    override func viewDidLoad() {
        textFieldInput.delegate = self
        textFieldInputLocation.delegate = self
        longTextFieldInput.delegate = self
        
        view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.sizeToFit()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(rightButtonAction))
        self.navigationItem.rightBarButtonItem?.setTitleTextAttributes(textAttributes, for: .normal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(leftButtonAction))
        self.navigationItem.leftBarButtonItem?.setTitleTextAttributes(textAttributes, for: .normal)
        
        setupLayout()
        textFieldInput.setupView(placeholders: "e.g. Disscuss New Album Release", labels: "Title", delegates: self)
        textFieldInputLocation.setupView(placeholders: "e.g. Zoom", labels: "Location", delegates: self)
        longTextFieldInput.setupView(placeholders: "e.g. He will release new album called “rose ” that was inspired by his mom name", labels: "Note", delegates: self)
   //     textFieldInput.setupView(placeholders: "e.g. Zoom", labels: "Location", delegates: self)
    }
    
    
    @objc func rightButtonAction(){
        print("Udah ke save bang")
    }
    @objc func leftButtonAction(){
        print("Udah ke balik bang")
        self.dismiss(animated: true)
    }
    
    func updateContentSize() {
        // Calculate the total height of all the subviews inside the scrollView
        var totalContentHeight: CGFloat = 0.0
        for subview in scrollView.subviews {
            totalContentHeight += subview.frame.height
        }
        
        // Set the contentSize of the scrollView based on the calculated height
        scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: totalContentHeight)
    }
    
    func setupLayout(){
        stackView.addArrangedSubview(textFieldInput)
        stackView.addArrangedSubview(longTextFieldInput)
        stackView.addArrangedSubview(calendarFieldInput)
        stackView.addArrangedSubview(timeFieldInput)
        stackView.addArrangedSubview(textFieldInputLocation)
        scrollView.addSubview(stackView)
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            calendarFieldInput.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            calendarFieldInput.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
//            textFieldInput.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            textFieldInput.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
//            textFieldInput.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
//            textFieldInput.heightAnchor.constraint(equalToConstant: 74),
//
//            longTextFieldInput.topAnchor.constraint(equalTo: textFieldInput.bottomAnchor),
//            longTextFieldInput.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
//            longTextFieldInput.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
//            longTextFieldInput.heightAnchor.constraint(equalToConstant: 118),
//
//            textFieldInputName.topAnchor.constraint(equalTo: longTextFieldInput.bottomAnchor),
//            textFieldInputName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
//            textFieldInputName.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
//            textFieldInputName.heightAnchor.constraint(equalToConstant: 74),
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            

        ])
    }
    
}

extension ReminderSheet: TextFieldIDDelegateNoImage{
    func getValueNoImage(value: String?) {
        print(value)
    }
    
}

extension ReminderSheet: textViewIDDelegate{
    func getValue(value: String?) {
        print(value)
    }
}
