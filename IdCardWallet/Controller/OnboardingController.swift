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
        "Set Reminders!"
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

        let skipButtonSize: CGFloat = 60
        let skipButtonPadding: CGFloat = 16
        let skipButtonFrame = CGRect(x: view.bounds.width - skipButtonSize - skipButtonPadding,
                                     y: skipButtonPadding,
                                     width: skipButtonSize,
                                     height: skipButtonSize)

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
                txt1.textColor = UIColor(red: 0.035, green: 0.173, blue: 0.298, alpha: 1)
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
                   let startButton = UIButton(frame: CGRect(x: slide.frame.width / 2 - 164,
                                                            y: self.view.center.y + 210,
                                                            width: 328,
                                                            height: 40))

                   startButton.backgroundColor = UIColor(red: 0.035, green: 0.173, blue: 0.298, alpha: 1)
                   startButton.setTitle("Start", for: .normal)
                   startButton.layer.cornerRadius = 7
                   startButton.isEnabled = true
                   startButton.isUserInteractionEnabled = true
                    startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)

                   slide.addSubview(startButton)
               } else if (index == 0 || index == 1) && slide.subviews.contains(where: { $0 is UIButton }) == false {
                   // Add the skip button for index 0 and 1 slides if it hasn't been added yet
                   let skipButton = UIButton(type: .system)
                   skipButton.setTitle("Skip", for: .normal)
                   skipButton.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
                   skipButton.setTitleColor(UIColor(red: 0.035, green: 0.173, blue: 0.298, alpha: 1), for: .normal)
                   skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)

                   skipButton.frame = skipButtonFrame
                   slide.addSubview(skipButton)
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
    
    @objc func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setIndicatorForCurrentPage()
    }

    func setIndicatorForCurrentPage() {
        let page = (scrollView?.contentOffset.x)!/scrollWidth
        pageControl?.currentPage = Int(page)
    }
    
    @objc func skipButtonTapped() {

        print("Skip button tapped!")
    }
    @objc func startButtonTapped() {

        print("Start button tapped!")
    }
}
