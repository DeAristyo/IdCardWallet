//
//  IdCardView.swift
//  IdCardWallet
//
//  Created by Auliya Michelle Adhana on 28/07/23.
//

import UIKit

class IdCardView: UIView {
    
    
    lazy var card: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "PrimaryColor")
        view.layer.borderWidth = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var name: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Shawn Mendes"
        view.textColor = .white
        view.font = .systemFont(ofSize: 26,  weight: .bold)
        
        return view
    }()
    
    lazy var email: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "myemail@cocacola.com"
        view.textColor = .white
        view.font = .systemFont(ofSize: 16,  weight: .regular)
        
        return view
    }()
    
    lazy var phone: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.textColor = .white
        view.text = "+34 555 555 555"
        
        return view
    }()

    lazy var address: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.textColor = .white
        view.text = "Street one 1, miami,"
        
        return view
    }()
    
    lazy var job: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.textColor = .white
        view.text = "Job"
        
        return view
    }()
    
    lazy var company: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.textColor = .white
        view.text = "+34 555 555 555"
        
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAddSubView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupAddSubView()
    }
    
//    func setupView(nameLabel: String, emailLabel: String, phoneLabel: String){
//        name.text = nameLabel
//        email.text = emailLabel
//        phone.text = phoneLabel
//    }
    
    func setupAddSubView() {
        print("Id card terpanggil")
        addSubview(card)
        addSubview(name)
        addSubview(email)
        addSubview(phone)
        addSubview(address)
        addSubview(job)
        addSubview(company)
        
        setupLayout()
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            
            card.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            card.leadingAnchor.constraint(equalTo: leadingAnchor),
            card.trailingAnchor.constraint(equalTo: trailingAnchor),
            card.widthAnchor.constraint(equalToConstant: 500),
            card.heightAnchor.constraint(equalToConstant: 180),
            
            name.topAnchor.constraint(equalTo: card.topAnchor,constant: 16),
            name.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            name.trailingAnchor.constraint(equalTo: card.trailingAnchor),
            
            email.topAnchor.constraint(equalTo: name.topAnchor, constant: 48),
            email.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            email.trailingAnchor.constraint(equalTo: card.trailingAnchor),

            phone.topAnchor.constraint(equalTo: email.topAnchor, constant: 20),
            phone.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            phone.trailingAnchor.constraint(equalTo: card.trailingAnchor),
            
            address.topAnchor.constraint(equalTo: phone.topAnchor, constant: 20),
            address.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            address.trailingAnchor.constraint(equalTo: card.trailingAnchor),
            
            job.topAnchor.constraint(equalTo: address.topAnchor, constant: 20),
            job.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            job.trailingAnchor.constraint(equalTo: card.trailingAnchor),
            
            company.topAnchor.constraint(equalTo: job.topAnchor, constant: 20),
            company.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            company.trailingAnchor.constraint(equalTo: card.trailingAnchor)
        ])
    }
}
