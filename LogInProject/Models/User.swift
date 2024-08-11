//
//  User.swift
//  LogInProject
//
//  Created by Андрей Ордынский on 23.05.2024.
//

import UIKit

struct User {
    let id = UUID()
    let login: String
    let password: String
    let person: Person
    
    static func getUserInfo() -> User {
        User(
            login: "purpuser",
            password: "121",
            person: Person.getPerson()
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
    let photo: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(
            name: "Andrey",
            surname: "Odynsky",
            company: "Jedi Council",
            department: "Jedi Academy",
            jobTitle: "Youngling",
            bio: "A long time ago in a galaxy far, far away...",
            photo: "EC12E078-998B-4C7E-98AB-145BC14A865B"
        )
    }
}
