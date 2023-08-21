//
//  AddNoteSheet.swift
//  IdCardWallet
//
//  Created by Billbert Pohandy on 27/07/23.
//

import Foundation
import UIKit

class AddNoteSheet: UIViewController {
    
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
    
    var meetPlaceInput: TextFieldNoImage = {
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
        meetPlaceInput.delegate = self
        longTextFieldInput.delegate = self
        
        view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.sizeToFit()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Save",
            style: .plain,
            target: self,
            action: #selector(rightButtonAction))
        self.navigationItem.rightBarButtonItem?.setTitleTextAttributes(textAttributes, for: .normal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Cancel",
            style: .plain,
            target: self,
            action: #selector(leftButtonAction))
        self.navigationItem.leftBarButtonItem?.setTitleTextAttributes(textAttributes, for: .normal)
        
        setupLayout()
        textFieldInput.setupView(placeholders: "e.g. Disscuss New Feature", labels: "Title", delegates: self)
        meetPlaceInput.setupView(placeholders: "e.g. Starducks Coffee", labels: "Meeting Place", delegates: self)
        longTextFieldInput.setupView(
            placeholders:
                "e.g. He got that James Dean daydream look  in his eyes, long hair, slicked back, white T-shirt",
            labels: "Note",
            delegates: self)
    }
    
    
    @objc func rightButtonAction(fullName: String) {
        print("Udah ke save bang")
//        let occupations = "Software Developer"
//        let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
//
//        let newNoteDetail = PersonNote(context: managedContext)
////        newNoteDetail.setValue(fullName, forKey: #keyPath(PersonNote.noteFullName))
//        newNoteDetail.setValue(textFieldInput.textInput.text, forKey: #keyPath(PersonNote.noteTitle))
//        newNoteDetail.setValue(meetPlaceInput.textInput.text, forKey: #keyPath(PersonNote.noteMeetingPlace))
//        newNoteDetail.setValue(longTextFieldInput.longTextInput.text, forKey: #keyPath(PersonNote.noteDetail))
//        newNoteDetail.setValue(Date(), forKey: #keyPath(PersonNote.contactDate))
//
//        do{
//            try AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
//            print("Dah ke save bang bismillahirohmanirohim ya allah tolong kami ya allah")
//        }
//        catch{
//            fatalError()
//            print("Astaghfirullahaladzim \(error.localizedDescription)")
//        }
//        self.dismiss(animated: true)
    }
    
    @objc func leftButtonAction() {
        print("Udah ke balik bang")
        self.dismiss(animated: true)
    }
    
    func setupLayout() {
        stackView.addArrangedSubview(textFieldInput)
        stackView.addArrangedSubview(calendarFieldInput)
        stackView.addArrangedSubview(meetPlaceInput)
        stackView.addArrangedSubview(longTextFieldInput)
        scrollView.addSubview(stackView)
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            calendarFieldInput.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            calendarFieldInput.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            
            
        ])
    }
    
}

extension AddNoteSheet: TextFieldIDDelegateNoImage {
    func getValueNoImage(value: String?) {
        print(value as Any)
    }
    
}

extension AddNoteSheet: TextViewIDDelegate {
    func getValue(value: String?) {
        print(value as Any)
    }
}
