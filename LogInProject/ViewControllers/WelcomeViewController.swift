//
//  LogOutViewController.swift
//  LogInProject
//
//  Created by Андрей Ордынский on 20.05.2024.
//

import UIKit

final class WelcomeViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var fullNameLabel: UILabel!

    //MARK: - Public properties
    var user: User!

    //MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(user.login)!"
        fullNameLabel.text = "My name is \(user.person.fullName)."
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        showAlertBeforeExit(identifier)
    }
}

