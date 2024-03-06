//
//  AuthViewModel.swift
//  mAgI
//
//  Created by Zheng Taing on 2/23/24.
//

import Foundation



class AuthViewModel: ObservableObject{
//    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    
    init(){

    }
    
    func logIn(withUsername username: String, password: String) async throws{
        print("Sign In...")
        
    }
    
    func createUser(withEmail email: String, username: String, password: String) async throws{
        print("creating user...")
    }
    
    func signOut(){}
    
    func deleteAccount(){}
    
    func fetchUser() async{}
    
}
