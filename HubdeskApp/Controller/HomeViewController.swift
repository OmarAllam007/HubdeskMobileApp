//
//  HomeViewController.swift
//  HubdeskApp
//
//  Created by Omar Khaled on 11/06/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().barTintColor = mainColor
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
        view.backgroundColor = .white
        
        let ticketViewController = UINavigationController(rootViewController: TicketsViewController())
        ticketViewController.tabBarItem.title = "Tickets"
        
        let approvalsViewController = UINavigationController(rootViewController: ApprovalsViewController())
        approvalsViewController.tabBarItem.title = "Approvals"
        
        
        let profileViewController = UINavigationController(rootViewController: ProfileViewController())
        profileViewController.tabBarItem.title = "Profile"
        
        
        viewControllers = [ticketViewController,approvalsViewController,profileViewController]

    }

}
