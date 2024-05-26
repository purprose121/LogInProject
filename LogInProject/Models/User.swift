//
//  User.swift
//  LogInProject
//
//  Created by Андрей Ордынский on 23.05.2024.
//

import UIKit

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserInfo() -> User {
        User(
            login: "purpuser",
            password: "121",
            person: Person(
                name: "Andrey",
                surname: "Ordynsky",
                company: "Jedi Council",
                department: "Jedi Academy",
                jobTitle: "Youngling",
                bio: "A long time ago in a galaxy far, far away...",
                photo: UIImage(resource: .EC_12_E_078_998_B_4_C_7_E_98_AB_145_BC_14_A_865_B)
            )
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let company: String
    let department: String
    let jobTitle: String
    let bio: String
    let photo: UIImage
    
    func getFullName() -> String {
        "\(name) \(surname)"
    }
}
