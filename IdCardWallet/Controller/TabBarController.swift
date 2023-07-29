//
//  File.swift
//  IdCardWallet
//
//  Created by Dimas Aristyo Rahadian on 17/07/23.
//

import UIKit

class TabBarController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabs()
    }
    
    private func configureTabs() {
        let peopleList = PeopleList()
        let upcomingList = UpcomingList()
        let profile = Profile()
        
        // Set Tab Bar Image
        peopleList.tabBarItem.image = UIImage(named: "tabPeople")
        upcomingList.tabBarItem.image = UIImage(named: "tabCalendar")
        profile.tabBarItem.image = UIImage(named: "tabProfile")
        
        // Set Title
        peopleList.title = "People"
        upcomingList.title = "Upcoming"
        profile.title = "Profile"
        
        let peopleNav = UINavigationController(rootViewController: peopleList)
        let upcomingNav = UINavigationController(rootViewController: upcomingList)
        let profileNav = UINavigationController(rootViewController: profile)
        
        tabBar.tintColor = UIColor(named: "PrimaryColor")
        tabBar.backgroundColor = .white
        
        setViewControllers([peopleNav, upcomingNav, profileNav], animated: true)
    }
}
