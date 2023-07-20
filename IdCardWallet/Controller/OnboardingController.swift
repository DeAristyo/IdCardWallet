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
//        OnboardingImage?.frame = CGRect(x: 0, y: 142, width: 400, height: 214)
        
        saveButton.setTitle("SAVE", for: .normal)
        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        saveButton.backgroundColor = UIColor(red: 0.035, green: 0.173, blue: 0.298, alpha: 1)
        saveButton.tintColor = .white
//        saveButton.frame = CGRect(x: 18, y: 620, width: 358, height: 50)
        saveButton.layer.cornerRadius = 12
        
        
    }
    
}

extension OnboardingController: textFieldIDDelegate{
    func getValue(value: String?) {
        skipButton.setTitle(value, for: .normal)
        print(value)
    }
    
    
}
