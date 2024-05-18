//
//  User.swift
//  SwiftUIinPractice
//
//  Created by Berkay Tuncel on 14.05.2024.
//

import Foundation

struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let email, phone, username, password: String
    let image: String
    let height: Int
    let weight: Double
}

extension User {
    static var mock: User {
        User(
            id: 444,
            firstName: "Berkay",
            lastName: "Tuncel",
            age: 50,
            email: "hi@hi.com",
            phone: "",
            username: "",
            password: "",
            image: Constants.randomImage,
            height: 180,
            weight: 200
        )
    }
}
