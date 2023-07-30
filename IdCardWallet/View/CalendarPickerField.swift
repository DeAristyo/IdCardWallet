//
//  CalendarPickerField.swift
//  IdCardWallet
//
//  Created by Dimas Aristyo Rahadian on 27/07/23.
//

import Foundation
import UIKit

class CalendarPickerField: UIView{
    
    var calendarLayout: NSLayoutConstraint!
    var dividerLayout: NSLayoutConstraint!
    
    lazy var switchButton: UISwitch = {
        let view = UISwitch()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(switchState(_:)), for: .touchUpInside)
        view.setOn(false, animated: true)
        view.isEnabled = true
        view.isUserInteractionEnabled = true
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
        view.text = "Date"
        return view
    }()
    
    lazy var outputLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Pick Date"
        view.font = .systemFont(ofSize: 16)
        view.textColor = .gray
        return view
    }()
    
    lazy var calendarView: UICalendarView = {
        let view = UICalendarView()
        view.calendar = Calendar(identifier: .gregorian)
        view.calendar = .current
        view.locale = .current
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.delegate = self
        view.selectionBehavior = UICalendarSelectionSingleDate(delegate: self)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        setupAddSubView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.isUserInteractionEnabled = true
        setupAddSubView()
    }
    
    @objc func switchState(_ sender:UISwitch){
        if sender.isOn{
            UIView.transition(with: calendarView, duration: 0.4, options: .curveEaseOut) {
                self.calendarLayout.constant = 339
            }
            print("Idup")
        }else{
            UIView.transition(with: calendarView, duration: 0.4, options: .curveEaseIn) {
                self.calendarLayout.constant = 0
            }
            outputLabel.text = "Pick Date"
            outputLabel.font = .systemFont(ofSize: 16)
            outputLabel.textColor = .gray
            print("Mati")
        }
    }
    
    func setupAddSubView(){
        addSubview(calendarView)
        addSubview(switchButton)
        addSubview(inputLabel)
        addSubview(divider)
        addSubview(outputLabel)
        
        setupLayout()
    }
    
    func setupLayout(){
        calendarLayout = calendarView.heightAnchor.constraint(equalToConstant: 0)
//        dividerLayout = divider.topAnchor.constraint(equalTo: outputLabel.bottomAnchor, constant: 12)
        NSLayoutConstraint.activate([
            
            inputLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            inputLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            inputLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
//
            calendarView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            calendarView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            calendarView.topAnchor.constraint(equalTo: outputLabel.bottomAnchor, constant: 12),
            calendarLayout,
            calendarView.bottomAnchor.constraint(equalTo: divider.topAnchor),
            
            outputLabel.topAnchor.constraint(equalTo: inputLabel.bottomAnchor, constant: 12),
            outputLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            outputLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
//            outputLabel.bottomAnchor.constraint(equalTo: divider.topAnchor, constant: -12),
            
//            vStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            vStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            vStackView.heightAnchor.constraint(equalToConstant: 500),
            
//            hStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
//
            divider.heightAnchor.constraint(equalToConstant: 0.5),
            divider.trailingAnchor.constraint(equalTo: calendarView.trailingAnchor),
            divider.widthAnchor.constraint(equalTo: calendarView.widthAnchor),
            divider.bottomAnchor.constraint(equalTo: bottomAnchor),
            divider.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: -12),
//            dividerLayout,
            
            switchButton.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            switchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}

extension CalendarPickerField : UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate{
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        print(dateComponents?.date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let calendar = Calendar.current
        if let selectedDate = calendar.date(from: dateComponents!) {
            let formattedDate = dateFormatter.string(from: selectedDate)
            outputLabel.text = formattedDate
            outputLabel.textColor = .link
        } else {
            print("Error: Unable to get the date from DateComponents.")
        }
        
    }
}
