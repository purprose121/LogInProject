//
//  LogInViewController.swift
//  LogInProject
//
//  Created by Андрей Ордынский on 20.05.2024.
//

import UIKit

final class LogInViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    //MARK: - Private properties
    private let user = User.getUserInfo()
    
    //MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.text = user.login
        passwordTF.text = user.password
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        if (userNameTF.text, passwordTF.text) == (user.login, user.password) {
            return true
        } else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login or password.",
                textField: passwordTF
            )
            
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? TabBarViewController else {
            return
        }
        
        tabBarVC.user = user
    }
    
    //MARK: - IBActions
    @IBAction func showAlertDidTapped(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Support", message: "Your password is \(user.password)")
        : showAlert(title: "Support", message: "Your login is \(user.login)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = nil
        passwordTF.text = nil
    }
}

//MARK: - Show alert
extension LogInViewController {
    private func showAlert(
        title: String,
        message: String,
        textField: UITextField? = nil
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default
            ) {_ in
                textField?.text = nil
            }
        )
        
        present(alert, animated: true)
    }
}

//MARK: - Show alert before exit
extension UIViewController {
    func showAlertBeforeExit(_ identifier: String) -> Bool {
        if identifier == "logOut" {
            let alert = UIAlertController(
                title: "Are you sure?",
                message: "Do you really want to leave?",
                preferredStyle: .alert
            )
            
            alert.addAction(
                UIAlertAction(title: "Stay", style: .default)
            )
            
            alert.addAction(
                UIAlertAction(title: "Exit", style: .destructive) { _ in
                    self.performSegue(withIdentifier: identifier, sender: self)
                }
            )
            
            present(alert, animated: true)
            
            return false
        } else {
            return true
        }
    }
}
