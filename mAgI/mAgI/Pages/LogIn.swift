//
//  LogIn.swift
//  mAgI
//
//  Created by Zheng Taing on 2/12/24.
//

import SwiftUI

struct LogIn: View {
    @State private var username = ""
    @State private var password = ""
    @StateObject var viewModel = AuthViewModel()
    
    var body: some View {
        NavigationStack{
            VStack {
                //logo
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height:120)
                
                
                VStack(spacing: 24){
                    InputView(text: $username,
                              title: "Username",
                              placeholder: "Enter your username")
                    .autocapitalization(.none)
                    
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password")
                    .autocapitalization(.none)
                    
                }
                .padding(.horizontal,15)
                .padding(.top,150)
                //  Spacer()
                
                //Sign in button
                
                Button{
                    Task{
                        try await viewModel.logIn(withUsername: username , password:password)
                    }
                } label: {
                    HStack{
                        NavigationLink{
                            HomeScreen()
                                .navigationBarBackButtonHidden(true)
                        }label: {
                            
                            Text("Log In")
                                .foregroundColor(Color(.white))
                                .font(.custom("Apple SD Gothic Neo Bold", size: 15.0))
                            Image("login")
                                .resizable()
                                .frame(width: 14,height: 15)
                        }
                        
                    }
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width-30, height: 40)
                }
                .background(Color.black)
                .cornerRadius(15)
                .padding(.top,100)
                Spacer()
                
                
                HStack(spacing: 5){
                    Text("Don't have an account?")
                        .font(.custom("Apple SD Gothic Neo R", size: 12.0))
                        .foregroundColor(Color(.black))
                    NavigationLink{
                        Registration()
                            .navigationBarBackButtonHidden(true)
                    }label: {
                        Text("Sign Up !")
                            .font(.custom("Apple SD Gothic Neo Bold", size: 12.0))
                            .foregroundColor(Color(.black))
                    }
                    
                }
            }
            
        }
    }
    
    
    struct LogIn_Previews: PreviewProvider {
        static var previews: some View {
            LogIn()
        }
    }
}
