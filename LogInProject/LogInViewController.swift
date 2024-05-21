//
//  LogInViewController.swift
//  LogInProject
//
//  Created by Андрей Ордынский on 20.05.2024.
//

import UIKit

final class LogInViewController: UIViewController {
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var supportButtonForPassword: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 10
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        if identifier == "segueForLogInVC" {
            if userNameTF.text == PersonalData.login.rawValue 
                && passwordTF.text == PersonalData.password.rawValue {
                return true
            } else {
                let alert = UIAlertController(
                    title: "Invalid login or password",
                    message: "Please, enter correct login or password.",
                    preferredStyle: .alert
                )
                
                alert.addAction(UIAlertAction(
                    title: "OK",
                    style: .default,
                    handler: { _ in
                        self.userNameTF.text = nil
                        self.passwordTF.text = nil
                    }
                ))
                
                present(alert, animated: true)
                
                return false
            }
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let logOutVC = segue.destination as? LogOutViewController
        if let currentUser = userNameTF.text {
            logOutVC?.userName = currentUser
        }
    }
    
    @IBAction func showSupportingInformationDidTapped(_ sender: UIButton) {
        switch sender {
        case supportButtonForPassword:
            setupSupportAlert(for: .password)
        default:
            setupSupportAlert(for: .login)
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = nil
        passwordTF.text = nil
    }
}

//MARK: - Method and enumeration for alert windows
extension LogInViewController {
    // Создал перечисление, чтобы в методе setupSupportAlert(for:) не дублировать создание UIAlertController
    enum PersonalData: String {
        case login = "purpuser"
        case password = "121"
    }
    
    private func setupSupportAlert(for personalData: PersonalData) {
        let alert = UIAlertController(
            title: "Support",
            message: "Your \(personalData) is \(personalData.rawValue)",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert, animated: true)
    }
}
