//
//  TabBarViewController.swift
//  LogInProject
//
//  Created by Андрей Ордынский on 24.05.2024.
//

import UIKit

final class TabBarViewController: UITabBarController {
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.standardAppearance = UITabBarAppearance()
        tabBar.scrollEdgeAppearance = UITabBarAppearance()
        
        transferData()
    }
    
    private func transferData() {
        guard let viewControllers else { return }
        
        viewControllers.forEach {
            if let welcomeWC = $0 as? WelcomeViewController {
                welcomeWC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                guard let basicInfoVC = navigationVC.topViewController as? BasicInformationViewController else { return }
                
                basicInfoVC.person = user.person
            }
        }
    }
}
