//
//  TabBarViewController.swift
//  LogInProject
//
//  Created by Андрей Ордынский on 24.05.2024.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.standardAppearance = UITabBarAppearance()
        tabBar.scrollEdgeAppearance = UITabBarAppearance()
    }
    
}
