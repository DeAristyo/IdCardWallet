//
//  TimePickerField.swift
//  IdCardWallet
//
//  Created by Dimas Aristyo Rahadian on 30/07/23.
//

import Foundation
import UIKit

class TimePickerField: UIView{
    
    var timeLayout: NSLayoutConstraint!
    
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
        view.text = "Time"
        return view
    }()
    
    lazy var outputLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Pick Time"
        view.font = .systemFont(ofSize: 16)
        view.textColor = .gray
        return view
    }()
    
    lazy var timeView: UIDatePicker = {
        let view = UIDatePicker()
        view.preferredDatePickerStyle = .wheels
        view.datePickerMode = .time
        view.locale = Locale(identifier: "en_US_POSIX")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
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
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "hh:mm a" // Format the time as you desire
        let selectedTime = dateFormatter.string(from: sender.date)
        outputLabel.text = selectedTime
        outputLabel.textColor = .link
    }
    
    @objc func switchState(_ sender:UISwitch){
        if sender.isOn{
            UIView.transition(with: timeView, duration: 0.4, options: .curveEaseOut) {
                self.timeLayout.constant = 339
            }
            print("Idup")
        }else{
            UIView.transition(with: timeView, duration: 0.4, options: .curveEaseIn) {
                self.timeLayout.constant = 0
            }
            outputLabel.text = "Pick Time"
            outputLabel.font = .systemFont(ofSize: 16)
            outputLabel.textColor = .gray
            print("Mati")
        }
    }
    
    func setupAddSubView(){
        addSubview(timeView)
        
        addSubview(switchButton)
        addSubview(inputLabel)
        addSubview(divider)
        addSubview(outputLabel)
        
        setupLayout()
    }
    
    func setupLayout(){
        timeLayout = timeView.heightAnchor.constraint(equalToConstant: 0)
//        dividerLayout = divider.topAnchor.constraint(equalTo: outputLabel.bottomAnchor, constant: 12)
        NSLayoutConstraint.activate([
            
            inputLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            inputLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            inputLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
//
            timeView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            timeView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            timeView.topAnchor.constraint(equalTo: outputLabel.bottomAnchor, constant: 12),
            timeLayout,
            timeView.bottomAnchor.constraint(equalTo: divider.topAnchor),
            
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
            divider.trailingAnchor.constraint(equalTo: timeView.trailingAnchor),
            divider.widthAnchor.constraint(equalTo: timeView.widthAnchor),
            divider.bottomAnchor.constraint(equalTo: bottomAnchor),
            divider.topAnchor.constraint(equalTo: timeView.bottomAnchor, constant: -12),
//            dividerLayout,
            
            switchButton.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            switchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}

