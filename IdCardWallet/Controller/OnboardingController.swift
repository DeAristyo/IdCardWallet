//
//  OnboardingController.swift
//  IdCardWallet
//
//  Created by Dimas Aristyo Rahadian on 17/07/23.
//

import UIKit

class OnboardingController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
   
    var scrollWidth: CGFloat! = 0.0
    
    var scrollHeight: CGFloat! = 0.0
    
    var titles = [
        "Keep track of people you meet!",
        "Save notes!",
        "Set Reminders"
    ]
    
    var desc = [
        "Be more mindful of new networking and strengthen existing ones",
        "Remember details about your conversations and how you met",
        "Remember anniversaries and milestones"
    ]
    
    var imgs = [
        "1",
        "2",
        "3"
    ]
    
    let vc = UINavigationController()
    
    override func viewDidLayoutSubviews() {
          scrollWidth = scrollView.frame.size.width
          scrollHeight = scrollView.frame.size.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()

        self.scrollView.delegate = self
        
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        for index in 0..<titles.count {
            frame.origin.x = scrollWidth * CGFloat(index)
            frame.size = CGSize(width: scrollWidth, height: scrollHeight)

            let slide = UIView(frame: frame)
            
            let image = UIImageView(image: UIImage.init(named: imgs[index]))
            image.image = UIImage(named: imgs[index])
            image.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
            image.image = UIImage(named: imgs[index])?.withRenderingMode(.alwaysOriginal)
            image.contentMode = .scaleAspectFit
            image.center = CGPoint(x: scrollWidth / 2, y: scrollHeight / 2 - 167)

            let txt1 = UILabel()
                txt1.textAlignment = .center
                txt1.font = UIFont.boldSystemFont(ofSize: 28.0)
                txt1.numberOfLines = 0
                txt1.textColor = UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1)
                txt1.text = titles[index]
                slide.addSubview(txt1)

                txt1.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    txt1.centerXAnchor.constraint(equalTo: slide.centerXAnchor),
                    txt1.centerYAnchor.constraint(equalTo: slide.centerYAnchor, constant: 35),
                    txt1.widthAnchor.constraint(equalToConstant: 300),
                    txt1.heightAnchor.constraint(equalToConstant: 200)
                ])

            let txt2 = UILabel()
                txt2.textAlignment = .center
                txt2.numberOfLines = 2
                txt2.font = UIFont.systemFont(ofSize: 20.0)
                txt2.textColor = UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1)
                txt2.text = desc[index]
                slide.addSubview(txt2)

                txt2.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    txt2.centerXAnchor.constraint(equalTo: slide.centerXAnchor),
                    txt2.centerYAnchor.constraint(equalTo: slide.centerYAnchor, constant: 100),
                    txt2.widthAnchor.constraint(equalToConstant: 320),
                    txt2.heightAnchor.constraint(equalToConstant: 200)
                ])
           

            
            if index == 2 {
                let button = UIButton(frame: CGRect(x: slide.frame.width / 2 - 164, y: self.view.center.y + 210, width: 328, height: 40))

                button.backgroundColor = UIColor(red: 0.035, green: 0.173, blue: 0.298, alpha: 1)
                button.setTitle("Start", for: .normal)
                button.layer.cornerRadius = 7
                button.isEnabled = true
                button.isUserInteractionEnabled = true
//                button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
                
                slide.addSubview(button)
            }

            
            
            slide.addSubview(txt1)
            slide.addSubview(txt2)
            txt2.sizeToFit()
            slide.addSubview(image)
            scrollView.addSubview(slide)
        }

        
        
        
        
        
        
        
        
        
        
        scrollView.contentSize = CGSize(width: scrollWidth * CGFloat(titles.count) , height: scrollHeight)
        self.scrollView.contentSize.height = 1.0

        pageControl.numberOfPages = titles.count
        pageControl.currentPage = 0
    }
    
//    @objc func didTapButton(_ sender: UIButton) {
//        performSegue(withIdentifier: "ToCameraScreen", sender: nil)
//    }
    
    @objc func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setIndiactorForCurrentPage()
    }

    func setIndiactorForCurrentPage()  {
        let page = (scrollView?.contentOffset.x)!/scrollWidth
        pageControl?.currentPage = Int(page)
    }
}
  
    
    //    @IBOutlet var OnboardingImage: UIImageView!
//    @IBOutlet weak var text1: UILabel!
//    @IBOutlet weak var text2: UILabel!
//
//    @IBOutlet weak var nextButton: UIButton!
//
//    @IBOutlet weak var skipButton: UIButton!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        OnboardingImage?.image = UIImage(named: "OnboardingIllustration")
//
//        text1.lineBreakMode = .byWordWrapping
//        text1.numberOfLines = 0
//
//        text2.lineBreakMode = .byWordWrapping
//        text2.numberOfLines = 0
//
//    }
//
//}
//
//extension OnboardingController: textFieldIDDelegate{
//    func getValue(value: String?) {
//
//    }
//
//
//}
