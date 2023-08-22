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

    let navController = UINavigationController()

    override func viewDidLayoutSubviews() {
        scrollWidth = scrollView.frame.size.width
        scrollHeight = scrollView.frame.size.height
    }

    lazy var onboardingImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: imgs[0])?.withRenderingMode(.alwaysOriginal)
        image.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        image.contentMode = .scaleAspectFit
        image.center = CGPoint(x: scrollWidth / 2, y: scrollHeight / 2 - 167)

        return image
    }()

    lazy var titleLabel: UILabel = {
        let txt1 = UILabel()

        txt1.textAlignment = .center
        txt1.font = UIFont.boldSystemFont(ofSize: 28.0)
        txt1.numberOfLines = 0
        txt1.textColor = UIColor(red: 0.035, green: 0.173, blue: 0.298, alpha: 1)
        txt1.text = titles[0]
        txt1.translatesAutoresizingMaskIntoConstraints = false

        return txt1
    }()

    lazy var descLabel: UILabel = {
        let txt2 = UILabel()

        txt2.textAlignment = .center
        txt2.numberOfLines = 2
        txt2.font = UIFont.systemFont(ofSize: 20.0)
        txt2.textColor = UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1)
        txt2.text = desc[0]
        txt2.translatesAutoresizingMaskIntoConstraints = false
        txt2.sizeToFit()

        return txt2
    }()

    lazy var startButton: UIButton = {
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

        return startButton
    }()

    lazy var skipButton: UIButton = {
        let skipButton = UIButton(type: .system)

        let skipButtonSize: CGFloat = 60
        let skipButtonPadding: CGFloat = 16
        let skipButtonFrame = CGRect(x: view.bounds.width - skipButtonSize - skipButtonPadding,
                                     y: skipButtonPadding,
                                     width: skipButtonSize,
                                     height: skipButtonSize)

        skipButton.setTitle("Skip", for: .normal)
        skipButton.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
        skipButton.setTitleColor(UIColor(red: 0.035, green: 0.173, blue: 0.298, alpha: 1), for: .normal)
        skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)

        skipButton.frame = skipButtonFrame

        return skipButton
    }()

    lazy var frame: CGRect = {
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        frame.size = CGSize(width: scrollWidth, height: scrollHeight)

       return frame
    }()

    lazy var  slide: UIView = {
        let slide = UIView(frame: frame)

        return slide
    }()

    func setupOnboardingContent() {

        for index in 0..<titles.count {
            frame.origin.x = scrollWidth * CGFloat(index)
            scrollView.addSubview(slide)

            onboardingImage.image = UIImage(named: imgs[index])
            slide.addSubview(onboardingImage)

            titleLabel.text = titles[index]
            slide.addSubview(titleLabel)

            descLabel.text = desc[index]
            slide.addSubview(descLabel)

            if index == 2 {
                slide.addSubview(startButton)
            } else if (index == 0 || index == 1) && slide.subviews.contains(where: { $0 is UIButton }) == false {
                // Add the skip button for index 0 and 1 slides if it hasn't been added yet
                slide.addSubview(skipButton)
            }
            setupLayout()
        }
    }

    func setupLayout() {
        NSLayoutConstraint.activate( [
            titleLabel.centerXAnchor.constraint(equalTo: slide.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: slide.centerYAnchor, constant: 35),
            titleLabel.widthAnchor.constraint(equalToConstant: 300),
            titleLabel.heightAnchor.constraint(equalToConstant: 200),

            descLabel.centerXAnchor.constraint(equalTo: slide.centerXAnchor),
            descLabel.centerYAnchor.constraint(equalTo: slide.centerYAnchor, constant: 100),
            descLabel.widthAnchor.constraint(equalToConstant: 320),
            descLabel.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        self.scrollView.delegate = self

        setupOnboardingContent()

        scrollView.contentSize = CGSize(width: scrollWidth * CGFloat(titles.count), height: scrollHeight)
        self.scrollView.contentSize.height = 1.0

        pageControl.numberOfPages = titles.count
        pageControl.currentPage = 0

    }

    @objc func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setIndiactorForCurrentPage()
    }

    func setIndiactorForCurrentPage() {
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
