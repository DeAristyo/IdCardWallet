//
//  OnboardingController.swift
//  IdCardWallet
//
//  Created by Dimas Aristyo Rahadian on 17/07/23.
//

import UIKit

class OnboardingController: UIViewController{
    
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var skipButton: UIButton!
    @IBOutlet var OnboardingImage: UIImageView!
    @IBOutlet var TextView: TextFieldID!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextView.setupView(placeholders: "Login", images: UIImage.init(named: "tabProfile")!, labels: "Login", delegates: self)
        
        OnboardingImage?.image = UIImage(named: "OnboardingIllustration")
        
        saveButton.setTitle("SAVE", for: .normal)
        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        saveButton.backgroundColor = UIColor(red: 0.035, green: 0.173, blue: 0.298, alpha: 1)
        saveButton.tintColor = .white
        saveButton.layer.cornerRadius = 12
        TextView.delegate = self
    
        
    }
    
    @IBAction func skipButtonAction(_ sender: UIButton) {
        let vc = ReminderSheet(title: "Add Reminder")
        let navVc = UINavigationController(rootViewController: vc)
        present(navVc, animated: true)
    }
    
}

extension OnboardingController: textFieldIDDelegate{
    func getValue(value: String?) {
        print(value)
    }
    
    
}
