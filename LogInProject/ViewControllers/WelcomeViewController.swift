//
//  LogOutViewController.swift
//  LogInProject
//
//  Created by Андрей Ордынский on 20.05.2024.
//

import UIKit

final class WelcomeViewController: UIViewController {
    @IBOutlet var welcomeLabel: UILabel!
    var userName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(userName)!"
    }
}

//extension LogOutViewController {
//    private func setupGradient() {
//        let gradient = CAGradientLayer()
//        gradient.
//    }
//}
