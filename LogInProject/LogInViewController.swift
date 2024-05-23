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
    let login = "purpuser"
    let password = "121"
    
//MARK: - Override methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        if userNameTF.text == login
            && passwordTF.text == password {
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
        guard let logOutVC = segue.destination as? LogOutViewController else { return }
        logOutVC.userName = login
    }
    
//MARK: - IBActions
    @IBAction func showAlertDidTapped(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Support", message: "Your password is \(password)")
        : showAlert(title: "Support", message: "Your login is \(login)")
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
