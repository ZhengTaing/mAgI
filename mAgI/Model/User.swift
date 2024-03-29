//
//  User.swift
//  mAgI
//
//  Created by Zheng Taing on 2/12/24.
//

import Foundation

struct User: Identifiable, Codable{
    let id: String
    let username: String
    let email: String
    
    var initable: String{
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: username){
            formatter.style = .abbreviated
            return formatter.string(from: components)
            }
        return ""
        }
    }


extension User{
    static var MOCK_USER = User(id: NSUUID().uuidString, username: "@zhengtaing", email: "test@gmail.com")
}
